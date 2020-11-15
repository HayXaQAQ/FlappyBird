// Verilog netlist created by TD v4.6.18154
// Fri Nov 13 19:50:12 2020

`timescale 1ns / 1ps
module bird  // al_ip/birdf.v(14)
  (
  addra,
  cea,
  clka,
  dia,
  wea,
  doa
  );

  input [11:0] addra;  // al_ip/birdf.v(19)
  input cea;  // al_ip/birdf.v(21)
  input clka;  // al_ip/birdf.v(22)
  input [23:0] dia;  // al_ip/birdf.v(18)
  input wea;  // al_ip/birdf.v(20)
  output [23:0] doa;  // al_ip/birdf.v(16)

  wire [0:1] addra_piped;
  wire  \inst_doa_mux_b0/B0_0 ;
  wire  \inst_doa_mux_b0/B0_1 ;
  wire  \inst_doa_mux_b1/B0_0 ;
  wire  \inst_doa_mux_b1/B0_1 ;
  wire  \inst_doa_mux_b10/B0_0 ;
  wire  \inst_doa_mux_b10/B0_1 ;
  wire  \inst_doa_mux_b11/B0_0 ;
  wire  \inst_doa_mux_b11/B0_1 ;
  wire  \inst_doa_mux_b12/B0_0 ;
  wire  \inst_doa_mux_b12/B0_1 ;
  wire  \inst_doa_mux_b13/B0_0 ;
  wire  \inst_doa_mux_b13/B0_1 ;
  wire  \inst_doa_mux_b14/B0_0 ;
  wire  \inst_doa_mux_b14/B0_1 ;
  wire  \inst_doa_mux_b15/B0_0 ;
  wire  \inst_doa_mux_b15/B0_1 ;
  wire  \inst_doa_mux_b16/B0_0 ;
  wire  \inst_doa_mux_b16/B0_1 ;
  wire  \inst_doa_mux_b17/B0_0 ;
  wire  \inst_doa_mux_b17/B0_1 ;
  wire  \inst_doa_mux_b18/B0_0 ;
  wire  \inst_doa_mux_b18/B0_1 ;
  wire  \inst_doa_mux_b19/B0_0 ;
  wire  \inst_doa_mux_b19/B0_1 ;
  wire  \inst_doa_mux_b2/B0_0 ;
  wire  \inst_doa_mux_b2/B0_1 ;
  wire  \inst_doa_mux_b20/B0_0 ;
  wire  \inst_doa_mux_b20/B0_1 ;
  wire  \inst_doa_mux_b21/B0_0 ;
  wire  \inst_doa_mux_b21/B0_1 ;
  wire  \inst_doa_mux_b22/B0_0 ;
  wire  \inst_doa_mux_b22/B0_1 ;
  wire  \inst_doa_mux_b23/B0_0 ;
  wire  \inst_doa_mux_b23/B0_1 ;
  wire  \inst_doa_mux_b3/B0_0 ;
  wire  \inst_doa_mux_b3/B0_1 ;
  wire  \inst_doa_mux_b4/B0_0 ;
  wire  \inst_doa_mux_b4/B0_1 ;
  wire  \inst_doa_mux_b5/B0_0 ;
  wire  \inst_doa_mux_b5/B0_1 ;
  wire  \inst_doa_mux_b6/B0_0 ;
  wire  \inst_doa_mux_b6/B0_1 ;
  wire  \inst_doa_mux_b7/B0_0 ;
  wire  \inst_doa_mux_b7/B0_1 ;
  wire  \inst_doa_mux_b8/B0_0 ;
  wire  \inst_doa_mux_b8/B0_1 ;
  wire  \inst_doa_mux_b9/B0_0 ;
  wire  \inst_doa_mux_b9/B0_1 ;
  wire cea_and_wea_neg_o;
  wire inst_doa_i0_000;
  wire inst_doa_i0_001;
  wire inst_doa_i0_002;
  wire inst_doa_i0_003;
  wire inst_doa_i0_004;
  wire inst_doa_i0_005;
  wire inst_doa_i0_006;
  wire inst_doa_i0_007;
  wire inst_doa_i0_008;
  wire inst_doa_i0_009;
  wire inst_doa_i0_010;
  wire inst_doa_i0_011;
  wire inst_doa_i0_012;
  wire inst_doa_i0_013;
  wire inst_doa_i0_014;
  wire inst_doa_i0_015;
  wire inst_doa_i0_016;
  wire inst_doa_i0_017;
  wire inst_doa_i0_018;
  wire inst_doa_i0_019;
  wire inst_doa_i0_020;
  wire inst_doa_i0_021;
  wire inst_doa_i0_022;
  wire inst_doa_i0_023;
  wire inst_doa_i1_000;
  wire inst_doa_i1_001;
  wire inst_doa_i1_002;
  wire inst_doa_i1_003;
  wire inst_doa_i1_004;
  wire inst_doa_i1_005;
  wire inst_doa_i1_006;
  wire inst_doa_i1_007;
  wire inst_doa_i1_008;
  wire inst_doa_i1_009;
  wire inst_doa_i1_010;
  wire inst_doa_i1_011;
  wire inst_doa_i1_012;
  wire inst_doa_i1_013;
  wire inst_doa_i1_014;
  wire inst_doa_i1_015;
  wire inst_doa_i1_016;
  wire inst_doa_i1_017;
  wire inst_doa_i2_000;
  wire inst_doa_i2_001;
  wire inst_doa_i2_002;
  wire inst_doa_i2_003;
  wire inst_doa_i2_004;
  wire inst_doa_i2_005;
  wire inst_doa_i2_006;
  wire inst_doa_i2_007;
  wire inst_doa_i2_008;
  wire inst_doa_i2_009;
  wire inst_doa_i2_010;
  wire inst_doa_i2_011;
  wire inst_doa_i2_012;
  wire inst_doa_i2_013;
  wire inst_doa_i2_014;
  wire inst_doa_i2_015;
  wire inst_doa_i2_016;
  wire inst_doa_i2_017;
  wire inst_doa_i3_000;
  wire inst_doa_i3_001;
  wire inst_doa_i3_002;
  wire inst_doa_i3_003;
  wire inst_doa_i3_004;
  wire inst_doa_i3_005;
  wire inst_doa_i3_006;
  wire inst_doa_i3_007;
  wire inst_doa_i3_008;
  wire inst_doa_i3_009;
  wire inst_doa_i3_010;
  wire inst_doa_i3_011;
  wire inst_doa_i3_012;
  wire inst_doa_i3_013;
  wire inst_doa_i3_014;
  wire inst_doa_i3_015;
  wire inst_doa_i3_016;
  wire inst_doa_i3_017;
  wire wea_neg;

  reg_ar_as_w1 addra_pipe_b0 (
    .clk(clka),
    .d(addra[10]),
    .en(cea_and_wea_neg_o),
    .reset(1'b0),
    .set(1'b0),
    .q(addra_piped[0]));
  reg_ar_as_w1 addra_pipe_b1 (
    .clk(clka),
    .d(addra[11]),
    .en(cea_and_wea_neg_o),
    .reset(1'b0),
    .set(1'b0),
    .q(addra_piped[1]));
  and cea_and_wea_neg (cea_and_wea_neg_o, cea, wea_neg);
  EG_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
  // address_offset=0;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=24;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    .CEBMUX("0"),
    .CLKBMUX("0"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("1"),
    .CSB0("1"),
    .CSB1("1"),
    .CSB2("1"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("SP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("0"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("0"),
    .RSTBMUX("0"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    inst_3600x24_sub_000000_000 (
    .addra({addra[9:0],3'b111}),
    .cea(cea),
    .clka(clka),
    .csa({open_n62,addra[11:10]}),
    .dia(dia[8:0]),
    .wea(wea),
    .doa({inst_doa_i0_008,inst_doa_i0_007,inst_doa_i0_006,inst_doa_i0_005,inst_doa_i0_004,inst_doa_i0_003,inst_doa_i0_002,inst_doa_i0_001,inst_doa_i0_000}));
  // address_offset=0;data_offset=9;depth=1024;width=9;num_section=1;width_per_section=9;section_size=24;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    .CEBMUX("0"),
    .CLKBMUX("0"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("1"),
    .CSB0("1"),
    .CSB1("1"),
    .CSB2("1"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("SP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("0"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("0"),
    .RSTBMUX("0"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    inst_3600x24_sub_000000_009 (
    .addra({addra[9:0],3'b111}),
    .cea(cea),
    .clka(clka),
    .csa({open_n104,addra[11:10]}),
    .dia(dia[17:9]),
    .wea(wea),
    .doa({inst_doa_i0_017,inst_doa_i0_016,inst_doa_i0_015,inst_doa_i0_014,inst_doa_i0_013,inst_doa_i0_012,inst_doa_i0_011,inst_doa_i0_010,inst_doa_i0_009}));
  // address_offset=0;data_offset=18;depth=3600;width=2;num_section=1;width_per_section=2;section_size=24;working_depth=4096;working_width=2;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    .CEBMUX("0"),
    .CLKBMUX("0"),
    .CSA0("1"),
    .CSA1("1"),
    .CSA2("1"),
    .CSB0("1"),
    .CSB1("1"),
    .CSB2("1"),
    .DATA_WIDTH_A("2"),
    .DATA_WIDTH_B("2"),
    .MODE("SP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("0"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("0"),
    .RSTBMUX("0"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    inst_3600x24_sub_000000_018 (
    .addra({addra,1'b1}),
    .cea(cea),
    .clka(clka),
    .dia({open_n152,open_n153,open_n154,dia[19],open_n155,open_n156,dia[18],open_n157,open_n158}),
    .wea(wea),
    .doa({open_n173,open_n174,open_n175,open_n176,open_n177,open_n178,open_n179,inst_doa_i0_019,inst_doa_i0_018}));
  // address_offset=0;data_offset=20;depth=3600;width=2;num_section=1;width_per_section=2;section_size=24;working_depth=4096;working_width=2;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    .CEBMUX("0"),
    .CLKBMUX("0"),
    .CSA0("1"),
    .CSA1("1"),
    .CSA2("1"),
    .CSB0("1"),
    .CSB1("1"),
    .CSB2("1"),
    .DATA_WIDTH_A("2"),
    .DATA_WIDTH_B("2"),
    .MODE("SP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("0"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("0"),
    .RSTBMUX("0"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    inst_3600x24_sub_000000_020 (
    .addra({addra,1'b1}),
    .cea(cea),
    .clka(clka),
    .dia({open_n210,open_n211,open_n212,dia[21],open_n213,open_n214,dia[20],open_n215,open_n216}),
    .wea(wea),
    .doa({open_n231,open_n232,open_n233,open_n234,open_n235,open_n236,open_n237,inst_doa_i0_021,inst_doa_i0_020}));
  // address_offset=0;data_offset=22;depth=3600;width=2;num_section=1;width_per_section=2;section_size=24;working_depth=4096;working_width=2;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    .CEBMUX("0"),
    .CLKBMUX("0"),
    .CSA0("1"),
    .CSA1("1"),
    .CSA2("1"),
    .CSB0("1"),
    .CSB1("1"),
    .CSB2("1"),
    .DATA_WIDTH_A("2"),
    .DATA_WIDTH_B("2"),
    .MODE("SP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("0"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("0"),
    .RSTBMUX("0"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    inst_3600x24_sub_000000_022 (
    .addra({addra,1'b1}),
    .cea(cea),
    .clka(clka),
    .dia({open_n268,open_n269,open_n270,dia[23],open_n271,open_n272,dia[22],open_n273,open_n274}),
    .wea(wea),
    .doa({open_n289,open_n290,open_n291,open_n292,open_n293,open_n294,open_n295,inst_doa_i0_023,inst_doa_i0_022}));
  // address_offset=1024;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=24;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    .CEBMUX("0"),
    .CLKBMUX("0"),
    .CSA0("SIG"),
    .CSA1("INV"),
    .CSA2("1"),
    .CSB0("1"),
    .CSB1("1"),
    .CSB2("1"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("SP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("0"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("0"),
    .RSTBMUX("0"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    inst_3600x24_sub_001024_000 (
    .addra({addra[9:0],3'b111}),
    .cea(cea),
    .clka(clka),
    .csa({open_n320,addra[11:10]}),
    .dia(dia[8:0]),
    .wea(wea),
    .doa({inst_doa_i1_008,inst_doa_i1_007,inst_doa_i1_006,inst_doa_i1_005,inst_doa_i1_004,inst_doa_i1_003,inst_doa_i1_002,inst_doa_i1_001,inst_doa_i1_000}));
  // address_offset=1024;data_offset=9;depth=1024;width=9;num_section=1;width_per_section=9;section_size=24;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    .CEBMUX("0"),
    .CLKBMUX("0"),
    .CSA0("SIG"),
    .CSA1("INV"),
    .CSA2("1"),
    .CSB0("1"),
    .CSB1("1"),
    .CSB2("1"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("SP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("0"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("0"),
    .RSTBMUX("0"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    inst_3600x24_sub_001024_009 (
    .addra({addra[9:0],3'b111}),
    .cea(cea),
    .clka(clka),
    .csa({open_n362,addra[11:10]}),
    .dia(dia[17:9]),
    .wea(wea),
    .doa({inst_doa_i1_017,inst_doa_i1_016,inst_doa_i1_015,inst_doa_i1_014,inst_doa_i1_013,inst_doa_i1_012,inst_doa_i1_011,inst_doa_i1_010,inst_doa_i1_009}));
  // address_offset=2048;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=24;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    .CEBMUX("0"),
    .CLKBMUX("0"),
    .CSA0("INV"),
    .CSA1("SIG"),
    .CSA2("1"),
    .CSB0("1"),
    .CSB1("1"),
    .CSB2("1"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("SP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("0"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("0"),
    .RSTBMUX("0"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    inst_3600x24_sub_002048_000 (
    .addra({addra[9:0],3'b111}),
    .cea(cea),
    .clka(clka),
    .csa({open_n404,addra[11:10]}),
    .dia(dia[8:0]),
    .wea(wea),
    .doa({inst_doa_i2_008,inst_doa_i2_007,inst_doa_i2_006,inst_doa_i2_005,inst_doa_i2_004,inst_doa_i2_003,inst_doa_i2_002,inst_doa_i2_001,inst_doa_i2_000}));
  // address_offset=2048;data_offset=9;depth=1024;width=9;num_section=1;width_per_section=9;section_size=24;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    .CEBMUX("0"),
    .CLKBMUX("0"),
    .CSA0("INV"),
    .CSA1("SIG"),
    .CSA2("1"),
    .CSB0("1"),
    .CSB1("1"),
    .CSB2("1"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("SP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("0"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("0"),
    .RSTBMUX("0"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    inst_3600x24_sub_002048_009 (
    .addra({addra[9:0],3'b111}),
    .cea(cea),
    .clka(clka),
    .csa({open_n446,addra[11:10]}),
    .dia(dia[17:9]),
    .wea(wea),
    .doa({inst_doa_i2_017,inst_doa_i2_016,inst_doa_i2_015,inst_doa_i2_014,inst_doa_i2_013,inst_doa_i2_012,inst_doa_i2_011,inst_doa_i2_010,inst_doa_i2_009}));
  // address_offset=3072;data_offset=0;depth=528;width=9;num_section=1;width_per_section=9;section_size=24;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    .CEBMUX("0"),
    .CLKBMUX("0"),
    .CSA0("SIG"),
    .CSA1("SIG"),
    .CSA2("1"),
    .CSB0("1"),
    .CSB1("1"),
    .CSB2("1"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("SP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("0"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("0"),
    .RSTBMUX("0"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    inst_3600x24_sub_003072_000 (
    .addra({addra[9:0],3'b111}),
    .cea(cea),
    .clka(clka),
    .csa({open_n488,addra[11:10]}),
    .dia(dia[8:0]),
    .wea(wea),
    .doa({inst_doa_i3_008,inst_doa_i3_007,inst_doa_i3_006,inst_doa_i3_005,inst_doa_i3_004,inst_doa_i3_003,inst_doa_i3_002,inst_doa_i3_001,inst_doa_i3_000}));
  // address_offset=3072;data_offset=9;depth=528;width=9;num_section=1;width_per_section=9;section_size=24;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    .CEBMUX("0"),
    .CLKBMUX("0"),
    .CSA0("SIG"),
    .CSA1("SIG"),
    .CSA2("1"),
    .CSB0("1"),
    .CSB1("1"),
    .CSB2("1"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("SP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("0"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("0"),
    .RSTBMUX("0"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    inst_3600x24_sub_003072_009 (
    .addra({addra[9:0],3'b111}),
    .cea(cea),
    .clka(clka),
    .csa({open_n530,addra[11:10]}),
    .dia(dia[17:9]),
    .wea(wea),
    .doa({inst_doa_i3_017,inst_doa_i3_016,inst_doa_i3_015,inst_doa_i3_014,inst_doa_i3_013,inst_doa_i3_012,inst_doa_i3_011,inst_doa_i3_010,inst_doa_i3_009}));
  AL_MUX \inst_doa_mux_b0/al_mux_b0_0_0  (
    .i0(inst_doa_i0_000),
    .i1(inst_doa_i1_000),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b0/B0_0 ));
  AL_MUX \inst_doa_mux_b0/al_mux_b0_0_1  (
    .i0(inst_doa_i2_000),
    .i1(inst_doa_i3_000),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b0/B0_1 ));
  AL_MUX \inst_doa_mux_b0/al_mux_b0_1_0  (
    .i0(\inst_doa_mux_b0/B0_0 ),
    .i1(\inst_doa_mux_b0/B0_1 ),
    .sel(addra_piped[1]),
    .o(doa[0]));
  AL_MUX \inst_doa_mux_b1/al_mux_b0_0_0  (
    .i0(inst_doa_i0_001),
    .i1(inst_doa_i1_001),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b1/B0_0 ));
  AL_MUX \inst_doa_mux_b1/al_mux_b0_0_1  (
    .i0(inst_doa_i2_001),
    .i1(inst_doa_i3_001),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b1/B0_1 ));
  AL_MUX \inst_doa_mux_b1/al_mux_b0_1_0  (
    .i0(\inst_doa_mux_b1/B0_0 ),
    .i1(\inst_doa_mux_b1/B0_1 ),
    .sel(addra_piped[1]),
    .o(doa[1]));
  AL_MUX \inst_doa_mux_b10/al_mux_b0_0_0  (
    .i0(inst_doa_i0_010),
    .i1(inst_doa_i1_010),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b10/B0_0 ));
  AL_MUX \inst_doa_mux_b10/al_mux_b0_0_1  (
    .i0(inst_doa_i2_010),
    .i1(inst_doa_i3_010),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b10/B0_1 ));
  AL_MUX \inst_doa_mux_b10/al_mux_b0_1_0  (
    .i0(\inst_doa_mux_b10/B0_0 ),
    .i1(\inst_doa_mux_b10/B0_1 ),
    .sel(addra_piped[1]),
    .o(doa[10]));
  AL_MUX \inst_doa_mux_b11/al_mux_b0_0_0  (
    .i0(inst_doa_i0_011),
    .i1(inst_doa_i1_011),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b11/B0_0 ));
  AL_MUX \inst_doa_mux_b11/al_mux_b0_0_1  (
    .i0(inst_doa_i2_011),
    .i1(inst_doa_i3_011),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b11/B0_1 ));
  AL_MUX \inst_doa_mux_b11/al_mux_b0_1_0  (
    .i0(\inst_doa_mux_b11/B0_0 ),
    .i1(\inst_doa_mux_b11/B0_1 ),
    .sel(addra_piped[1]),
    .o(doa[11]));
  AL_MUX \inst_doa_mux_b12/al_mux_b0_0_0  (
    .i0(inst_doa_i0_012),
    .i1(inst_doa_i1_012),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b12/B0_0 ));
  AL_MUX \inst_doa_mux_b12/al_mux_b0_0_1  (
    .i0(inst_doa_i2_012),
    .i1(inst_doa_i3_012),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b12/B0_1 ));
  AL_MUX \inst_doa_mux_b12/al_mux_b0_1_0  (
    .i0(\inst_doa_mux_b12/B0_0 ),
    .i1(\inst_doa_mux_b12/B0_1 ),
    .sel(addra_piped[1]),
    .o(doa[12]));
  AL_MUX \inst_doa_mux_b13/al_mux_b0_0_0  (
    .i0(inst_doa_i0_013),
    .i1(inst_doa_i1_013),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b13/B0_0 ));
  AL_MUX \inst_doa_mux_b13/al_mux_b0_0_1  (
    .i0(inst_doa_i2_013),
    .i1(inst_doa_i3_013),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b13/B0_1 ));
  AL_MUX \inst_doa_mux_b13/al_mux_b0_1_0  (
    .i0(\inst_doa_mux_b13/B0_0 ),
    .i1(\inst_doa_mux_b13/B0_1 ),
    .sel(addra_piped[1]),
    .o(doa[13]));
  AL_MUX \inst_doa_mux_b14/al_mux_b0_0_0  (
    .i0(inst_doa_i0_014),
    .i1(inst_doa_i1_014),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b14/B0_0 ));
  AL_MUX \inst_doa_mux_b14/al_mux_b0_0_1  (
    .i0(inst_doa_i2_014),
    .i1(inst_doa_i3_014),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b14/B0_1 ));
  AL_MUX \inst_doa_mux_b14/al_mux_b0_1_0  (
    .i0(\inst_doa_mux_b14/B0_0 ),
    .i1(\inst_doa_mux_b14/B0_1 ),
    .sel(addra_piped[1]),
    .o(doa[14]));
  AL_MUX \inst_doa_mux_b15/al_mux_b0_0_0  (
    .i0(inst_doa_i0_015),
    .i1(inst_doa_i1_015),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b15/B0_0 ));
  AL_MUX \inst_doa_mux_b15/al_mux_b0_0_1  (
    .i0(inst_doa_i2_015),
    .i1(inst_doa_i3_015),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b15/B0_1 ));
  AL_MUX \inst_doa_mux_b15/al_mux_b0_1_0  (
    .i0(\inst_doa_mux_b15/B0_0 ),
    .i1(\inst_doa_mux_b15/B0_1 ),
    .sel(addra_piped[1]),
    .o(doa[15]));
  AL_MUX \inst_doa_mux_b16/al_mux_b0_0_0  (
    .i0(inst_doa_i0_016),
    .i1(inst_doa_i1_016),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b16/B0_0 ));
  AL_MUX \inst_doa_mux_b16/al_mux_b0_0_1  (
    .i0(inst_doa_i2_016),
    .i1(inst_doa_i3_016),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b16/B0_1 ));
  AL_MUX \inst_doa_mux_b16/al_mux_b0_1_0  (
    .i0(\inst_doa_mux_b16/B0_0 ),
    .i1(\inst_doa_mux_b16/B0_1 ),
    .sel(addra_piped[1]),
    .o(doa[16]));
  AL_MUX \inst_doa_mux_b17/al_mux_b0_0_0  (
    .i0(inst_doa_i0_017),
    .i1(inst_doa_i1_017),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b17/B0_0 ));
  AL_MUX \inst_doa_mux_b17/al_mux_b0_0_1  (
    .i0(inst_doa_i2_017),
    .i1(inst_doa_i3_017),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b17/B0_1 ));
  AL_MUX \inst_doa_mux_b17/al_mux_b0_1_0  (
    .i0(\inst_doa_mux_b17/B0_0 ),
    .i1(\inst_doa_mux_b17/B0_1 ),
    .sel(addra_piped[1]),
    .o(doa[17]));
  AL_MUX \inst_doa_mux_b18/al_mux_b0_0_0  (
    .i0(inst_doa_i0_018),
    .i1(inst_doa_i0_018),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b18/B0_0 ));
  AL_MUX \inst_doa_mux_b18/al_mux_b0_0_1  (
    .i0(inst_doa_i0_018),
    .i1(inst_doa_i0_018),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b18/B0_1 ));
  AL_MUX \inst_doa_mux_b18/al_mux_b0_1_0  (
    .i0(\inst_doa_mux_b18/B0_0 ),
    .i1(\inst_doa_mux_b18/B0_1 ),
    .sel(addra_piped[1]),
    .o(doa[18]));
  AL_MUX \inst_doa_mux_b19/al_mux_b0_0_0  (
    .i0(inst_doa_i0_019),
    .i1(inst_doa_i0_019),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b19/B0_0 ));
  AL_MUX \inst_doa_mux_b19/al_mux_b0_0_1  (
    .i0(inst_doa_i0_019),
    .i1(inst_doa_i0_019),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b19/B0_1 ));
  AL_MUX \inst_doa_mux_b19/al_mux_b0_1_0  (
    .i0(\inst_doa_mux_b19/B0_0 ),
    .i1(\inst_doa_mux_b19/B0_1 ),
    .sel(addra_piped[1]),
    .o(doa[19]));
  AL_MUX \inst_doa_mux_b2/al_mux_b0_0_0  (
    .i0(inst_doa_i0_002),
    .i1(inst_doa_i1_002),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b2/B0_0 ));
  AL_MUX \inst_doa_mux_b2/al_mux_b0_0_1  (
    .i0(inst_doa_i2_002),
    .i1(inst_doa_i3_002),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b2/B0_1 ));
  AL_MUX \inst_doa_mux_b2/al_mux_b0_1_0  (
    .i0(\inst_doa_mux_b2/B0_0 ),
    .i1(\inst_doa_mux_b2/B0_1 ),
    .sel(addra_piped[1]),
    .o(doa[2]));
  AL_MUX \inst_doa_mux_b20/al_mux_b0_0_0  (
    .i0(inst_doa_i0_020),
    .i1(inst_doa_i0_020),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b20/B0_0 ));
  AL_MUX \inst_doa_mux_b20/al_mux_b0_0_1  (
    .i0(inst_doa_i0_020),
    .i1(inst_doa_i0_020),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b20/B0_1 ));
  AL_MUX \inst_doa_mux_b20/al_mux_b0_1_0  (
    .i0(\inst_doa_mux_b20/B0_0 ),
    .i1(\inst_doa_mux_b20/B0_1 ),
    .sel(addra_piped[1]),
    .o(doa[20]));
  AL_MUX \inst_doa_mux_b21/al_mux_b0_0_0  (
    .i0(inst_doa_i0_021),
    .i1(inst_doa_i0_021),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b21/B0_0 ));
  AL_MUX \inst_doa_mux_b21/al_mux_b0_0_1  (
    .i0(inst_doa_i0_021),
    .i1(inst_doa_i0_021),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b21/B0_1 ));
  AL_MUX \inst_doa_mux_b21/al_mux_b0_1_0  (
    .i0(\inst_doa_mux_b21/B0_0 ),
    .i1(\inst_doa_mux_b21/B0_1 ),
    .sel(addra_piped[1]),
    .o(doa[21]));
  AL_MUX \inst_doa_mux_b22/al_mux_b0_0_0  (
    .i0(inst_doa_i0_022),
    .i1(inst_doa_i0_022),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b22/B0_0 ));
  AL_MUX \inst_doa_mux_b22/al_mux_b0_0_1  (
    .i0(inst_doa_i0_022),
    .i1(inst_doa_i0_022),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b22/B0_1 ));
  AL_MUX \inst_doa_mux_b22/al_mux_b0_1_0  (
    .i0(\inst_doa_mux_b22/B0_0 ),
    .i1(\inst_doa_mux_b22/B0_1 ),
    .sel(addra_piped[1]),
    .o(doa[22]));
  AL_MUX \inst_doa_mux_b23/al_mux_b0_0_0  (
    .i0(inst_doa_i0_023),
    .i1(inst_doa_i0_023),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b23/B0_0 ));
  AL_MUX \inst_doa_mux_b23/al_mux_b0_0_1  (
    .i0(inst_doa_i0_023),
    .i1(inst_doa_i0_023),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b23/B0_1 ));
  AL_MUX \inst_doa_mux_b23/al_mux_b0_1_0  (
    .i0(\inst_doa_mux_b23/B0_0 ),
    .i1(\inst_doa_mux_b23/B0_1 ),
    .sel(addra_piped[1]),
    .o(doa[23]));
  AL_MUX \inst_doa_mux_b3/al_mux_b0_0_0  (
    .i0(inst_doa_i0_003),
    .i1(inst_doa_i1_003),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b3/B0_0 ));
  AL_MUX \inst_doa_mux_b3/al_mux_b0_0_1  (
    .i0(inst_doa_i2_003),
    .i1(inst_doa_i3_003),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b3/B0_1 ));
  AL_MUX \inst_doa_mux_b3/al_mux_b0_1_0  (
    .i0(\inst_doa_mux_b3/B0_0 ),
    .i1(\inst_doa_mux_b3/B0_1 ),
    .sel(addra_piped[1]),
    .o(doa[3]));
  AL_MUX \inst_doa_mux_b4/al_mux_b0_0_0  (
    .i0(inst_doa_i0_004),
    .i1(inst_doa_i1_004),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b4/B0_0 ));
  AL_MUX \inst_doa_mux_b4/al_mux_b0_0_1  (
    .i0(inst_doa_i2_004),
    .i1(inst_doa_i3_004),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b4/B0_1 ));
  AL_MUX \inst_doa_mux_b4/al_mux_b0_1_0  (
    .i0(\inst_doa_mux_b4/B0_0 ),
    .i1(\inst_doa_mux_b4/B0_1 ),
    .sel(addra_piped[1]),
    .o(doa[4]));
  AL_MUX \inst_doa_mux_b5/al_mux_b0_0_0  (
    .i0(inst_doa_i0_005),
    .i1(inst_doa_i1_005),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b5/B0_0 ));
  AL_MUX \inst_doa_mux_b5/al_mux_b0_0_1  (
    .i0(inst_doa_i2_005),
    .i1(inst_doa_i3_005),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b5/B0_1 ));
  AL_MUX \inst_doa_mux_b5/al_mux_b0_1_0  (
    .i0(\inst_doa_mux_b5/B0_0 ),
    .i1(\inst_doa_mux_b5/B0_1 ),
    .sel(addra_piped[1]),
    .o(doa[5]));
  AL_MUX \inst_doa_mux_b6/al_mux_b0_0_0  (
    .i0(inst_doa_i0_006),
    .i1(inst_doa_i1_006),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b6/B0_0 ));
  AL_MUX \inst_doa_mux_b6/al_mux_b0_0_1  (
    .i0(inst_doa_i2_006),
    .i1(inst_doa_i3_006),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b6/B0_1 ));
  AL_MUX \inst_doa_mux_b6/al_mux_b0_1_0  (
    .i0(\inst_doa_mux_b6/B0_0 ),
    .i1(\inst_doa_mux_b6/B0_1 ),
    .sel(addra_piped[1]),
    .o(doa[6]));
  AL_MUX \inst_doa_mux_b7/al_mux_b0_0_0  (
    .i0(inst_doa_i0_007),
    .i1(inst_doa_i1_007),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b7/B0_0 ));
  AL_MUX \inst_doa_mux_b7/al_mux_b0_0_1  (
    .i0(inst_doa_i2_007),
    .i1(inst_doa_i3_007),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b7/B0_1 ));
  AL_MUX \inst_doa_mux_b7/al_mux_b0_1_0  (
    .i0(\inst_doa_mux_b7/B0_0 ),
    .i1(\inst_doa_mux_b7/B0_1 ),
    .sel(addra_piped[1]),
    .o(doa[7]));
  AL_MUX \inst_doa_mux_b8/al_mux_b0_0_0  (
    .i0(inst_doa_i0_008),
    .i1(inst_doa_i1_008),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b8/B0_0 ));
  AL_MUX \inst_doa_mux_b8/al_mux_b0_0_1  (
    .i0(inst_doa_i2_008),
    .i1(inst_doa_i3_008),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b8/B0_1 ));
  AL_MUX \inst_doa_mux_b8/al_mux_b0_1_0  (
    .i0(\inst_doa_mux_b8/B0_0 ),
    .i1(\inst_doa_mux_b8/B0_1 ),
    .sel(addra_piped[1]),
    .o(doa[8]));
  AL_MUX \inst_doa_mux_b9/al_mux_b0_0_0  (
    .i0(inst_doa_i0_009),
    .i1(inst_doa_i1_009),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b9/B0_0 ));
  AL_MUX \inst_doa_mux_b9/al_mux_b0_0_1  (
    .i0(inst_doa_i2_009),
    .i1(inst_doa_i3_009),
    .sel(addra_piped[0]),
    .o(\inst_doa_mux_b9/B0_1 ));
  AL_MUX \inst_doa_mux_b9/al_mux_b0_1_0  (
    .i0(\inst_doa_mux_b9/B0_0 ),
    .i1(\inst_doa_mux_b9/B0_1 ),
    .sel(addra_piped[1]),
    .o(doa[9]));
  not wea_inv (wea_neg, wea);

endmodule 

