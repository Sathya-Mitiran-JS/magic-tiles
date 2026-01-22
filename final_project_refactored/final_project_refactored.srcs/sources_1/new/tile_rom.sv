`timescale 1ns / 1ps
//-------------------------------------------------------------------------
// tile_sequencer_rom.sv - Tile data stored in memory
// Data created with Python script
// AI was used to assist in the creation of this file
//-------------------------------------------------------------------------

module tile_rom (
    input  logic        clk,
    input  logic [11:0] addr,
    output logic [27:0] data // 28-bit wide data
);

    logic [27:0] rom_memory [0:4095];

    initial begin
        $readmemh("song.mem", rom_memory);
    end

    always_ff @(posedge clk) begin
        data <= rom_memory[addr];
    end

endmodule
