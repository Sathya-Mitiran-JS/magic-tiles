`timescale 1ns / 1ps

//-------------------------------------------------------------------------
// lane_logic.sv - Hit Detection & User Interaction
// AI was used to write helper function
//-------------------------------------------------------------------------

module lane_logic (
    input  logic        clk,           // 25MHz system clock
    input  logic        Reset,
    
    // TIMING INPUTS
    input  logic        frame_tick,    // 60Hz enable strobe (1-cycle pulse @ 25MHz)
    input  logic        spawn_trigger, // Fast pulse from sequencer
    
    input  logic        key_pressed,   // User input
    input  logic        save_state,    // Unused
    input  logic        restore_state, // Unused
    
    output logic [9:0]  tile_y [3:0],  // 4 tiles per lane
    output logic [3:0]  active,
    output logic [3:0]  hit,
    output logic [1:0]  accuracy [3:0],
    
    output logic [3:0]  score_increase,
    output logic        life_lost
);

    parameter TILE_SPEED   = 10'd2;
    parameter DESPAWN_Y    = 10'd479;
    parameter SPAWN_Y      = 10'd0;
    parameter OFFSCREEN_Y  = 10'd999;
    
    parameter TILE_HEIGHT  = 10'd80;    
    parameter PERFECT_LINE = 10'd380;
    parameter PERFECT_TOL  = 10'd30;

    // --- Internal Logic Helper: Calculate Accuracy ---
    function automatic [1:0] get_acc(input [9:0] y);
        logic [9:0] bottom, distance;
        bottom = y + TILE_HEIGHT;
        
        if (bottom < PERFECT_LINE)
            distance = PERFECT_LINE - bottom;
        else
            distance = bottom - PERFECT_LINE;
        
        if (distance <= PERFECT_TOL) return 2'b11; // Perfect
        if (y <= PERFECT_LINE && bottom >= PERFECT_LINE) return 2'b10; // Great
        return 2'b01; // Cool
    endfunction
    
    // Variables for finding the active note
    logic [9:0] max_y;
    logic [1:0] front_idx;
    logic       found;
    
    // Separate life_lost causes to avoid multiple drivers
    logic life_lost_miss;
    logic life_lost_wrong;

    always_ff @(posedge clk) begin
        // Default outputs (pulsed signals clear every clock cycle)
        score_increase <= 4'd0;
        life_lost_miss <= 1'b0;
        life_lost_wrong <= 1'b0;

        if (Reset) begin
            for(int i=0; i<4; i++) begin
                tile_y[i] <= OFFSCREEN_Y;
                active[i] <= 1'b0;
                hit[i] <= 1'b0;
                accuracy[i] <= 2'b00;
            end
        end
        else begin
            
            // Spawning & input logic based on system clock
            
            // Spawn Detection
            if (spawn_trigger) begin
                for(int i=0; i<4; i++) begin
                    if (!active[i]) begin 
                        tile_y[i] <= SPAWN_Y;
                        active[i] <= 1'b1;
                        hit[i] <= 1'b0;
                        accuracy[i] <= 2'b00;
                        break; 
                    end
                end
            end

            // Key Press Logic
            if (key_pressed) begin
                max_y = 10'd0;
                front_idx = 2'b00;
                found = 1'b0;
                
                // Find bottommost (max Y) unhit tile
                for(int i=0; i<4; i++) begin
                    if (active[i] && !hit[i] && tile_y[i] > max_y) begin
                        max_y = tile_y[i];
                        front_idx = i[1:0];
                        found = 1'b1;
                    end
                end

                if (found) begin
                    hit[front_idx] <= 1'b1;
                    accuracy[front_idx] <= get_acc(tile_y[front_idx]);
                    
                    case (get_acc(tile_y[front_idx]))
                        2'b11: score_increase <= 4'd3; 
                        2'b10: score_increase <= 4'd2; 
                        2'b01: score_increase <= 4'd1; 
                        default: score_increase <= 4'd1;
                    endcase
                end else begin
                    life_lost_wrong <= 1'b1;
                end
            end

            // Frame clock-based logic
            
            if (frame_tick) begin
                for(int i=0; i<4; i++) begin
                    if (active[i]) begin
                        // Check Despawn
                        if (tile_y[i] + TILE_SPEED >= DESPAWN_Y) begin
                            if (!hit[i]) 
                                life_lost_miss <= 1'b1;
                            
                            active[i] <= 1'b0;
                            hit[i] <= 1'b0;
                            tile_y[i] <= OFFSCREEN_Y;
                        end else begin
                            // Move Down
                            tile_y[i] <= tile_y[i] + TILE_SPEED;
                        end
                    end
                end
            end
            
        end
    end
    
    assign life_lost = life_lost_miss | life_lost_wrong;

endmodule