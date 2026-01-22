//-------------------------------------------------------------------------
// system_top.sv - Instantiates graphics and audio subsystems
//-------------------------------------------------------------------------
module system_top(
    input logic Clk,
    input logic reset_rtl_0,
    
    //USB signals
    input logic [0:0] gpio_usb_int_tri_i,
    output logic gpio_usb_rst_tri_o,
    input logic usb_spi_miso,
    output logic usb_spi_mosi,
    output logic usb_spi_sclk,
    output logic usb_spi_ss,
    
    //UART
    input logic uart_rtl_0_rxd,
    output logic uart_rtl_0_txd,
    
    //HDMI
    output logic hdmi_tmds_clk_n,
    output logic hdmi_tmds_clk_p,
    output logic [2:0]hdmi_tmds_data_n,
    output logic [2:0]hdmi_tmds_data_p,
        
    //HEX displays
    output logic [7:0] hex_segA,
    output logic [3:0] hex_gridA,
    output logic [7:0] hex_segB,
    output logic [3:0] hex_gridB,
    
    // SD Card Interface
    output logic sd_cs,
    output logic sd_sclk,
    output logic sd_mosi,
    input  logic sd_miso,
    
    // Audio outputs
    output logic audio_left,
    output logic audio_right,
    
    // Status LEDs
    output logic [15:0] led
);
    logic [1:0] state;
    logic [31:0] sample_count;
    
    // Game Subsystem Instantiation
    mb_usb_hdmi_top game_system (
        .Clk(Clk),
        .reset_rtl_0(reset_rtl_0),
        
        // USB signals
        .gpio_usb_int_tri_i(gpio_usb_int_tri_i),
        .gpio_usb_rst_tri_o(gpio_usb_rst_tri_o),
        .usb_spi_miso(usb_spi_miso),
        .usb_spi_mosi(usb_spi_mosi),
        .usb_spi_sclk(usb_spi_sclk),
        .usb_spi_ss(usb_spi_ss),
        
        // UART
        .uart_rtl_0_rxd(uart_rtl_0_rxd),
        .uart_rtl_0_txd(uart_rtl_0_txd),
        
        // HDMI
        .hdmi_tmds_clk_n(hdmi_tmds_clk_n),
        .hdmi_tmds_clk_p(hdmi_tmds_clk_p),
        .hdmi_tmds_data_n(hdmi_tmds_data_n),
        .hdmi_tmds_data_p(hdmi_tmds_data_p),
        
        // HEX displays
        .hex_segA(hex_segA),
        .hex_gridA(hex_gridA),
        .hex_segB(hex_segB),
        .hex_gridB(hex_gridB),
        
        .state(state),
        .sample_count(sample_count)
    );
    
    // Audio Control Logic
    logic audio_reset;
    logic audio_enable;
    
    // Reset audio when NOT in play state
    // This restarts audio from beginning each game
    assign audio_reset = reset_rtl_0 || (state != 2'b01);
    
    // Audio Subsystem Instantiation
    top_audio audio_system (
        .clk_100mhz(Clk),
        .reset_btn(audio_reset),      // Resets when not playing
        
        // SD Card Interface
        .sd_cs(sd_cs),
        .sd_sclk(sd_sclk),
        .sd_mosi(sd_mosi),
        .sd_miso(sd_miso),
        
        // Audio outputs
        .audio_left(audio_left),
        .audio_right(audio_right),
        
        // Status LEDs
        .led(led),
        
        .sample_count_out(sample_count)
    );

endmodule