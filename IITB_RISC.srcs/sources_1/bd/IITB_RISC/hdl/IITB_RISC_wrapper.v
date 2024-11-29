//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Thu Sep 19 16:56:31 2024
//Host        : CHEEMz-PC running 64-bit major release  (build 9200)
//Command     : generate_target IITB_RISC_wrapper.bd
//Design      : IITB_RISC_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module IITB_RISC_wrapper
   (Load_address,
    Load_data,
    PC_out_0,
    R0_0,
    R1_0,
    R2_0,
    R3_0,
    R4_0,
    R5_0,
    R6_0,
    R7_0,
    Store_address,
    Store_data,
    c_0,
    clk_0,
    rst_0,
    z_0);
  output [2:0]Load_address;
  output [15:0]Load_data;
  output [15:0]PC_out_0;
  output [15:0]R0_0;
  output [15:0]R1_0;
  output [15:0]R2_0;
  output [15:0]R3_0;
  output [15:0]R4_0;
  output [15:0]R5_0;
  output [15:0]R6_0;
  output [15:0]R7_0;
  output [15:0]Store_address;
  output [15:0]Store_data;
  output c_0;
  input clk_0;
  input rst_0;
  output z_0;

  wire [2:0]Load_address;
  wire [15:0]Load_data;
  wire [15:0]PC_out_0;
  wire [15:0]R0_0;
  wire [15:0]R1_0;
  wire [15:0]R2_0;
  wire [15:0]R3_0;
  wire [15:0]R4_0;
  wire [15:0]R5_0;
  wire [15:0]R6_0;
  wire [15:0]R7_0;
  wire [15:0]Store_address;
  wire [15:0]Store_data;
  wire c_0;
  wire clk_0;
  wire rst_0;
  wire z_0;

  IITB_RISC IITB_RISC_i
       (.Load_address(Load_address),
        .Load_data(Load_data),
        .PC_out_0(PC_out_0),
        .R0_0(R0_0),
        .R1_0(R1_0),
        .R2_0(R2_0),
        .R3_0(R3_0),
        .R4_0(R4_0),
        .R5_0(R5_0),
        .R6_0(R6_0),
        .R7_0(R7_0),
        .Store_address(Store_address),
        .Store_data(Store_data),
        .c_0(c_0),
        .clk_0(clk_0),
        .rst_0(rst_0),
        .z_0(z_0));
endmodule
