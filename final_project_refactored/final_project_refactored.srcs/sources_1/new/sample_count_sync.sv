`timescale 1ns / 1ps
//-------------------------------------------------------------------------
// sample_count_sync.sv - Clock Domain Crossing Synchronizer
// AI was used to assist in the creation of this file
//-------------------------------------------------------------------------

module sample_count_sync (
    input  logic        clk_src,      // 100MHz audio clock
    input  logic        clk_dest,     // 25MHz VGA clock
    input  logic        reset,
    input  logic [31:0] count_in,     // sample_count from audio
    output logic [31:0] count_out     // synchronized to VGA clock
);

    // Gray code conversion for safe multi-bit CDC
    logic [31:0] count_gray_src;
    logic [31:0] count_gray_sync1, count_gray_sync2;
    logic [31:0] count_binary_dest;
    
    // Convert binary to gray in source domain
    always_ff @(posedge clk_src or posedge reset) begin
        if (reset)
            count_gray_src <= 32'b0;
        else
            count_gray_src <= count_in ^ (count_in >> 1);
    end
    
    // Two-stage synchronizer in destination domain
    always_ff @(posedge clk_dest or posedge reset) begin
        if (reset) begin
            count_gray_sync1 <= 32'b0;
            count_gray_sync2 <= 32'b0;
        end else begin
            count_gray_sync1 <= count_gray_src;  // First stage
            count_gray_sync2 <= count_gray_sync1; // Second stage
        end
    end
    
    // Convert gray back to binary in destination domain
    integer i;
    always_comb begin
        count_binary_dest[31] = count_gray_sync2[31];
        for (i = 30; i >= 0; i = i - 1) begin
            count_binary_dest[i] = count_binary_dest[i+1] ^ count_gray_sync2[i];
        end
    end
    
    // Register output
    always_ff @(posedge clk_dest or posedge reset) begin
        if (reset)
            count_out <= 32'b0;
        else
            count_out <= count_binary_dest;
    end

endmodule

