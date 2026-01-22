#=============================================================================
# URBANA BOARD COMBINED CONSTRAINTS
#=============================================================================

#=============================================================================
# CLOCK & RESET (Shared Resources)
# Note: Check that port names match your top-level file (Clk vs clk_100mhz)
#=============================================================================
# --- From File 1 (Active) ---
create_clock -period 10.000 -name clk_100 -waveform {0.000 5.000} [get_ports Clk]
set_property PACKAGE_PIN N15 [get_ports Clk]
set_property IOSTANDARD LVCMOS33 [get_ports Clk]

set_property PACKAGE_PIN J2 [get_ports reset_rtl_0]
set_property IOSTANDARD LVCMOS25 [get_ports reset_rtl_0]

# --- From File 2 (Commented out to avoid errors) ---
# set_property -dict {PACKAGE_PIN N15 IOSTANDARD LVCMOS33} [get_ports clk_100mhz]
# create_clock -period 10.000 -name sys_clk -waveform {0.000 5.000} [get_ports clk_100mhz]
# set_property -dict {PACKAGE_PIN J2 IOSTANDARD LVCMOS25} [get_ports reset_btn]

#=============================================================================
# UART & USB / GPIO
#=============================================================================
set_property PACKAGE_PIN B16 [get_ports uart_rtl_0_rxd]
set_property IOSTANDARD LVCMOS33 [get_ports uart_rtl_0_rxd]
set_property PACKAGE_PIN A16 [get_ports uart_rtl_0_txd]
set_property IOSTANDARD LVCMOS33 [get_ports uart_rtl_0_txd]

# USB SPI & Interrupts
set_property PACKAGE_PIN T13 [get_ports {gpio_usb_int_tri_i[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_usb_int_tri_i[0]}]

set_property PACKAGE_PIN V14 [get_ports usb_spi_sclk]
set_property IOSTANDARD LVCMOS33 [get_ports usb_spi_sclk]

set_property PACKAGE_PIN V15 [get_ports usb_spi_mosi]
set_property IOSTANDARD LVCMOS33 [get_ports usb_spi_mosi]

set_property PACKAGE_PIN U12 [get_ports usb_spi_miso]
set_property IOSTANDARD LVCMOS33 [get_ports usb_spi_miso]

set_property PACKAGE_PIN T12 [get_ports usb_spi_ss]
set_property IOSTANDARD LVCMOS33 [get_ports usb_spi_ss]

set_property PACKAGE_PIN V13 [get_ports gpio_usb_rst_tri_o]
set_property IOSTANDARD LVCMOS33 [get_ports gpio_usb_rst_tri_o]

#=============================================================================
# 7-SEGMENT DISPLAY & HEX GRID
#=============================================================================
# Grid Enables (Active Low)
set_property PACKAGE_PIN G6 [get_ports {hex_gridA[0]}]
set_property PACKAGE_PIN H6 [get_ports {hex_gridA[1]}]
set_property PACKAGE_PIN C3 [get_ports {hex_gridA[2]}]
set_property PACKAGE_PIN B3 [get_ports {hex_gridA[3]}]
set_property PACKAGE_PIN E4 [get_ports {hex_gridB[0]}]
set_property PACKAGE_PIN E3 [get_ports {hex_gridB[1]}]
set_property PACKAGE_PIN F5 [get_ports {hex_gridB[2]}]
set_property PACKAGE_PIN H5 [get_ports {hex_gridB[3]}]

# Segment Cathodes A
set_property PACKAGE_PIN E6 [get_ports {hex_segA[0]}]
set_property PACKAGE_PIN B4 [get_ports {hex_segA[1]}]
set_property PACKAGE_PIN D5 [get_ports {hex_segA[2]}]
set_property PACKAGE_PIN C5 [get_ports {hex_segA[3]}]
set_property PACKAGE_PIN D7 [get_ports {hex_segA[4]}]
set_property PACKAGE_PIN D6 [get_ports {hex_segA[5]}]
set_property PACKAGE_PIN C4 [get_ports {hex_segA[6]}]
set_property PACKAGE_PIN B5 [get_ports {hex_segA[7]}]

# Segment Cathodes B
set_property PACKAGE_PIN F3 [get_ports {hex_segB[0]}]
set_property PACKAGE_PIN G5 [get_ports {hex_segB[1]}]
set_property PACKAGE_PIN J3 [get_ports {hex_segB[2]}]
set_property PACKAGE_PIN H4 [get_ports {hex_segB[3]}]
set_property PACKAGE_PIN F4 [get_ports {hex_segB[4]}]
set_property PACKAGE_PIN H3 [get_ports {hex_segB[5]}]
set_property PACKAGE_PIN E5 [get_ports {hex_segB[6]}]
set_property PACKAGE_PIN J4 [get_ports {hex_segB[7]}]

# IO Standards for all HEX
set_property IOSTANDARD LVCMOS25 [get_ports {hex_gridA[*]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_gridB[*]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_segA[*]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_segB[*]}]

#=============================================================================
# HDMI SIGNALS
#=============================================================================
set_property -dict { PACKAGE_PIN V17   IOSTANDARD TMDS_33 } [get_ports {hdmi_tmds_clk_n}]
set_property -dict { PACKAGE_PIN U16   IOSTANDARD TMDS_33 } [get_ports {hdmi_tmds_clk_p}]

set_property -dict { PACKAGE_PIN U18   IOSTANDARD TMDS_33 } [get_ports {hdmi_tmds_data_n[0]}]
set_property -dict { PACKAGE_PIN R17   IOSTANDARD TMDS_33 } [get_ports {hdmi_tmds_data_n[1]}]
set_property -dict { PACKAGE_PIN T14   IOSTANDARD TMDS_33 } [get_ports {hdmi_tmds_data_n[2]}]

set_property -dict { PACKAGE_PIN U17   IOSTANDARD TMDS_33 } [get_ports {hdmi_tmds_data_p[0]}]
set_property -dict { PACKAGE_PIN R16   IOSTANDARD TMDS_33 } [get_ports {hdmi_tmds_data_p[1]}]
set_property -dict { PACKAGE_PIN R14   IOSTANDARD TMDS_33 } [get_ports {hdmi_tmds_data_p[2]}]

#=============================================================================
# SD CARD (SPI MODE)
#=============================================================================
set_property -dict {PACKAGE_PIN N18 IOSTANDARD LVCMOS33} [get_ports sd_cs]
set_property -dict {PACKAGE_PIN P18 IOSTANDARD LVCMOS33} [get_ports sd_sclk]
set_property -dict {PACKAGE_PIN P17 IOSTANDARD LVCMOS33} [get_ports sd_mosi]
set_property -dict {PACKAGE_PIN M16 IOSTANDARD LVCMOS33} [get_ports sd_miso]

#=============================================================================
# AUDIO (PWM)
#=============================================================================
set_property -dict {PACKAGE_PIN B13 IOSTANDARD LVCMOS33} [get_ports audio_left]
set_property -dict {PACKAGE_PIN B14 IOSTANDARD LVCMOS33} [get_ports audio_right]

#=============================================================================
# USER LEDs
#=============================================================================
set_property -dict {PACKAGE_PIN C13 IOSTANDARD LVCMOS33} [get_ports {led[0]}]
set_property -dict {PACKAGE_PIN C14 IOSTANDARD LVCMOS33} [get_ports {led[1]}]
set_property -dict {PACKAGE_PIN D14 IOSTANDARD LVCMOS33} [get_ports {led[2]}]
set_property -dict {PACKAGE_PIN D15 IOSTANDARD LVCMOS33} [get_ports {led[3]}]
set_property -dict {PACKAGE_PIN D16 IOSTANDARD LVCMOS33} [get_ports {led[4]}]
set_property -dict {PACKAGE_PIN F18 IOSTANDARD LVCMOS33} [get_ports {led[5]}]
set_property -dict {PACKAGE_PIN E17 IOSTANDARD LVCMOS33} [get_ports {led[6]}]
set_property -dict {PACKAGE_PIN D17 IOSTANDARD LVCMOS33} [get_ports {led[7]}]
set_property -dict {PACKAGE_PIN C17 IOSTANDARD LVCMOS33} [get_ports {led[8]}]
set_property -dict {PACKAGE_PIN B18 IOSTANDARD LVCMOS33} [get_ports {led[9]}]
set_property -dict {PACKAGE_PIN A17 IOSTANDARD LVCMOS33} [get_ports {led[10]}]
set_property -dict {PACKAGE_PIN B17 IOSTANDARD LVCMOS33} [get_ports {led[11]}]
set_property -dict {PACKAGE_PIN C18 IOSTANDARD LVCMOS33} [get_ports {led[12]}]
set_property -dict {PACKAGE_PIN D18 IOSTANDARD LVCMOS33} [get_ports {led[13]}]
set_property -dict {PACKAGE_PIN E18 IOSTANDARD LVCMOS33} [get_ports {led[14]}]
set_property -dict {PACKAGE_PIN G17 IOSTANDARD LVCMOS33} [get_ports {led[15]}]

#=============================================================================
# CONFIGURATION SETTINGS
#=============================================================================
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN PULLUP [current_design]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets Clk_IBUF]

#create_clock -period 10.000 -name clk_100 -waveform {0.000 5.000} [get_ports Clk]

#set_property IOSTANDARD LVCMOS33 [get_ports Clk]
#set_property IOSTANDARD LVCMOS25 [get_ports reset_rtl_0]
#set_property IOSTANDARD LVCMOS33 [get_ports uart_rtl_0_rxd]
#set_property IOSTANDARD LVCMOS33 [get_ports uart_rtl_0_txd]
#set_property PACKAGE_PIN N15 [get_ports Clk]
#set_property PACKAGE_PIN J2 [get_ports reset_rtl_0]
#set_property PACKAGE_PIN B16 [get_ports uart_rtl_0_rxd]
#set_property PACKAGE_PIN A16 [get_ports uart_rtl_0_txd]

#set_property IOSTANDARD LVCMOS33 [get_ports {gpio_usb_int_tri_i[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports usb_spi_miso]
#set_property IOSTANDARD LVCMOS33 [get_ports usb_spi_mosi]
#set_property IOSTANDARD LVCMOS33 [get_ports usb_spi_sclk]
#set_property PACKAGE_PIN T13 [get_ports {gpio_usb_int_tri_i[0]}]
#set_property PACKAGE_PIN V14 [get_ports usb_spi_sclk]
#set_property PACKAGE_PIN V15 [get_ports usb_spi_mosi]
#set_property PACKAGE_PIN U12 [get_ports usb_spi_miso]

#set_property IOSTANDARD LVCMOS33 [get_ports gpio_usb_rst_tri_o]
#set_property PACKAGE_PIN V13 [get_ports gpio_usb_rst_tri_o]
#set_property PACKAGE_PIN T12 [get_ports usb_spi_ss]
#set_property IOSTANDARD LVCMOS33 [get_ports usb_spi_ss]


#set_property IOSTANDARD LVCMOS25 [get_ports {hex_gridA[3]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hex_gridA[2]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hex_gridA[1]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hex_gridA[0]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hex_gridB[3]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hex_gridB[2]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hex_gridB[1]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hex_gridB[0]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hex_segA[7]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hex_segA[6]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hex_segA[5]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hex_segA[4]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hex_segA[3]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hex_segA[2]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hex_segA[1]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hex_segA[0]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hex_segB[7]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hex_segB[6]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hex_segB[5]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hex_segB[4]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hex_segB[3]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hex_segB[2]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hex_segB[1]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {hex_segB[0]}]
#set_property PACKAGE_PIN G6 [get_ports {hex_gridA[0]}]
#set_property PACKAGE_PIN H6 [get_ports {hex_gridA[1]}]
#set_property PACKAGE_PIN C3 [get_ports {hex_gridA[2]}]
#set_property PACKAGE_PIN B3 [get_ports {hex_gridA[3]}]
#set_property PACKAGE_PIN E6 [get_ports {hex_segA[0]}]
#set_property PACKAGE_PIN B4 [get_ports {hex_segA[1]}]
#set_property PACKAGE_PIN D5 [get_ports {hex_segA[2]}]
#set_property PACKAGE_PIN C5 [get_ports {hex_segA[3]}]
#set_property PACKAGE_PIN D7 [get_ports {hex_segA[4]}]
#set_property PACKAGE_PIN D6 [get_ports {hex_segA[5]}]
#set_property PACKAGE_PIN C4 [get_ports {hex_segA[6]}]
#set_property PACKAGE_PIN B5 [get_ports {hex_segA[7]}]
#set_property PACKAGE_PIN F3 [get_ports {hex_segB[0]}]
#set_property PACKAGE_PIN G5 [get_ports {hex_segB[1]}]
#set_property PACKAGE_PIN J3 [get_ports {hex_segB[2]}]
#set_property PACKAGE_PIN H4 [get_ports {hex_segB[3]}]
#set_property PACKAGE_PIN F4 [get_ports {hex_segB[4]}]
#set_property PACKAGE_PIN H3 [get_ports {hex_segB[5]}]
#set_property PACKAGE_PIN E5 [get_ports {hex_segB[6]}]
#set_property PACKAGE_PIN J4 [get_ports {hex_segB[7]}]
#set_property PACKAGE_PIN E4 [get_ports {hex_gridB[0]}]
#set_property PACKAGE_PIN E3 [get_ports {hex_gridB[1]}]
#set_property PACKAGE_PIN F5 [get_ports {hex_gridB[2]}]
#set_property PACKAGE_PIN H5 [get_ports {hex_gridB[3]}]



##HDMI Signals
#set_property -dict { PACKAGE_PIN V17   IOSTANDARD TMDS_33 } [get_ports {hdmi_tmds_clk_n}]
#set_property -dict { PACKAGE_PIN U16   IOSTANDARD TMDS_33 } [get_ports {hdmi_tmds_clk_p}]

#set_property -dict { PACKAGE_PIN U18   IOSTANDARD TMDS_33  } [get_ports {hdmi_tmds_data_n[0]}]
#set_property -dict { PACKAGE_PIN R17   IOSTANDARD TMDS_33  } [get_ports {hdmi_tmds_data_n[1]}]
#set_property -dict { PACKAGE_PIN T14   IOSTANDARD TMDS_33  } [get_ports {hdmi_tmds_data_n[2]}]
                                    
#set_property -dict { PACKAGE_PIN U17   IOSTANDARD TMDS_33  } [get_ports {hdmi_tmds_data_p[0]}]
#set_property -dict { PACKAGE_PIN R16   IOSTANDARD TMDS_33  } [get_ports {hdmi_tmds_data_p[1]}]
#set_property -dict { PACKAGE_PIN R14   IOSTANDARD TMDS_33  } [get_ports {hdmi_tmds_data_p[2]}]

