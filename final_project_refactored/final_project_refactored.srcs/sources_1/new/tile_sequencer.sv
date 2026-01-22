//-------------------------------------------------------------------------
// tile_sequencer_rom.sv - Music-Synchronized Tile Sequencer with ROM
//-------------------------------------------------------------------------

module tile_sequencer (
    input  logic        clk,
    input  logic        reset,
    input  logic        game_active,
    
    // Audio Sync
    input  logic [31:0] sample_count, // From audio module
    
    // Outputs to Tile Logic
    output logic        spawn_lane0,
    output logic        spawn_lane1,
    output logic        spawn_lane2,
    output logic        spawn_lane3,
    
    output logic [1:0]  type_lane0,
    output logic [1:0]  type_lane1,
    output logic [1:0]  type_lane2,
    output logic [1:0]  type_lane3
);

    // CONFIGURATION
    // SAMPLES_PER_TICK = (SampleRate * 60) / (BPM * Subdivisions)
    parameter SAMPLES_PER_TICK = 32'd14700;
    parameter LOOKAHEAD_TICKS  = 12'd6; 
    
    // BEAT TRACKER
    logic [11:0] current_tick;
    logic [31:0] next_tick_sample;
    
    always_ff @(posedge clk) begin
        if (reset || !game_active) begin
            current_tick <= 0;
            next_tick_sample <= SAMPLES_PER_TICK;
        end 
        else begin
            // If the audio has played past threshold, advance the tick
            if (sample_count >= next_tick_sample) begin
                current_tick <= current_tick + 1;
                next_tick_sample <= next_tick_sample + SAMPLES_PER_TICK;
            end
        end
    end

    // ROM LOOKUP
    logic [11:0] rom_addr;
    logic [27:0] rom_data_raw;
    
    // Read ahead
    assign rom_addr = current_tick + LOOKAHEAD_TICKS;
    
    tile_rom music_data (
        .clk(clk),
        .addr(rom_addr),
        .data(rom_data_raw)
    );
    
    logic [11:0] tick_delayed;
    logic new_row_ready;
    
    always_ff @(posedge clk) begin
        // Implement 1 cycle delay
        tick_delayed <= current_tick;
    end
    
    // Detect if moved to new row
    assign new_row_ready = (current_tick != tick_delayed);

    // UNPACKING & OUTPUT
    // Only output signals if game is active AND we are on a new row
    logic output_enable;
    assign output_enable = game_active && new_row_ready;

    always_comb begin
        if (output_enable) begin
            // Bit 0-3: Enable
            spawn_lane0 = rom_data_raw[0];
            spawn_lane1 = rom_data_raw[1];
            spawn_lane2 = rom_data_raw[2];
            spawn_lane3 = rom_data_raw[3];
            
            // Bit 4-11: Types
            type_lane0  = rom_data_raw[5:4];
            type_lane1  = rom_data_raw[7:6];
            type_lane2  = rom_data_raw[9:8];
            type_lane3  = rom_data_raw[11:10];
        end 
        else begin
            spawn_lane0 = 0;
            spawn_lane1 = 0;
            spawn_lane2 = 0;
            spawn_lane3 = 0;
            type_lane0  = 0;
            type_lane1  = 0;
            type_lane2  = 0;
            type_lane3  = 0;
        end
    end

endmodule