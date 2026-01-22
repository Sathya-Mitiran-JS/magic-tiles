`timescale 1ns / 1ps

//-------------------------------------------------------------------------
// color_mapper.sv - Graphics Controller
//-------------------------------------------------------------------------

module color_mapper (
    input  logic clk, vde,
    input  logic [9:0] DrawX, DrawY,
    // Lane Inputs
    input  logic [9:0] tile1_y [3:0], tile2_y [3:0], tile3_y [3:0], tile4_y [3:0],
    input  logic [3:0] tile1_active, tile2_active, tile3_active, tile4_active,
    input  logic [3:0] tile1_hit, tile2_hit, tile3_hit, tile4_hit,
    input  logic [1:0] tile1_accuracy [3:0], tile2_accuracy [3:0], 
                       tile3_accuracy [3:0], tile4_accuracy [3:0],
    // State machine input
    input  logic [1:0] state,
    // Game State Inputs
    input  logic [15:0] score,
    input  logic [1:0]  lives,
    input  logic        game_over, missed_tile,
    output logic [3:0]  Red, Green, Blue
);

    // --- Lane Logic Instantiation ---
    logic l1_on, l2_on, l3_on, l4_on;
    logic [3:0] l1_r, l1_g, l1_b, l2_r, l2_g, l2_b, l3_r, l3_g, l3_b, l4_r, l4_g, l4_b;
    

    // Instantiate 4 lanes
    lane_renderer lane1 (.DrawX(DrawX),
                         .DrawY(DrawY),
                         .Lane_Left(10'd0),
                         .Lane_Right(10'd159), 
                         .tile_y(tile1_y),
                         .active(tile1_active),
                         .hit(tile1_hit),
                         .accuracy(tile1_accuracy),
                         .is_tile(l1_on),
                         .tile_r(l1_r),
                         .tile_g(l1_g),
                         .tile_b(l1_b));

    lane_renderer lane2 (.DrawX(DrawX),
                         .DrawY(DrawY),
                         .Lane_Left(10'd160),
                         .Lane_Right(10'd319), 
                         .tile_y(tile2_y),
                         .active(tile2_active),
                         .hit(tile2_hit),
                         .accuracy(tile2_accuracy),
                         .is_tile(l2_on),
                         .tile_r(l2_r),
                         .tile_g(l2_g),
                         .tile_b(l2_b));

    lane_renderer lane3 (.DrawX(DrawX),
                         .DrawY(DrawY),
                         .Lane_Left(10'd320),
                         .Lane_Right(10'd479), 
                         .tile_y(tile3_y),
                         .active(tile3_active),
                         .hit(tile3_hit),
                         .accuracy(tile3_accuracy),
                         .is_tile(l3_on),
                         .tile_r(l3_r),
                         .tile_g(l3_g),
                         .tile_b(l3_b));
                         
    lane_renderer lane4 (.DrawX(DrawX),
                         .DrawY(DrawY),
                         .Lane_Left(10'd480),
                         .Lane_Right(10'd639), 
                         .tile_y(tile4_y),
                         .active(tile4_active),
                         .hit(tile4_hit),
                         .accuracy(tile4_accuracy),
                         .is_tile(l4_on),
                         .tile_r(l4_r),
                         .tile_g(l4_g),
                         .tile_b(l4_b));

    // --- Heart/HUD Instantiation ---
    logic heart_on;
    logic [3:0] heart_r, heart_g, heart_b;

    heart_hud hud (
        .clk(clk), .DrawX(DrawX), .DrawY(DrawY), .lives(lives),
        .is_heart(heart_on), .h_red(heart_r), .h_green(heart_g), .h_blue(heart_b)
    );

    // --- Text/Score Logic ---
    logic [7:0] font_data;
    logic [10:0] font_addr_score, font_addr_end;
    logic score_on, end_text_on;
    
    logic [10:0] font_addr_mux;
    assign font_addr_mux = (state == 2'b10) ? font_addr_end : font_addr_score;
    
    font_rom font_rom (
        .addr(font_addr_mux),
        .data(font_data)
    );
    
    score_display score_display_inst (
        .DrawX(DrawX),
        .DrawY(DrawY),
        .score(score),
        .font_data(font_data),
        .font_addr(font_addr_score),
        .score_pixel(score_on)
    );
    
    end_display end_display_inst (
        .DrawX(DrawX),
        .DrawY(DrawY),
        .score(score),
        .font_data(font_data),
        .font_addr(font_addr_end),
        .text_pixel(end_text_on)
    );
    
    logic [3:0] s_red, s_green, s_blue;
    start_screen start_inst (
        .clk(clk),
        .DrawX(DrawX),
        .DrawY(DrawY),
        .s_red(s_red),
        .s_green(s_green),
        .s_blue(s_blue)
    );
    
    // --- Background & Lane Logic ---
    logic in_lane1, in_lane2, in_lane3, in_lane4;
    assign in_lane1 = (DrawX < 160);
    assign in_lane2 = (DrawX >= 160 && DrawX < 320);
    assign in_lane3 = (DrawX >= 320 && DrawX < 480);
    assign in_lane4 = (DrawX >= 480);

    logic divider_on; 
    assign divider_on = (DrawX == 159 || DrawX == 319 || DrawX == 479);

    logic hit_zone_on;
    assign hit_zone_on = (DrawY >= 380 && DrawY <= 479);


    // --- Final Output Multiplexer ---
    always_ff @(posedge clk) begin
        if (!vde) begin
            Red <= 4'h0;
            Green <= 4'h0;
            Blue <= 4'h0;
        end
        else begin
            unique case (state)
                2'b00: begin
                    Red <= s_red;
                    Green <= s_green;
                    Blue <= s_blue;
                end
                
                2'b01: begin
                    // Flash Red on Miss
                    if (missed_tile && hit_zone_on && !game_over) begin
                         Red <= 4'hF;
                         Green <= 4'h0;
                         Blue <= 4'h0;
                    end
                    // Hearts (Lives)
                    else if (heart_on) begin
                        Red <= heart_r;
                        Green <= heart_g;
                        Blue <= heart_b;
                    end
                    // Score Text
                    else if (score_on) begin
                        Red <= 4'hd;
                        Green <= 4'ha;
                        Blue <= 4'h2;
                    end
                    // Tiles (Layered over lanes)
                    else if (l1_on) begin
                        Red <= l1_r;
                        Green <= l1_g;
                        Blue <= l1_b;
                    end
                    else if (l2_on) begin
                        Red <= l2_r;
                        Green <= l2_g;
                        Blue <= l2_b;
                    end
                    else if (l3_on) begin
                        Red <= l3_r;
                        Green <= l3_g;
                        Blue <= l3_b;
                    end
                    else if (l4_on) begin
                        Red <= l4_r;
                        Green <= l4_g;
                        Blue <= l4_b;
                    end
                    // Lane Dividers
                    else if (divider_on) begin
                        Red <= 4'hf;
                        Green <= 4'hf;
                        Blue <= 4'hf;
                    end
                    // Hit Zone Overlay
                    else if (hit_zone_on) begin
                         Red <= 4'h4;
                         Green <= 4'h8;
                         Blue <= 4'h4;
                    end
                    // Background Gradients
                    else begin
                        if (in_lane1) begin
                            Red <= 4'h4;
                            Green <= 4'ha;
                            Blue <= 4'hf;
                        end
                        else if (in_lane2) begin
                            Red <= 4'h6;
                            Green <= 4'h9;
                            Blue <= 4'hf;
                        end
                        else if (in_lane3) begin
                            Red <= 4'h8;
                            Green <= 4'h7;
                            Blue <= 4'he;
                        end
                        else begin
                            Red <= 4'ha;
                            Green <= 4'h5;
                            Blue <= 4'hd;
                        end
                    end
                end
            
                2'b10: begin // Game Over Overlay
                    if (end_text_on) begin
                        Red <= 4'hF;
                        Green <= 4'hF;
                        Blue <= 4'hF;
                    end
                    else begin // Dimmed BG
                        Red <= 4'h2;
                        Green <= 4'h2;
                        Blue <= 4'h2;
                    end
                end
                
                default: begin
                    Red <= 4'h0;
                    Green <= 4'h0;
                    Blue <= 4'h0;
                end
            endcase
        end
    end

endmodule