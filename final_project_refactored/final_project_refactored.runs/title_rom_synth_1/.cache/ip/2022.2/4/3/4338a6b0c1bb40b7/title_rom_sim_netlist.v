// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Thu Dec 11 00:22:15 2025
// Host        : Dingjia_XPS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ title_rom_sim_netlist.v
// Design      : title_rom
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "title_rom,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_5 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 42496)
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
