// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Mon Dec  8 21:36:59 2025
// Host        : Dingjia_XPS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/dshen/FA25/ECE385/final_project/final_project.gen/sources_1/ip/heart_rom/heart_rom_sim_netlist.v
// Design      : heart_rom
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "heart_rom,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module heart_rom
   (clka,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [7:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [7:0]douta;

  wire [7:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]douta;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [7:0]NLW_U0_doutb_UNCONNECTED;
  wire [7:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "8" *) 
  (* C_ADDRB_WIDTH = "8" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.54005 mW" *) 
  (* C_FAMILY = "spartan7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "heart_rom.mem" *) 
  (* C_INIT_FILE_NAME = "heart_rom.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "256" *) 
  (* C_READ_DEPTH_B = "256" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "8" *) 
  (* C_READ_WIDTH_B = "8" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "256" *) 
  (* C_WRITE_DEPTH_B = "256" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  heart_rom_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[7:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[7:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[7:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[7:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VHPlDkoDlWlBfBMvPBmGYmaek3s9hXXhjF28kllYPnaNm3TSnzzpXHWHc8Ye9/2L2yiQfJ1hTWou
Ia/zeQ8h9/dtr6QB5YkyW4wlb/LbMgXb+DGIXPSllNl0IMsRQIcQDbcQm1bO/nlhb+2pjxiuaQrl
DbvxoDwPs7z3LunRxsg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lmIhoX8hXuc7tNV1sXY1K2/gXL7Y7Hq73qQF7+x03UWWTRd3uhGmVQtOMVbhIW+66UkWUHiD26zL
fzqGor8bgSNGpSFyS11k4TwLQT4OfAMGO8C9Qmmh4+VENBnpS9TW+wHzCv8oUwht7xYtYRZvOvYK
F3fMppz2sBkUd1lciw98ZE/UmNkhqBuMfIYF43j45DEJ55PBhOZNg91Ls4v3qBHyBAaYPFFoMry3
d5Fw1PZyFQSEOSSpwgyds2aN0g6oIwl7zm0LJrM9VDAOxBUE50hk+oHr4jj8J8UhHQJnlEHm1Idm
rvxKygNKRvfSpa90NYxZJFYgqnrMYg+19+9aZA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VkyCjO2onoeZWEoYQ/4ue7X5mkHyTYVW9xjdoTsGS4GdP/Q64VaCZL/jr6R8DVDXPMnH7tRMrDpo
jpYBnyzSgOkfgqM+96ioC2fDyAaG4gYgGLmrBR6qK3/mxXwAZZX+GJ9R/eWXkc9h8xN+gsSSX6/M
jIQCgeT6q7PB4dWT6KY=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Iub91V+TnhVlZCSLu6iKmFjix71y6/l83OPTs8uewWvkE7WcqYxEKi9fonXEkzAtWzuKwEUqnOlN
VBsNJqPUdKcd22q523mrdt89mpdosWD+hvZdO7ELhJniY5u9h49FFkubpN2JiUTcIcKEYxVNlds4
wyvaYUqbPVH5v2ooJwDdimS4GVn9HerCOgPwfshvQDNlMTxLcYju4v8BHMc5Rub9Q/ihvpQU74v2
ouZ9XIwA+C6pBLwvaqS8jE7HXOokgqJilaX/W/t+KEgiFry/txRTMU9WMD7tCN7lcfjCydmS3Lq+
3u6Hsr0S8BwNjcaDpZDnBTygUJd4JSqREnk33w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
U46EWFmKmpZGaWfyL+dokyQtJtaOYsa7HCW/+fdtw9/yHKTWFpmqKBZngBj5rPkNhtTDDCJkqsYj
tUXg1j4tgIBaCQn9B0q/aG+B3gPLrudp9hLL25mVbsfiTzdekiV2hJMmhuMoavKKPJHC6zyW7kZi
80er82OQy8h+Df/fe6TRjH9xEt3/b80tRKUMbxkLfnnkAyyf1KfOhB6/uyI4mwXuQR+DsAbzybKR
YtXpOiW72tGrXTFlzcwbHamWZefqsilVpBw6V5dh33vYKGx50xwWpj76maAkpQrOpB7zufeldJe4
W1UOEN84AZdRTLkVSxamWo/wp8nP9fiGS/ItRw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qczgIJYpE/SzErzK7eWJBGcDFEzDLm8cKbwJbPXuM6YnJxx44W+E60R3war7K2QGFAkOoCDUtDC7
SghJGF32btaDLzeKm0tQ669sBtQmMIaBrlt7I9QBkNM8zN9GL92qxNC9o3UVWMOYy5BmH8nUPgcE
O6lRubeltlrTuDe7UJQ2nEPHcXjpUJJ8dxktyW+LovBy1OxW8g4GRAsmEJsoOEg0HuDdWcc4IshJ
PvwPJ7LblELAKsdkSt65y9VaklaEm7MlH4ImlgIa74TgRmutLUbWxM1QYhGE5rAzFhGU5i3RJOdx
L3N7GGGvLMW2z9NSHbIFX+/eNII9fNJ9nZbgLA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ti1NUgDv8YPk90APMwfu/mRr38QYwAxZfv0T6zQ89YS55t2EquEGVqrEafYX6rTydLOw8le1Oucv
f2oERpSSSTih/ScZneSZmuPE/Zh2BU1Ajv0j+/+0uEWXU+5lLPbDJjnapTmJXih1MYPf0SHpZZmE
BKj2IEBI9MPZlh6bxpa5BWJnyPdAvHf+UNaMXU9+pmbtrzUVebql4mFJu45Z3+ehmFY4FBW3zXMF
44C4TlHACLwL3vHVMCVfeKhgdVDbpE+/IFhTStz7mZ9h9RKGanQcs6YDVM1R+2RKA1QT1fX4FiQc
1V+FGmrm1ujxmFGXwpfNKByVlfCY0oWhRJCYYQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
HuEXFK0NXt09xU2yxxjng1OLsT+ZEM4EhqBgpr9D2ljw2vDaMBrqEsRQTc2B9soDq3ewDduHJXBd
OGYxkPnoN6LhjULtB2nTgjcH6NxA4puZ1ZNcndDndVBo8rTW5W1OqHq6InAG0CqPpTIkuqz3ECPl
EysI++MCDfH6tIzlekxJFIJ1McJsTq5rFuLzMMcrmkBxgcayDpOcCFuzZzCczxmt/cCCIKmDybwT
OQXmOcLJoYLP4sFu6R9c6xO8i6p++crv2N3eIxZHKbek9xBBZqQM9EYuEtsbkqAs9XZpa16i5njR
BDFxTKcP6r7JgFALJE89AZhBbate5JXWp0v4ECZD18aEL17CipwcWPutNMdG1apzSPP5y59n7rMG
yxBPz1gKHc3Emkl4WcO0hjICxqmO6dMXoY8JvBSf6ry2l0sH9Ihr3Bq5WWmlhPHnoaNr5jl//vNe
KfToWtn97eoVSt1LnmXXnSpdigbHr0UIg8AdkpdkuNRaWdVicDdgSo49

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mokwst2bn6UxD6V9UdIgCIG1QQ/d0FiJqYGOTI2eHPV6YElaLjnJ8DnQmZnGS95o3x93FDOoa58C
RwYsX1fVoVtXkj1LuZq0k7q9vEe4T8xMjpkeYtIHY9k0Xhy1Lq/xRlfzGAf9fvf9e+f4r7aR/Sb/
uCZxxugG5niTwLENY1n3NthYL0jvo8Fmdw4Qg0nTCGWlVCws+09K0g9/lx6I9EcuHHemcHO3fOZG
lMc4NaPNozKwnyDMoWUkwiVxyFEPFaQLNYqzjvR+CqrWfhFLo96JWhL+eaDoNuZoBVYQtNH5ZwBL
BoO27Pw10lgcReGlZBz3BLO7T4ddynCx0+eSnw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PiP7AjOQqqouyQMoBQqgWIDhUSViq94rIvGiIJ/UKMDspM/yXw1caE8AhWHTjYckC4yLpPAz5P6s
1Z6flzDPrzVwg4e59X2cc4IMCHhedna0rDO804njcc6amRDTeLsMLTkWfvomB4xwszm2AgT+PRnB
WHd09ZUDVFjiBXT+Oa9AicgGJHrX3w823yBPuAa704kje/SzgtiDpcTU1eLmLhLW7LpEd9KIHd9s
ER7Uk9Orws0Kq9PMTqMX4hMn5K5mFakOeOURiEbUjdv5RiIJ2g/PlQXSItM8fHsBTQa6fOaJwQTI
vHwK3a8ZBHpfT1YH+n7wNiNUZwD4SFXm1QVx4g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ul5ZfTHJwMctaNhYRortUZizYMPYRef7uYqPSuMkxsArnxI/cjGh+KRMwzV86hyp/6TXSJIjm5ec
2wX2UONdPN+DOJ84jYC4JbgJQrPnTj7ioD8uLX/WlyPcQzyF5keqFgj5eR5s13FskVWCuAWf5m9w
mhFEKFjVXDAr7gVgAJh/hL8P6Psrnf+LGfiM8JhnDepsHEYykGlpD3fzru2BGgqHWqPqFMcnyVGl
vysaIXiJz/eYKvO8RGcgd3DJAM/wPm9A0m/DWcmSnczOgTjoqkHcBg2H5uJMLvufzmjImi6LYEqq
v04ESDEN31cSUzqUYcayvMFOnI/WNsWbFIa5+Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20544)
`pragma protect data_block
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
TkVJihNpWEcIgd/O/0xdPUFK6nhL3xbx
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
