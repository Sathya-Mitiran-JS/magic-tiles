//-------------------------------------------------------------------------
//    mb_usb_hdmi_top.sv - Magic Tiles Game                              --
//-------------------------------------------------------------------------

module mb_usb_hdmi_top(
    input logic Clk,
    input logic reset_rtl_0,
    
    //USB signals
    input logic [0:0] gpio_usb_int_tri_i,
    output logic gpio_usb_rst_tri_o,
    input logic usb_spi_miso,
    output logic usb_spi_mosi,
    output logic usb_spi_sclk,
    output logic usb_spi_ss,
    
    //UART
    input logic uart_rtl_0_rxd,
    output logic uart_rtl_0_txd,
    
    //HDMI
    output logic hdmi_tmds_clk_n,
    output logic hdmi_tmds_clk_p,
    output logic [2:0]hdmi_tmds_data_n,
    output logic [2:0]hdmi_tmds_data_p,
        
    //HEX displays
    output logic [7:0] hex_segA,
    output logic [3:0] hex_gridA,
    output logic [7:0] hex_segB,
    output logic [3:0] hex_gridB,
    
    input logic [31:0] sample_count,
    output logic [1:0] state
);
    
    logic [31:0] keycode0_gpio, keycode1_gpio;
    logic clk_25MHz, clk_125MHz;
    logic locked;
    logic [9:0] drawX, drawY;

    logic hsync, vsync, vde;
    logic [3:0] red, green, blue;
    logic reset_ah;
    
    // Game signals - arrays for multiple tiles per lane
    logic [9:0] tile1_y [3:0];
    logic [9:0] tile2_y [3:0];
    logic [9:0] tile3_y [3:0];
    logic [9:0] tile4_y [3:0];
    logic [3:0] tile1_active, tile2_active, tile3_active, tile4_active;
    logic [3:0] tile1_hit, tile2_hit, tile3_hit, tile4_hit;
    logic [1:0] tile1_accuracy [3:0];
    logic [1:0] tile2_accuracy [3:0];
    logic [1:0] tile3_accuracy [3:0];
    logic [1:0] tile4_accuracy [3:0];
    logic [15:0] score;
    logic [1:0] lives;
    logic game_over;
    logic missed_tile;
    logic frame_tick;
    
    assign reset_ah = reset_rtl_0;
    
    localparam SONG_END_SAMPLES = 32'd20372646;
    logic song_done;
    assign song_done = (sample_count_synced >= SONG_END_SAMPLES);
    
    // Generate frame tick from vsync FALLING edge (correct for VGA timing)
    logic vsync_prev;
    always_ff @(posedge clk_25MHz) begin
        if (reset_ah) begin
            vsync_prev <= 1'b1;
            frame_tick <= 1'b0;
        end else begin
            vsync_prev <= vsync;
            frame_tick <= (~vsync) & vsync_prev; // Falling edge = new frame
        end
    end

    // Clock domain crossing synchronizes sample_count to 25MHz domain
    logic [31:0] sample_count_synced;
    
    sample_count_sync cdc_sync (
        .clk_src(Clk),              // 100MHz audio clock
        .clk_dest(clk_25MHz),       // 25MHz VGA clock
        .reset(reset_ah),
        .count_in(sample_count),    // From audio subsystem
        .count_out(sample_count_synced) // Synchronized to VGA clock
    );
    
    //Keycode HEX drivers
    hex_driver HexA (
        .clk(Clk),
        .reset(reset_ah),
        .in({score[15:12], score[11:8], score[7:4], score[3:0]}),
        .hex_seg(hex_segA),
        .hex_grid(hex_gridA)
    );
    
    hex_driver HexB (
        .clk(Clk),
        .reset(reset_ah),
        .in({4'b0, {2'b0, lives}, keycode0_gpio[7:4], keycode0_gpio[3:0]}),
        .hex_seg(hex_segB),
        .hex_grid(hex_gridB)
    );
    
    // Block diagram instance
    mb_usb mb_block_i (
        .clk_100MHz(Clk),
        .gpio_usb_int_tri_i(gpio_usb_int_tri_i),
        .gpio_usb_keycode_0_tri_o(keycode0_gpio),
        .gpio_usb_keycode_1_tri_o(keycode1_gpio),
        .gpio_usb_rst_tri_o(gpio_usb_rst_tri_o),
        .reset_rtl_0(~reset_ah),
        .uart_rtl_0_rxd(uart_rtl_0_rxd),
        .uart_rtl_0_txd(uart_rtl_0_txd),
        .usb_spi_miso(usb_spi_miso),
        .usb_spi_mosi(usb_spi_mosi),
        .usb_spi_sclk(usb_spi_sclk),
        .usb_spi_ss(usb_spi_ss)
    );
        
    //clock wizard configured with a 1x and 5x clock for HDMI
    clk_wiz_0 clk_wiz (
        .clk_out1(clk_25MHz),
        .clk_out2(clk_125MHz),
        .reset(reset_ah),
        .locked(locked),
        .clk_in1(Clk)
    );
    
    //VGA Sync signal generator
    vga_controller vga (
        .pixel_clk(clk_25MHz),
        .reset(reset_ah),
        .hs(hsync),
        .vs(vsync),
        .active_nblank(vde),
        .drawX(drawX),
        .drawY(drawY)
    );    

    //Real Digital VGA to HDMI converter
    hdmi_tx_0 vga_to_hdmi (
        .pix_clk(clk_25MHz),
        .pix_clkx5(clk_125MHz),
        .pix_clk_locked(locked),
        .rst(reset_ah),
        .red(red),
        .green(green),
        .blue(blue),
        .hsync(hsync),
        .vsync(vsync),
        .vde(vde),
        .TMDS_CLK_P(hdmi_tmds_clk_p),          
        .TMDS_CLK_N(hdmi_tmds_clk_n),          
        .TMDS_DATA_P(hdmi_tmds_data_p),         
        .TMDS_DATA_N(hdmi_tmds_data_n)          
    );

    // FSM instance
    game_control game_control_inst (
        .clk(clk_25MHz),
        .Reset(reset_ah),
        .keycode(keycode0_gpio[7:0]),
        .lives(lives),
        .state(state),
        .song_done(song_done)
    );
    
    logic seq_s0, seq_s1, seq_s2, seq_s3;
    
    // Tile Sequencer
    tile_sequencer sequencer (
        .clk(clk_25MHz),
        .reset(reset_ah),
        .game_active(state == 2'b01),
        .sample_count(sample_count_synced),
        
        .spawn_lane0(seq_s0),
        .spawn_lane1(seq_s1),
        .spawn_lane2(seq_s2),
        .spawn_lane3(seq_s3),
        
        .type_lane0(), .type_lane1(), .type_lane2(), .type_lane3()
    );
    
    logic game_reset;
    assign game_reset = reset_ah || (state == 2'b00);
    
    // Tile Game Logic Module
    tile_logic game_logic(
        .clk(clk_25MHz),
        .Reset(game_reset),
        .frame_clk(frame_tick),
        .keycode(keycode0_gpio[7:0]),
        .spawn_lane0(seq_s0),
        .spawn_lane1(seq_s1),
        .spawn_lane2(seq_s2),
        .spawn_lane3(seq_s3),
        .tile1_y(tile1_y),
        .tile2_y(tile2_y),
        .tile3_y(tile3_y),
        .tile4_y(tile4_y),
        .tile1_active(tile1_active),
        .tile2_active(tile2_active),
        .tile3_active(tile3_active),
        .tile4_active(tile4_active),
        .tile1_hit(tile1_hit),
        .tile2_hit(tile2_hit),
        .tile3_hit(tile3_hit),
        .tile4_hit(tile4_hit),
        .tile1_accuracy(tile1_accuracy),
        .tile2_accuracy(tile2_accuracy),
        .tile3_accuracy(tile3_accuracy),
        .tile4_accuracy(tile4_accuracy),
        .score(score),
        .lives(lives),
        .game_over(game_over),
        .missed_tile(missed_tile)
    );
    
    // Color Mapper Module   
    color_mapper color_instance(
        .clk(clk_25MHz),
        .DrawX(drawX),
        .DrawY(drawY),
        .vde(vde),
        .tile1_y(tile1_y),
        .tile2_y(tile2_y),
        .tile3_y(tile3_y),
        .tile4_y(tile4_y),
        .tile1_active(tile1_active),
        .tile2_active(tile2_active),
        .tile3_active(tile3_active),
        .tile4_active(tile4_active),
        .tile1_hit(tile1_hit),
        .tile2_hit(tile2_hit),
        .tile3_hit(tile3_hit),
        .tile4_hit(tile4_hit),
        .tile1_accuracy(tile1_accuracy),
        .tile2_accuracy(tile2_accuracy),
        .tile3_accuracy(tile3_accuracy),
        .tile4_accuracy(tile4_accuracy),
        .state(state),
        .score(score),
        .lives(lives),
        .game_over(game_over),
        .missed_tile(missed_tile),
        .Red(red),
        .Green(green),
        .Blue(blue)
    );
    
endmodule
