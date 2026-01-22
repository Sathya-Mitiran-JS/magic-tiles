`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 8-bit FIFO Buffer for Audio Streaming
// Simple circular buffer implementation
// AI was used to assist in the creation of this file
//////////////////////////////////////////////////////////////////////////////////

module fifo_8bit #(
    parameter DEPTH = 2048  // FIFO depth (number of 8-bit entries)
)(
    input  logic        clk,
    input  logic        reset,
    
    // Write interface (from SD card)
    input  logic        wr_en,
    input  logic [7:0]  din,
    output logic        full,
    output logic        almost_full,
    
    // Read interface (to PWM audio)
    input  logic        rd_en,
    output logic [7:0]  dout,
    output logic        empty,
    output logic        almost_empty
);

    // FIFO memory
    logic [7:0] mem [0:DEPTH-1];
    
    // Pointers
    logic [$clog2(DEPTH):0] wr_ptr;  // Extra bit for full/empty distinction
    logic [$clog2(DEPTH):0] rd_ptr;
    
    // Calculate count
    logic [$clog2(DEPTH):0] count;
    assign count = wr_ptr - rd_ptr;
    
    // Status flags
    assign empty = (count == 0);
    assign full = (count == DEPTH);
    assign almost_empty = (count < 256);      // Less than 256 bytes
    assign almost_full = (count > (DEPTH - 256));  // Less than 256 bytes free
    
    // Write pointer and data
    always_ff @(posedge clk) begin
        if (reset) begin
            wr_ptr <= 0;
        end else if (wr_en && !full) begin
            mem[wr_ptr[$clog2(DEPTH)-1:0]] <= din;
            wr_ptr <= wr_ptr + 1;
        end
    end
    
    // Read pointer and data
    always_ff @(posedge clk) begin
        if (reset) begin
            rd_ptr <= 0;
            dout <= 8'h80;  // Silence
        end else if (rd_en && !empty) begin
            dout <= mem[rd_ptr[$clog2(DEPTH)-1:0]];
            rd_ptr <= rd_ptr + 1;
        end
    end

endmodule