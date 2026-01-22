// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Thu Dec 11 00:22:15 2025
// Host        : Dingjia_XPS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/dshen/FA25/ECE385/final_project_refactored/final_project_refactored.gen/sources_1/ip/title_rom/title_rom_sim_netlist.v
// Design      : title_rom
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "title_rom,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module title_rom
   (clka,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [13:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [3:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [3:0]douta;

  wire [13:0]addra;
  wire clka;
  wire [3:0]dina;
  wire [3:0]douta;
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
  wire [3:0]NLW_U0_doutb_UNCONNECTED;
  wire [13:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [13:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "14" *) 
  (* C_ADDRB_WIDTH = "14" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "3" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.137015 mW" *) 
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
  (* C_INIT_FILE = "title_rom.mem" *) 
  (* C_INIT_FILE_NAME = "title_rom.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "12000" *) 
  (* C_READ_DEPTH_B = "12000" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "4" *) 
  (* C_READ_WIDTH_B = "4" *) 
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
  (* C_WRITE_DEPTH_A = "12000" *) 
  (* C_WRITE_DEPTH_B = "12000" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "4" *) 
  (* C_WRITE_WIDTH_B = "4" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  title_rom_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[3:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[13:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[13:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[3:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 42160)
`pragma protect data_block
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
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
