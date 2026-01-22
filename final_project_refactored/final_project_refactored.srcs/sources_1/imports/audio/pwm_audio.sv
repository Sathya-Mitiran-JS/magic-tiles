`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// PWM Audio Output Module
// Generates PWM signal for 8-bit audio samples at 22.05 kHz
// AI was used to assist in the creation of this file
//////////////////////////////////////////////////////////////////////////////////

module pwm_audio #(
    parameter CLK_FREQ = 50_000_000,    // 50 MHz clock
    parameter SAMPLE_RATE = 44100       // 44.1 kHz audio
)(
    input  logic        clk,
    input  logic        reset,
    
    // Audio sample input
    input  logic [7:0]  audio_sample,
    output logic        sample_request,  // Pulse when new sample is needed
    
    // PWM outputs
    output logic        pwm_left,
    output logic        pwm_right
);

    // Calculate clocks per sample
    localparam CLKS_PER_SAMPLE = CLK_FREQ / SAMPLE_RATE;  // ~1134 for 50MHz / 44.1kHz
    
    // PWM counter (8-bit = 256 levels)
    logic [7:0] pwm_counter;
    
    // Sample rate divider
    logic [15:0] sample_counter;
    
    // Current sample register
    logic [7:0] current_sample;
    
    // PWM generation
    always_ff @(posedge clk) begin
        if (reset) begin
            pwm_counter <= 8'h0;
            sample_counter <= 16'h0;
            current_sample <= 8'h80;  // Silence (middle value)
            sample_request <= 1'b0;
        end else begin
            // PWM counter runs at full clock speed
            pwm_counter <= pwm_counter + 1;
            
            // Sample rate counter
            if (sample_counter >= CLKS_PER_SAMPLE - 1) begin
                sample_counter <= 16'h0;
                current_sample <= audio_sample;  // Capture new sample
                sample_request <= 1'b1;          // Request next sample
            end else begin
                sample_counter <= sample_counter + 1;
                sample_request <= 1'b0;
            end
        end
    end
    
    // Generate PWM output (both channels same for mono)
    assign pwm_left = (pwm_counter < current_sample);
    assign pwm_right = (pwm_counter < current_sample);

endmodule