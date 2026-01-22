`timescale 1ns / 1ps

module heart_hud (
    input  logic        clk,
    input  logic [9:0]  DrawX, DrawY,
    input  logic [1:0]  lives,
    output logic        is_heart,
    output logic [3:0]  h_red, h_green, h_blue
);

    parameter HEART_X_START = 10'd20;
    parameter HEART_Y       = 10'd20;
    parameter HEART_SPACING = 10'd25;
    parameter HEART_W       = 10'd16;
    parameter HEART_H       = 10'd16;

    // Internal signals
    logic [1:0] current_heart_idx;
    logic       in_draw_area;
    logic [9:0] rel_x, rel_y;
    logic [7:0] rom_addr, rom_data;
    logic [3:0] pal_r, pal_g, pal_b;

    // Calculate Geometry
    always_comb begin
        in_draw_area = 1'b0;
        current_heart_idx = 2'b00;
        rel_x = '0; 
        rel_y = '0;

        for (int i = 0; i < 3; i++) begin
            if (DrawX >= HEART_X_START + i * HEART_SPACING &&
                DrawX <  HEART_X_START + i * HEART_SPACING + HEART_W &&
                DrawY >= HEART_Y && DrawY < HEART_Y + HEART_H) 
            begin
                in_draw_area = 1'b1;
                current_heart_idx = i[1:0];
                rel_x = DrawX - (HEART_X_START + i * HEART_SPACING);
                rel_y = DrawY - HEART_Y;
            end
        end
    end

    // ROM Interface
    assign rom_addr = in_draw_area ? (rel_x + rel_y * HEART_W) : 8'b0;

    heart_rom heart_rom_inst (
        .clka(~clk), 
        .addra(rom_addr), 
        .douta(rom_data)
    );

    heart_palette heart_pal_inst (
        .index(rom_data), 
        .Red(pal_r), .Green(pal_g), .Blue(pal_b)
    );

    // Final Output Logic
    logic is_transparent;
    assign is_transparent = (pal_r == 4'h0 && pal_g == 4'hF && pal_b == 4'h0);

    assign is_heart = in_draw_area && !is_transparent && 
                      (rom_data != 0) && (current_heart_idx < lives);
                      
    assign h_red = pal_r;
    assign h_green = pal_g;
    assign h_blue = pal_b;

endmodule
