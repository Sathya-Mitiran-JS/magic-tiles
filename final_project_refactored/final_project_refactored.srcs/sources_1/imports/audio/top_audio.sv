`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// SD Card Audio Player Top Module
//// Reads raw 8-bit 44.1kHz audio from SD card and plays through PWM
////////////////////////////////////////////////////////////////////////////////////

module top_audio (
    input  logic clk_100mhz,        // 100 MHz system clock
    input  logic reset_btn,         // Reset button (active low)
    
    // SD Card Interface
    output logic sd_cs,
    output logic sd_sclk,
    output logic sd_mosi,
    input  logic sd_miso,
    
    // Audio outputs
    output logic audio_left,
    output logic audio_right,
    
    // Status LEDs
    output logic [15:0] led,
    
    // Sample counter output
    output logic [31:0] sample_count_out
);

    // Clock Generation, 100MHz to 50MHz
    logic clk_50mhz;
    logic clk_locked;
    
    clk_wiz_1 clock_gen (
        .clk_in1(clk_100mhz),
        .clk_out1(clk_50mhz),
        .locked(clk_locked)
    );
    
    // Reset Synchronization
    logic system_reset;
    logic user_reset;
    logic reset_sync1, reset_sync2;
    
    always_ff @(posedge clk_50mhz) begin
        reset_sync1 <= ~reset_btn;
        reset_sync2 <= reset_sync1;
        user_reset <= ~reset_sync2;
        system_reset <= !clk_locked;
    end
    
    logic reset;
    assign reset = system_reset || user_reset;
    
    // SD Card Init Module
    logic sd_ram_we;
    logic [24:0] sd_ram_address;
    logic [15:0] sd_ram_data;
    logic sd_init_error;
    logic sd_init_done;
    logic ram_op_begun;
    
    sdcard_init #(
        .MAX_RAM_ADDRESS(25'h1FFFFFF),
        .SDHC(1'b1)
    ) sd_init (
        .clk50(clk_50mhz),
        .reset(reset),
        .ram_we(sd_ram_we),
        .ram_address(sd_ram_address),
        .ram_data(sd_ram_data),
        .ram_op_begun(ram_op_begun),
        .ram_init_error(sd_init_error),
        .ram_init_done(sd_init_done),
        .cs_bo(sd_cs),
        .sclk_o(sd_sclk),
        .mosi_o(sd_mosi),
        .miso_i(sd_miso)
    );
    
    // FIFO Buffer
    logic fifo_wr_en;
    logic [7:0] fifo_din;
    logic fifo_full;
    logic fifo_almost_full;
    
    logic fifo_rd_en;
    logic [7:0] fifo_dout;
    logic fifo_empty;
    logic fifo_almost_empty;
    
    fifo_8bit #(
        .DEPTH(2048)
    ) audio_fifo (
        .clk(clk_50mhz),
        .reset(reset),
        .wr_en(fifo_wr_en),
        .din(fifo_din),
        .full(fifo_full),
        .almost_full(fifo_almost_full),
        .rd_en(fifo_rd_en),
        .dout(fifo_dout),
        .empty(fifo_empty),
        .almost_empty(fifo_almost_empty)
    );
    
    // SD Card to FIFO Interface
    typedef enum logic [1:0] {
        WAIT_DATA,
        WRITE_HIGH,
        WRITE_LOW,
        WAIT_ACK
    } sd_to_fifo_state_t;
    
    sd_to_fifo_state_t fifo_write_state;
    logic [15:0] word_buffer;
    
    always_ff @(posedge clk_50mhz) begin
        if (reset) begin
            fifo_write_state <= WAIT_DATA;
            fifo_wr_en <= 1'b0;
            fifo_din <= 8'h00;
            word_buffer <= 16'h0000;
            ram_op_begun <= 1'b0;
        end else begin
            case (fifo_write_state)
                WAIT_DATA: begin
                    fifo_wr_en <= 1'b0;
                    ram_op_begun <= 1'b0;
                    if (sd_ram_we && !fifo_full) begin
                        word_buffer <= sd_ram_data;
                        ram_op_begun <= 1'b1;
                        fifo_write_state <= WRITE_HIGH;
                    end
                end
                
                WRITE_HIGH: begin
                    ram_op_begun <= 1'b0;
                    if (!fifo_full) begin
                        fifo_din <= word_buffer[15:8];
                        fifo_wr_en <= 1'b1;
                        fifo_write_state <= WRITE_LOW;
                    end
                end
                
                WRITE_LOW: begin
                    if (!fifo_full) begin
                        fifo_din <= word_buffer[7:0];
                        fifo_wr_en <= 1'b1;
                        fifo_write_state <= WAIT_ACK;
                    end else begin
                        fifo_wr_en <= 1'b0;
                    end
                end
                
                WAIT_ACK: begin
                    fifo_wr_en <= 1'b0;
                    fifo_write_state <= WAIT_DATA;
                end
                
                default: fifo_write_state <= WAIT_DATA;
            endcase
        end
    end
    
    // PWM Audio Module
    logic sample_request;
    logic [7:0] audio_sample;
    
    pwm_audio #(
        .CLK_FREQ(50_000_000),
        .SAMPLE_RATE(44100)
    ) pwm (
        .clk(clk_50mhz),
        .reset(reset),
        .audio_sample(audio_sample),
        .sample_request(sample_request),
        .pwm_left(audio_left),
        .pwm_right(audio_right)
    );
    
    // FIFO to PWM Interface with Sample Counter
    typedef enum logic [2:0] {
        AUDIO_IDLE,
        AUDIO_REQUEST,
        AUDIO_WAIT_DATA,
        AUDIO_CAPTURE
    } audio_read_state_t;
    
    audio_read_state_t audio_state;
    logic sample_request_prev;
    logic [7:0] fifo_data_buffer;
    logic [31:0] internal_sample_count;
    
    always_ff @(posedge clk_50mhz) begin
        if (reset) begin
            audio_sample <= 8'h80;
            fifo_rd_en <= 1'b0;
            audio_state <= AUDIO_IDLE;
            sample_request_prev <= 1'b0;
            fifo_data_buffer <= 8'h80;
            internal_sample_count <= 32'b0;
        end else begin
            sample_request_prev <= sample_request;
            
            // Increment counter on each new sample request
            if (sample_request && !sample_request_prev) begin
                internal_sample_count <= internal_sample_count + 1;
            end
            
            case (audio_state)
                AUDIO_IDLE: begin
                    fifo_rd_en <= 1'b0;
                    
                    if (sample_request && !sample_request_prev) begin
                        if (!fifo_empty) begin
                            audio_state <= AUDIO_REQUEST;
                        end else begin
                            audio_sample <= 8'h80;
                        end
                    end
                end
                
                AUDIO_REQUEST: begin
                    fifo_rd_en <= 1'b1;
                    audio_state <= AUDIO_WAIT_DATA;
                end
                
                AUDIO_WAIT_DATA: begin
                    fifo_rd_en <= 1'b0;
                    fifo_data_buffer <= fifo_dout;
                    audio_state <= AUDIO_CAPTURE;
                end
                
                AUDIO_CAPTURE: begin
                    audio_sample <= fifo_data_buffer;
                    audio_state <= AUDIO_IDLE;
                end
                
                default: audio_state <= AUDIO_IDLE;
            endcase
        end
    end
    
    // Output sample counter
    assign sample_count_out = internal_sample_count;
    
    // Status LEDs
    assign led[0] = !fifo_empty;
    assign led[1] = sd_init_error;
    assign led[2] = sd_init_done;
    assign led[3] = fifo_almost_full;
    assign led[4] = fifo_almost_empty;
    assign led[5] = (audio_state != AUDIO_IDLE);
    assign led[6] = user_reset;
    assign led[15:7] = 9'b0;

endmodule