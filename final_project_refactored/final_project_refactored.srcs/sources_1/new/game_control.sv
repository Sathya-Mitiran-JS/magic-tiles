`timescale 1ns / 1ps
//-------------------------------------------------------------------------
//    game_control.sv - Finite State Machine to control game logic
//-------------------------------------------------------------------------

module game_control (
    input  logic       clk,
    input  logic       Reset,
    input  logic [7:0] keycode,
    input  logic [1:0] lives,
    input  logic [31:0] song_done,
    output logic [1:0] state
);
    enum logic [1:0] {
        S_START,
        S_PLAY,
        S_GAME_OVER
    } curr_state, next_state;

    // Keycodes
    parameter [7:0] KEY_SPACE = 8'h2C;
    parameter [7:0] KEY_ENTER = 8'h28;
    parameter [7:0] KEY_R     = 8'h15;

    // Next State Logic
    always_ff @(posedge clk) begin
        if (Reset) 
            curr_state <= S_START;
        else 
            curr_state <= next_state;
    end

    // Transition Logic
    always_comb begin
        next_state = curr_state;

        unique case (curr_state)
            
            // Start Screen
            S_START: begin
                // Press SPACE or ENTER to start
                if (keycode == KEY_SPACE || keycode == KEY_ENTER) 
                    next_state = S_PLAY;
            end

            // Gameplay
            S_PLAY: begin
                // If lives hit 0 or the song is done, go to Game Over
                if (lives == 0 || song_done) 
                    next_state = S_GAME_OVER;
            end

            // Game Over
            S_GAME_OVER: begin
                // Press R to go back to Start
                if (keycode == KEY_R) 
                    next_state = S_START;
            end
        endcase
    end
    
    always_comb begin
        unique case (curr_state)
            S_START:     state = 2'b00;
            S_PLAY:      state = 2'b01;
            S_GAME_OVER: state = 2'b10;
            default:     state = 2'b10;
        endcase
    end

endmodule