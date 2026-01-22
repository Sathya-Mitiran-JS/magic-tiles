`timescale 1ns / 1ps

module start_screen (
    input  logic       clk,
    input  logic [9:0] DrawX, DrawY,
    output logic [3:0] s_red, s_green, s_blue
);

    logic is_title;
    logic [3:0] h_red, h_green, h_blue;
    title_hud title_hud_inst (
                .clk(clk),
                .DrawX(DrawX),
                .DrawY(DrawY),
                .is_title(is_title),
                .h_red(h_red),
                .h_green(h_green),
                .h_blue(h_blue)
    );
    
    logic [10:0] font_addr;
    logic [7:0]  font_data;
    logic        text_pixel;
    font_rom font_rom (
        .addr(font_addr),
        .data(font_data)
    );
    
    title_subtext title_subtext_inst (
                .DrawX(DrawX),
                .DrawY(DrawY),
                .font_data(font_data),
                .font_addr(font_addr),
                .text_pixel(text_pixel)
    );

    always_comb begin
        if (is_title) begin
            s_red = h_red;
            s_green = h_green;
            s_blue = h_blue;
        end else if (text_pixel) begin
            s_red = 4'hf;
            s_green = 4'hf;
            s_blue = 4'hf;
        end
        else begin
            s_red = 4'h0;
            s_green = 4'h0;
            s_blue = 4'h0;
        end
    end

endmodule
