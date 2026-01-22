//-------------------------------------------------------------------------
// score_display.sv - Score display using font_rom
//-------------------------------------------------------------------------

module score_display(
    input  logic [9:0] DrawX, DrawY,
    input  logic [15:0] score,
    input  logic [7:0] font_data,     // Data from font_rom
    output logic [10:0] font_addr,    // Address to font_rom
    output logic score_pixel          // Output 1 if drawing score text
);

    // Display parameters
    parameter [9:0] SCORE_X = 10'd240;      // X position
    parameter [9:0] SCORE_Y = 10'd20;       // Y position
    parameter [9:0] CHAR_WIDTH = 10'd16;    // Character width (8 pixels x2)
    parameter [9:0] CHAR_HEIGHT = 10'd16;   // Character height (16 rows)
    
    // "SCORE: " is 7 characters, then 4 digits = 11 total characters
    parameter NUM_CHARS = 11;
    
    logic in_text_area;
    logic [3:0] char_index;
    logic [9:0] char_x_offset, char_y_offset;
    logic [6:0] char_code;      // 7-bit character code for font_rom
    logic [3:0] y_pixel;        // Row within character (0-15)
    logic [2:0] x_pixel;        // Column within character (0-7)
    logic font_pixel;
    
    // Extract digits from score
    logic [3:0] digit_thousands, digit_hundreds, digit_tens, digit_ones;
    always_comb begin
        digit_thousands = (score / 1000) % 10;
        digit_hundreds = (score / 100) % 10;
        digit_tens = (score / 10) % 10;
        digit_ones = score % 10;
    end
    
    // Check if in the text area
    assign in_text_area = (DrawX >= SCORE_X && 
                           DrawX < SCORE_X + NUM_CHARS * CHAR_WIDTH &&
                           DrawY >= SCORE_Y && 
                           DrawY < SCORE_Y + CHAR_HEIGHT);
    
    // Calculate character and pixel positions
    always_comb begin
        if (in_text_area) begin
            char_x_offset = DrawX - SCORE_X;
            char_y_offset = DrawY - SCORE_Y;
            
            // Which character (0-10)
            char_index = char_x_offset / CHAR_WIDTH;
            
            // Position within the character
            x_pixel = (char_x_offset % CHAR_WIDTH) >> 1;  // Scale: 16 pixels -> 8 pixels
            y_pixel = char_y_offset;                       // 16 rows
            
            // Map character index to 7-bit character code
            case (char_index)
                4'd0:  char_code = 7'h53; // 'S'
                4'd1:  char_code = 7'h43; // 'C'
                4'd2:  char_code = 7'h4F; // 'O'
                4'd3:  char_code = 7'h52; // 'R'
                4'd4:  char_code = 7'h45; // 'E'
                4'd5:  char_code = 7'h3A; // ':'
                4'd6:  char_code = 7'h20; // ' ' (space)
                4'd7:  char_code = 7'h30 + {3'b000, digit_thousands}; // '0'-'9'
                4'd8:  char_code = 7'h30 + {3'b000, digit_hundreds};
                4'd9:  char_code = 7'h30 + {3'b000, digit_tens};
                4'd10: char_code = 7'h30 + {3'b000, digit_ones};
                default: char_code = 7'h20; // space
            endcase
            
            // Calculate font ROM address
            font_addr = {char_code, y_pixel};
            
            // Extract the pixel from font_data
            font_pixel = font_data[7 - x_pixel];
        end else begin
            char_code = 7'h00;
            y_pixel = 4'h0;
            x_pixel = 3'h0;
            font_addr = 11'h000;
            font_pixel = 1'b0;
        end
    end
    
    // Only draw pixel if we're in text area and the font pixel is set
    assign score_pixel = in_text_area && font_pixel;

endmodule