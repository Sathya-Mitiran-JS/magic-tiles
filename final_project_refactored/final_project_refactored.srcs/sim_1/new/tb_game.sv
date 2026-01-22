`timescale 1ns / 1ps

module tb_game();

    // 1. Signals & Variables
    logic clk;
    logic reset;
    logic [31:0] sample_count;
    logic [1:0] state;
    
    // Wires between Sequencer and Tile Logic
    logic s0, s1, s2, s3;
    
    // Outputs to Observe
    logic [9:0] t1_y [3:0];
    logic [3:0] t1_active;
    logic frame_tick; // We generate this manually

    // 2. Generate 25MHz Clock (40ns period)
    initial clk = 0;
    always #20 clk = ~clk;

    // 3. Mock Audio Engine
    // Instead of a complex PWM module, we just increment the counter manually.
    // This simulates the song playing.
    always @(posedge clk) begin
        if (reset) begin
            sample_count <= 32'd0;
        end 
        else if (state == 2'b01) begin // Only count when "Playing"
            // In real hardware, this increments 44100 times/sec (slow).
            // In simulation, we increment it EVERY clock cycle (fast) 
            // so we don't have to wait 10 minutes to see a note spawn.
            sample_count <= sample_count + 1; 
        end
    end

    // 4. Mock Frame Tick (60Hz Strobe)
    // We generate a pulse every few cycles to simulate frames passing
    // (Again, sped up for simulation)
    logic [9:0] sim_frame_counter;
    always @(posedge clk) begin
        frame_tick <= 0;
        if (reset) begin
            sim_frame_counter <= 0;
        end else begin
            if (sim_frame_counter >= 100) begin // Fast 100-cycle frames
                frame_tick <= 1;
                sim_frame_counter <= 0;
            end else begin
                sim_frame_counter <= sim_frame_counter + 1;
            end
        end
    end

    // ============================================================
    // 5. Instantiate Your Modules (DUT - Device Under Test)
    // ============================================================

    tile_sequencer dut_sequencer (
        .clk(clk),
        .reset(reset),
        .game_active(state == 2'b01),
        .sample_count(sample_count), // Driven by our mock engine
        .spawn_lane0(s0),
        .spawn_lane1(s1),
        .spawn_lane2(s2),
        .spawn_lane3(s3)
        // Types unconnected for now
    );

    tile_logic dut_logic (
        .clk(clk),
        .Reset(reset),
        .frame_clk(frame_tick),
        .keycode(8'h00), // Simulate no keys pressed
        
        .spawn_lane0(s0),
        .spawn_lane1(s1),
        .spawn_lane2(s2),
        .spawn_lane3(s3),
        
        .tile1_y(t1_y),
        .tile1_active(t1_active)
        // Other outputs unconnected for now
    );

    // ============================================================
    // 6. The Test Procedure
    // ============================================================
    initial begin
        // Setup Waveform
        $display("Starting Simulation...");
        
        // Initial State
        reset = 1;
        state = 2'b00; // Start Screen
        #100; // Wait 100ns
        
        // Release Reset
        reset = 0;
        #100;
        
        // Start Game
        $display("Pressing Start Button...");
        state = 2'b01; // Game Active
        
        // Let it run for enough time to see spawns
        // Since we accelerated sample_count, we should see action quickly
        #20000; 
        
        $display("Simulation Finished.");
        $stop;
    end
    
    // Monitor Console Output
    always @(posedge clk) begin
        if (s0) $display("Time %t: SPAWN LANE 0", $time);
        if (s1) $display("Time %t: SPAWN LANE 1", $time);
        if (s2) $display("Time %t: SPAWN LANE 2", $time);
        if (s3) $display("Time %t: SPAWN LANE 3", $time);
    end

endmodule