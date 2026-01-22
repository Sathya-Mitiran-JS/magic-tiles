`timescale 1ns / 1ps

module title_hud (
    input  logic        clk,
    input  logic [9:0]  DrawX, DrawY,
    output logic        is_title,
    output logic [3:0]  h_red, h_green, h_blue
);

    parameter TITLE_X_START = 10'd200;
    parameter TITLE_Y       = 10'd240;
    parameter TITLE_W       = 10'd240;
    parameter TITLE_H       = 10'd50;

    // Internal signals
    logic       in_draw_area;
    logic [9:0] rel_x, rel_y;
    logic [13:0] rom_addr;
    logic [7:0] rom_data;
    logic [3:0] pal_r, pal_g, pal_b;

    // Calculate Geometry
    always_comb begin
        in_draw_area = 1'b0;
        rel_x = '0; 
        rel_y = '0;
        
        if (DrawX >= TITLE_X_START &&
            DrawX <  TITLE_X_START + TITLE_W &&
            DrawY >= TITLE_Y &&
            DrawY < TITLE_Y + TITLE_H) 
        begin
            in_draw_area = 1'b1;
            rel_x = DrawX - TITLE_X_START;
            rel_y = DrawY - TITLE_Y;
        end
    end

    // ROM Interface
    assign rom_addr = in_draw_area ? (rel_x + rel_y * TITLE_W) : 14'b0;

    title_rom title_rom_inst (
        .clka(~clk), 
        .addra(rom_addr), 
        .douta(rom_data)
    );

    title_palette title_pal_inst (
        .index(rom_data), 
        .Red(pal_r), .Green(pal_g), .Blue(pal_b)
    );

    // Final Output Logic
    logic is_transparent;
    assign is_transparent = (pal_r == 4'hF && pal_g == 4'h0 && pal_b == 4'hF);

    assign is_title = in_draw_area && !is_transparent && 
                      (rom_data != 0);
                      
    assign h_red = pal_r;
    assign h_green = pal_g;
    assign h_blue = pal_b;

endmodule
