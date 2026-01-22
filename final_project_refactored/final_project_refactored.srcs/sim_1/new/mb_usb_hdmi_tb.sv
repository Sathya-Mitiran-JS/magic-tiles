//-------------------------------------------------------------------------
//    magic_tiles_tb.sv                                                  --
//    Simple testbench for Magic Tiles top-level module                 --
//    Shows signal waveforms for the complete system                    --
//-------------------------------------------------------------------------

module mb_usb_hdmi_tb();
    timeunit 1ns;
    timeprecision 1ps;
    
    // Top-level inputs
    logic Clk;
    logic reset_rtl_0;
    
    // USB signals (stubbed out for simulation)
    logic [0:0] gpio_usb_int_tri_i;
    logic usb_spi_miso;
    
    // UART (stubbed out)
    logic uart_rtl_0_rxd;
    
    // Top-level outputs
    logic gpio_usb_rst_tri_o;
    logic usb_spi_mosi;
    logic usb_spi_sclk;
    logic usb_spi_ss;
    logic uart_rtl_0_txd;
    logic hdmi_tmds_clk_n;
    logic hdmi_tmds_clk_p;
    logic [2:0] hdmi_tmds_data_n;
    logic [2:0] hdmi_tmds_data_p;
    logic [7:0] hex_segA;
    logic [3:0] hex_gridA;
    logic [7:0] hex_segB;
    logic [3:0] hex_gridB;
    
    // USB HID Keycodes for testing
    parameter [7:0] KEY_A = 8'h04;
    parameter [7:0] KEY_S = 8'h16;
    parameter [7:0] KEY_D = 8'h07;
    parameter [7:0] KEY_F = 8'h09;
    parameter [7:0] KEY_NONE = 8'h00;
    
    // Instantiate DUT (Device Under Test) - Top Level Module
    mb_usb_hdmi_top dut (.*);
    
    // Clock generation - 100MHz system clock
    initial begin: CLOCK_INITIALIZATION
        Clk = 0;
    end
    
    always begin: CLOCK_GENERATION
        #5 Clk = ~Clk;  // 100MHz (10ns period)
    end
    
    // Stub USB signals
    initial begin
        gpio_usb_int_tri_i = 1'b1;  // No USB interrupt
        usb_spi_miso = 1'b0;
        uart_rtl_0_rxd = 1'b1;
    end
    
    // Simulate keycode inputs by driving the GPIO signals directly
    // In real hardware, these come from MicroBlaze, but we'll inject them here
    initial begin: TEST_VECTORS
        reset_rtl_0 = 1'b1;
        
        $display("=== Magic Tiles Testbench Started ===");
        
        // Hold reset
        repeat (10) @(posedge Clk);
        reset_rtl_0 = 1'b0;
        
        $display("Time: %0t - Reset released", $time);
        
        // Wait for clocks to stabilize and first frame
        repeat (100) @(posedge Clk);
        
        // Inject keycode for A key press
        force dut.keycode0_gpio = {24'h0, KEY_A};
        repeat (100000) @(posedge Clk);  // Hold for ~1ms
        force dut.keycode0_gpio = {24'h0, KEY_NONE};
        $display("Time: %0t - Pressed A key", $time);
        
        // Wait a bit
        repeat (200000) @(posedge Clk);
        
        // Inject keycode for S key press
        force dut.keycode0_gpio = {24'h0, KEY_S};
        repeat (100000) @(posedge Clk);
        force dut.keycode0_gpio = {24'h0, KEY_NONE};
        $display("Time: %0t - Pressed S key", $time);
        
        // Wait a bit
        repeat (200000) @(posedge Clk);
        
        // Inject keycode for D key press
        force dut.keycode0_gpio = {24'h0, KEY_D};
        repeat (100000) @(posedge Clk);
        force dut.keycode0_gpio = {24'h0, KEY_NONE};
        $display("Time: %0t - Pressed D key", $time);
        
        // Wait a bit more
        repeat (200000) @(posedge Clk);
        
        // Inject keycode for F key press
        force dut.keycode0_gpio = {24'h0, KEY_F};
        repeat (100000) @(posedge Clk);
        force dut.keycode0_gpio = {24'h0, KEY_NONE};
        $display("Time: %0t - Pressed F key", $time);
        
        // Run for a while to see game behavior
        repeat (1000000) @(posedge Clk);  // ~10ms of simulation
        
        $display("=== Testbench Complete ===");
        $display("Final Score: %0d", dut.score);
        $finish();
    end
    
    // Monitor frame ticks and game state
    integer frame_count = 0;
    always @(posedge dut.frame_tick) begin
        frame_count = frame_count + 1;
        
        if (frame_count % 60 == 0) begin  // Every 60 frames (~1 second)
            $display("Frame %0d (Time: %0t):", frame_count, $time);
            $display("  Score: %0d", dut.score);
            $display("  Lane 1: Y=%0d Active=%b Hit=%b", 
                     dut.tile1_y[0], dut.tile1_active[0], dut.tile1_hit[0]);
            $display("  Lane 2: Y=%0d Active=%b Hit=%b", 
                     dut.tile2_y[0], dut.tile2_active[0], dut.tile2_hit[0]);
            $display("  Lane 3: Y=%0d Active=%b Hit=%b", 
                     dut.tile3_y[0], dut.tile3_active[0], dut.tile3_hit[0]);
            $display("  Lane 4: Y=%0d Active=%b Hit=%b", 
                     dut.tile4_y[0], dut.tile4_active[0], dut.tile4_hit[0]);
        end
    end
    
    // Waveform dumping for GTKWave
    initial begin
        $dumpfile("mb_usb_hdmi_tb.vcd");
        $dumpvars(0, mb_usb_hdmi_tb);
        
        // Also dump internal signals for debugging
        $dumpvars(0, dut.game_logic);
        $dumpvars(0, dut.color_instance);
    end

endmodule