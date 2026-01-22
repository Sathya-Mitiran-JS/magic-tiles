`timescale 1ns / 1ps
//-------------------------------------------------------------------------
//    start_display.sv - Start Screen display using font_rom
//    AI was used to translate keycodes                                  
//-------------------------------------------------------------------------

module title_subtext(
    input  logic [9:0] DrawX, DrawY,
    input  logic [7:0] font_data,     // Data from font_rom
    output logic [10:0] font_addr,    // Address to font_rom
    output logic text_pixel           // Output 1 if drawing text
);

    // Display parameters
    parameter [9:0] CHAR_WIDTH  = 10'd16;   // Character width (8 pixels x2)
    parameter [9:0] CHAR_HEIGHT = 10'd16;   // Character height (16 rows)
    
    // Text: "PRESS SPACE TO START"
    // Length: 20 Characters
    // Width: 20 * 16 = 320 pixels
    // Center X: (640 - 320) / 2 = 160
    
    parameter [9:0] TEXT_X      = 10'd160; 
    parameter [9:0] TEXT_Y      = 10'd320;
    parameter [9:0] TEXT_CHARS  = 10'd20;
    
    // Line detection
    logic in_text;
    logic [4:0] char_index; 
    logic [9:0] char_x_offset, char_y_offset;
    logic [6:0] char_code;
    logic [3:0] y_pixel;
    logic [2:0] x_pixel;
    logic font_pixel;
    
    // Check if inside text box
    assign in_text = (DrawX >= TEXT_X && 
                      DrawX < TEXT_X + TEXT_CHARS * CHAR_WIDTH &&
                      DrawY >= TEXT_Y && 
                      DrawY < TEXT_Y + CHAR_HEIGHT);
    
    // Calculate character and pixel positions
    always_comb begin
        // Default values
        char_code  = 7'h20; // Space
        y_pixel    = 4'h0;
        x_pixel    = 3'h0;
        font_pixel = 1'b0;
        
        if (in_text) begin
            // Calculate relative offsets
            char_x_offset = DrawX - TEXT_X;
            char_y_offset = DrawY - TEXT_Y;
            
            // Determine which character in the string (0-19)
            char_index = char_x_offset / CHAR_WIDTH;
            
            // Determine pixel within the character 
            x_pixel = (char_x_offset % CHAR_WIDTH) >> 1;
            y_pixel = char_y_offset;
            
            case (char_index)
                // "PRESS"
                5'd0:  char_code = 7'h50; // 'P'
                5'd1:  char_code = 7'h52; // 'R'
                5'd2:  char_code = 7'h45; // 'E'
                5'd3:  char_code = 7'h53; // 'S'
                5'd4:  char_code = 7'h53; // 'S'
                
                // " SPACE "
                5'd5:  char_code = 7'h20; // ' '
                5'd6:  char_code = 7'h53; // 'S'
                5'd7:  char_code = 7'h50; // 'P'
                5'd8:  char_code = 7'h41; // 'A'
                5'd9:  char_code = 7'h43; // 'C'
                5'd10: char_code = 7'h45; // 'E'
                5'd11: char_code = 7'h20; // ' '
                
                // "TO"
                5'd12: char_code = 7'h54; // 'T'
                5'd13: char_code = 7'h4F; // 'O'
                5'd14: char_code = 7'h20; // ' '
                
                // "START"
                5'd15: char_code = 7'h53; // 'S'
                5'd16: char_code = 7'h54; // 'T'
                5'd17: char_code = 7'h41; // 'A'
                5'd18: char_code = 7'h52; // 'R'
                5'd19: char_code = 7'h54; // 'T'
                
                default: char_code = 7'h20; // space
            endcase
            
            // Lookup font data
            font_addr = {char_code, y_pixel};
            
            // Reverse bit order
            font_pixel = font_data[7 - x_pixel];
            
        end else begin
            font_addr = 11'h000;
        end
    end
    
    // Draw pixel if in text area and font pixel is set
    assign text_pixel = in_text && font_pixel;

endmodule
