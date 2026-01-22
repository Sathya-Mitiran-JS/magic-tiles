`timescale 1ns / 1ps
//-------------------------------------------------------------------------
// lane_renderer.sv - Lane Color Renderer for Color Mapper
//-------------------------------------------------------------------------

module lane_renderer (
    input  logic [9:0] DrawX, DrawY,
    input  logic [9:0] Lane_Left, Lane_Right,
    input  logic [9:0] tile_y [3:0],
    input  logic [3:0] active, hit,
    input  logic [1:0] accuracy [3:0],
    output logic       is_tile,
    output logic [3:0] tile_r, tile_g, tile_b
);

    parameter TILE_WIDTH  = 10'd140;
    parameter TILE_HEIGHT = 10'd80;
    parameter TILE_MARGIN = 10'd10;

    logic [1:0] current_acc;
    logic current_hit;

    always_comb begin
        is_tile = 1'b0;
        current_acc = 2'b00;
        current_hit = 1'b0;

        // Loop through the 4 potential tiles in this lane
        for (int i = 0; i < 4; i++) begin
            if (active[i] &&
                (DrawX >= Lane_Left + TILE_MARGIN && DrawX <= Lane_Left + TILE_MARGIN + TILE_WIDTH) &&
                (DrawY >= tile_y[i] && DrawY <= tile_y[i] + TILE_HEIGHT)) 
            begin
                is_tile = 1'b1;
                current_hit = hit[i];
                current_acc = accuracy[i];
            end
        end
    end

    // Determine Color based on state
    always_comb begin
        if (!is_tile) begin
            {tile_r, tile_g, tile_b} = 12'h000;
        end else if (current_hit) begin
            unique case (current_acc)
                2'b11: begin // Perfect - Gold
                    tile_r = 4'he;
                    tile_g = 4'hc;
                    tile_b = 4'h1;
                end
                2'b10: begin // Great - Light Blue
                    tile_r = 4'h9;
                    tile_g = 4'hd;
                    tile_b = 4'hf;
                end
                2'b01: begin // Cool - Gray
                    tile_r = 4'h8;
                    tile_g = 4'h8;
                    tile_b = 4'h8;
                end
                default: begin
                    tile_r = 4'h0;
                    tile_g = 4'h0;
                    tile_b = 4'h0;
                end
            endcase
        end else begin // Normal tile - Black
            tile_r = 4'h0;
            tile_g = 4'h0;
            tile_b = 4'h0;
        end
    end

endmodule
