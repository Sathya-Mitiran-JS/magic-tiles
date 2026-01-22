//-------------------------------------------------------------------------
//    end_display.sv - Game Over screen display using font_rom
//    AI was used to write the keycodes
//-------------------------------------------------------------------------

module end_display(
    input  logic [9:0] DrawX, DrawY,
    input  logic [15:0] score,
    input  logic [7:0] font_data,     // Data from font_rom
    output logic [10:0] font_addr,    // Address to font_rom
    output logic text_pixel           // Output: 1 if drawing text
);

    // Display parameters
    parameter [9:0] CHAR_WIDTH = 10'd16;    // Character width (8 pixels x2)
    parameter [9:0] CHAR_HEIGHT = 10'd16;   // Character height (16 rows)
    
    // Line positions (centered on 640px screen)
    parameter [9:0] LINE1_X = 10'd216;      // "GAME OVER!" (10 chars * 16 = 160, centered: (640-160)/2 = 240)
    parameter [9:0] LINE1_Y = 10'd200;
    parameter [9:0] LINE1_CHARS = 10'd10;
    
    parameter [9:0] LINE2_X = 10'd168;      // "Final Score: 0000" (17 chars * 16 = 272, centered: (640-272)/2 = 184)
    parameter [9:0] LINE2_Y = 10'd240;
    parameter [9:0] LINE2_CHARS = 10'd17;
    
    parameter [9:0] LINE3_X = 10'd168;      // "Press 'r' to restart" (20 chars * 16 = 320, centered: (640-320)/2 = 160)
    parameter [9:0] LINE3_Y = 10'd280;
    parameter [9:0] LINE3_CHARS = 10'd20;
    
    // Line detection
    logic in_line1, in_line2, in_line3;
    logic [4:0] char_index;  // Extended to [4:0] to support up to 32 characters (0-31)
    logic [9:0] char_x_offset, char_y_offset;
    logic [6:0] char_code;
    logic [3:0] y_pixel;
    logic [2:0] x_pixel;
    logic font_pixel;
    
    // Extract digits from score (BCD conversion)
    logic [3:0] digit_thousands, digit_hundreds, digit_tens, digit_ones;
    always_comb begin
        digit_thousands = (score / 1000) % 10;
        digit_hundreds = (score / 100) % 10;
        digit_tens = (score / 10) % 10;
        digit_ones = score % 10;
    end
    
    // Check which line we're in
    assign in_line1 = (DrawX >= LINE1_X && 
                       DrawX < LINE1_X + LINE1_CHARS * CHAR_WIDTH &&
                       DrawY >= LINE1_Y && 
                       DrawY < LINE1_Y + CHAR_HEIGHT);
    
    assign in_line2 = (DrawX >= LINE2_X && 
                       DrawX < LINE2_X + LINE2_CHARS * CHAR_WIDTH &&
                       DrawY >= LINE2_Y && 
                       DrawY < LINE2_Y + CHAR_HEIGHT);
    
    assign in_line3 = (DrawX >= LINE3_X && 
                       DrawX < LINE3_X + LINE3_CHARS * CHAR_WIDTH &&
                       DrawY >= LINE3_Y && 
                       DrawY < LINE3_Y + CHAR_HEIGHT);
    
    // Calculate character and pixel positions
    always_comb begin
        // Default values
        char_code = 7'h20;  // Space
        y_pixel = 4'h0;
        x_pixel = 3'h0;
        font_pixel = 1'b0;
        
        if (in_line1) begin
            // "GAME OVER!"
            char_x_offset = DrawX - LINE1_X;
            char_y_offset = DrawY - LINE1_Y;
            char_index = char_x_offset / CHAR_WIDTH;
            x_pixel = (char_x_offset % CHAR_WIDTH) >> 1;
            y_pixel = char_y_offset;
            
            case (char_index)
                5'd0:  char_code = 7'h47; // 'G'
                5'd1:  char_code = 7'h41; // 'A'
                5'd2:  char_code = 7'h4D; // 'M'
                5'd3:  char_code = 7'h45; // 'E'
                5'd4:  char_code = 7'h20; // ' '
                5'd5:  char_code = 7'h4F; // 'O'
                5'd6:  char_code = 7'h56; // 'V'
                5'd7:  char_code = 7'h45; // 'E'
                5'd8:  char_code = 7'h52; // 'R'
                5'd9:  char_code = 7'h21; // '!'
                default: char_code = 7'h20; // space
            endcase
            
            font_addr = {char_code, y_pixel};
            font_pixel = font_data[7 - x_pixel];
            
        end else if (in_line2) begin
            // "Final Score: 0000"
            char_x_offset = DrawX - LINE2_X;
            char_y_offset = DrawY - LINE2_Y;
            char_index = char_x_offset / CHAR_WIDTH;
            x_pixel = (char_x_offset % CHAR_WIDTH) >> 1;
            y_pixel = char_y_offset;
            
            case (char_index)
                5'd0:  char_code = 7'h46; // 'F'
                5'd1:  char_code = 7'h69; // 'i'
                5'd2:  char_code = 7'h6E; // 'n'
                5'd3:  char_code = 7'h61; // 'a'
                5'd4:  char_code = 7'h6C; // 'l'
                5'd5:  char_code = 7'h20; // ' '
                5'd6:  char_code = 7'h53; // 'S'
                5'd7:  char_code = 7'h63; // 'c'
                5'd8:  char_code = 7'h6F; // 'o'
                5'd9:  char_code = 7'h72; // 'r'
                5'd10: char_code = 7'h65; // 'e'
                5'd11: char_code = 7'h3A; // ':'
                5'd12: char_code = 7'h20; // ' '
                5'd13: char_code = 7'h30 + {3'b0, digit_thousands}; // Thousands digit
                5'd14: char_code = 7'h30 + {3'b0, digit_hundreds};  // Hundreds digit
                5'd15: char_code = 7'h30 + {3'b0, digit_tens};      // Tens digit
                5'd16: char_code = 7'h30 + {3'b0, digit_ones};      // Ones digit
                default: char_code = 7'h20; // space
            endcase
            
            font_addr = {char_code, y_pixel};
            font_pixel = font_data[7 - x_pixel];
            
        end else if (in_line3) begin
            // "Press 'r' to restart"
            char_x_offset = DrawX - LINE3_X;
            char_y_offset = DrawY - LINE3_Y;
            char_index = char_x_offset / CHAR_WIDTH;
            x_pixel = (char_x_offset % CHAR_WIDTH) >> 1;
            y_pixel = char_y_offset;
            
            case (char_index)
                5'd0:  char_code = 7'h50; // 'P'
                5'd1:  char_code = 7'h72; // 'r'
                5'd2:  char_code = 7'h65; // 'e'
                5'd3:  char_code = 7'h73; // 's'
                5'd4:  char_code = 7'h73; // 's'
                5'd5:  char_code = 7'h20; // ' '
                5'd6:  char_code = 7'h27; // '''
                5'd7:  char_code = 7'h72; // 'r'
                5'd8:  char_code = 7'h27; // '''
                5'd9:  char_code = 7'h20; // ' '
                5'd10: char_code = 7'h74; // 't'
                5'd11: char_code = 7'h6F; // 'o'
                5'd12: char_code = 7'h20; // ' '
                5'd13: char_code = 7'h72; // 'r'
                5'd14: char_code = 7'h65; // 'e'
                5'd15: char_code = 7'h73; // 's'
                5'd16: char_code = 7'h74; // 't'
                5'd17: char_code = 7'h61; // 'a'
                5'd18: char_code = 7'h72; // 'r'
                5'd19: char_code = 7'h74; // 't'
                default: char_code = 7'h20; // space
            endcase
            
            font_addr = {char_code, y_pixel};
            font_pixel = font_data[7 - x_pixel];
            
        end else begin
            font_addr = 11'h000;
        end
    end
    
    // Output: draw pixel if we're in any text area and the font pixel is set
    assign text_pixel = (in_line1 || in_line2 || in_line3) && font_pixel;

endmodule