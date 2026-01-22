//-------------------------------------------------------------------------
//    tile_logic.sv - Game Driver, Interaction control
//-------------------------------------------------------------------------

module tile_logic ( 
    input logic         clk,          // 25MHz system clock
    input  logic        Reset, 
    input  logic        frame_clk,    // 60Hz frame clock
    input  logic [7:0]  keycode,
    
    // Direct commands from the Sequencer
    input  logic        spawn_lane0,
    input  logic        spawn_lane1,
    input  logic        spawn_lane2,
    input  logic        spawn_lane3,
    
    // Arrays for all 4 lanes
    output logic [9:0]  tile1_y [3:0], tile2_y [3:0], tile3_y [3:0], tile4_y [3:0],
    output logic [3:0]  tile1_active, tile2_active, tile3_active, tile4_active,
    output logic [3:0]  tile1_hit, tile2_hit, tile3_hit, tile4_hit,
    output logic [1:0]  tile1_accuracy [3:0], tile2_accuracy [3:0], 
                        tile3_accuracy [3:0], tile4_accuracy [3:0],
                        
    output logic [15:0] score,
    output logic [1:0]  lives,
    output logic        missed_tile,
    output logic        game_over
);

    // Parameters
    parameter [7:0] KEY_A = 8'h04;
    parameter [7:0] KEY_S = 8'h16;
    parameter [7:0] KEY_D = 8'h07;
    parameter [7:0] KEY_F = 8'h09;
    parameter [7:0] KEY_R = 8'h15;

    // State Variables
    logic [15:0] score_r;
    logic [1:0] lives_r;
    logic game_over_r;
    logic [4:0] missed_tile_ct;
    
    // Input Edge Detection
    logic [7:0] keycode_d;
    logic a_press, s_press, d_press, f_press;

    always_ff @(posedge clk) begin
        keycode_d <= keycode;
        a_press <= (keycode == KEY_A) && (keycode_d != KEY_A);
        s_press <= (keycode == KEY_S) && (keycode_d != KEY_S);
        d_press <= (keycode == KEY_D) && (keycode_d != KEY_D);
        f_press <= (keycode == KEY_F) && (keycode_d != KEY_F);
    end

    // Lane Instantiation
    logic [3:0] score_inc [3:0]; 
    logic [3:0] lane_fail;       

    lane_logic lane1 (
        .clk(clk),
        .Reset(Reset || (game_over_r && keycode == KEY_R)),
        .frame_tick(frame_clk),
        .spawn_trigger(spawn_lane0),
        .key_pressed(a_press),
        .save_state(1'b0), 
        .restore_state(1'b0),
        .tile_y(tile1_y), 
        .active(tile1_active), 
        .hit(tile1_hit), 
        .accuracy(tile1_accuracy),
        .score_increase(score_inc[0]), 
        .life_lost(lane_fail[0])
    );

    lane_logic lane2 (
        .clk(clk),
        .Reset(Reset || (game_over_r && keycode == KEY_R)),
        .frame_tick(frame_clk),
        .spawn_trigger(spawn_lane1),
        .key_pressed(s_press),
        .save_state(1'b0), 
        .restore_state(1'b0),
        .tile_y(tile2_y), 
        .active(tile2_active), 
        .hit(tile2_hit), 
        .accuracy(tile2_accuracy),
        .score_increase(score_inc[1]), 
        .life_lost(lane_fail[1])
    );

    lane_logic lane3 (
        .clk(clk),
        .Reset(Reset || (game_over_r && keycode == KEY_R)),
        .frame_tick(frame_clk),
        .spawn_trigger(spawn_lane2),
        .key_pressed(d_press),
        .save_state(1'b0), 
        .restore_state(1'b0),
        .tile_y(tile3_y), 
        .active(tile3_active), 
        .hit(tile3_hit), 
        .accuracy(tile3_accuracy),
        .score_increase(score_inc[2]), 
        .life_lost(lane_fail[2])
    );

    lane_logic lane4 (
        .clk(clk),
        .Reset(Reset || (game_over_r && keycode == KEY_R)),
        .frame_tick(frame_clk),
        .spawn_trigger(spawn_lane3),
        .key_pressed(f_press),
        .save_state(1'b0), 
        .restore_state(1'b0),
        .tile_y(tile4_y), 
        .active(tile4_active), 
        .hit(tile4_hit), 
        .accuracy(tile4_accuracy),
        .score_increase(score_inc[3]), 
        .life_lost(lane_fail[3])
    );

    // Output Assignments
    assign score = score_r;
    assign lives = lives_r;
    assign game_over = game_over_r;
    assign missed_tile = (missed_tile_ct != 0);
    
    // Frame clock edge detection for countdown timing
    logic frame_clk_prev;
    logic frame_tick_edge;
    
    always_ff @(posedge clk) begin
        // Detect frame_clk rising edge
        frame_clk_prev <= frame_clk;
        frame_tick_edge <= frame_clk && !frame_clk_prev;
        
        if (Reset || (game_over_r && keycode == KEY_R)) begin
            score_r <= 16'd0;
            lives_r <= 2'd3;
            game_over_r <= 1'b0;
            missed_tile_ct <= 5'd0;
        end
        else if (!game_over_r) begin
            
            // Process failures from lanes (instant response)
            if (lane_fail != 4'b0000) begin
                lives_r <= lives_r - 1;
                missed_tile_ct <= 5'd15;
                
                if (lives_r == 2'd1) begin
                    game_over_r <= 1'b1;
                end 
            end
            
            // Process scores
            score_r <= score_r + score_inc[0] + score_inc[1] + 
                       score_inc[2] + score_inc[3];

            // Countdown flash at frame rate
            if (frame_tick_edge && missed_tile_ct > 0) begin
                missed_tile_ct <= missed_tile_ct - 1;
            end
        end
    end

endmodule