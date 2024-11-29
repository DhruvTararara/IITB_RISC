// (c) Copyright 1995-2024 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:RR_EX_PR:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module IITB_RISC_RR_EX_PR_0_0 (
  clk,
  rst,
  RR_EX_Write,
  RR_FLUSH,
  i_in,
  x_in,
  PC_in,
  PC_plus_2_in,
  ALUSrc1_in,
  ALUSrc2_in,
  ALUOp_in,
  MemRead_in,
  MemWrite_in,
  RegDst_in,
  MemtoReg_in,
  L_in,
  S_in,
  stall_in,
  invalid1_in,
  RA_final_in,
  RB_final_in,
  RC_in,
  ra_in,
  rb_in,
  SE_Imm1_in,
  op_in,
  Imm2_in,
  comp_in,
  cz_in,
  SM_reg_in,
  CWrite_in,
  ZWrite_in,
  i_out,
  x_out,
  PC_out,
  PC_plus_2_out,
  ALUSrc1_out,
  ALUSrc2_out,
  ALUOp_out,
  MemRead_out,
  MemWrite_out,
  RegDst_out,
  MemtoReg_out,
  L_out,
  S_out,
  stall_out,
  invalid1_out,
  RA_final_out,
  RB_final_out,
  RC_out,
  ra_out,
  rb_out,
  SE_Imm1_out,
  op_out,
  Imm2_out,
  comp_out,
  cz_out,
  SM_reg_out,
  CWrite_out,
  ZWrite_out
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN IITB_RISC_clk_0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst RST" *)
input wire rst;
input wire RR_EX_Write;
input wire RR_FLUSH;
input wire [2 : 0] i_in;
input wire [2 : 0] x_in;
input wire [15 : 0] PC_in;
input wire [15 : 0] PC_plus_2_in;
input wire ALUSrc1_in;
input wire ALUSrc2_in;
input wire ALUOp_in;
input wire MemRead_in;
input wire MemWrite_in;
input wire [1 : 0] RegDst_in;
input wire [1 : 0] MemtoReg_in;
input wire L_in;
input wire S_in;
input wire stall_in;
input wire invalid1_in;
input wire [2 : 0] RA_final_in;
input wire [2 : 0] RB_final_in;
input wire [2 : 0] RC_in;
input wire [15 : 0] ra_in;
input wire [15 : 0] rb_in;
input wire [15 : 0] SE_Imm1_in;
input wire [3 : 0] op_in;
input wire [8 : 0] Imm2_in;
input wire comp_in;
input wire [1 : 0] cz_in;
input wire [2 : 0] SM_reg_in;
input wire CWrite_in;
input wire [1 : 0] ZWrite_in;
output wire [2 : 0] i_out;
output wire [2 : 0] x_out;
output wire [15 : 0] PC_out;
output wire [15 : 0] PC_plus_2_out;
output wire ALUSrc1_out;
output wire ALUSrc2_out;
output wire ALUOp_out;
output wire MemRead_out;
output wire MemWrite_out;
output wire [1 : 0] RegDst_out;
output wire [1 : 0] MemtoReg_out;
output wire L_out;
output wire S_out;
output wire stall_out;
output wire invalid1_out;
output wire [2 : 0] RA_final_out;
output wire [2 : 0] RB_final_out;
output wire [2 : 0] RC_out;
output wire [15 : 0] ra_out;
output wire [15 : 0] rb_out;
output wire [15 : 0] SE_Imm1_out;
output wire [3 : 0] op_out;
output wire [8 : 0] Imm2_out;
output wire comp_out;
output wire [1 : 0] cz_out;
output wire [2 : 0] SM_reg_out;
output wire CWrite_out;
output wire [1 : 0] ZWrite_out;

  RR_EX_PR inst (
    .clk(clk),
    .rst(rst),
    .RR_EX_Write(RR_EX_Write),
    .RR_FLUSH(RR_FLUSH),
    .i_in(i_in),
    .x_in(x_in),
    .PC_in(PC_in),
    .PC_plus_2_in(PC_plus_2_in),
    .ALUSrc1_in(ALUSrc1_in),
    .ALUSrc2_in(ALUSrc2_in),
    .ALUOp_in(ALUOp_in),
    .MemRead_in(MemRead_in),
    .MemWrite_in(MemWrite_in),
    .RegDst_in(RegDst_in),
    .MemtoReg_in(MemtoReg_in),
    .L_in(L_in),
    .S_in(S_in),
    .stall_in(stall_in),
    .invalid1_in(invalid1_in),
    .RA_final_in(RA_final_in),
    .RB_final_in(RB_final_in),
    .RC_in(RC_in),
    .ra_in(ra_in),
    .rb_in(rb_in),
    .SE_Imm1_in(SE_Imm1_in),
    .op_in(op_in),
    .Imm2_in(Imm2_in),
    .comp_in(comp_in),
    .cz_in(cz_in),
    .SM_reg_in(SM_reg_in),
    .CWrite_in(CWrite_in),
    .ZWrite_in(ZWrite_in),
    .i_out(i_out),
    .x_out(x_out),
    .PC_out(PC_out),
    .PC_plus_2_out(PC_plus_2_out),
    .ALUSrc1_out(ALUSrc1_out),
    .ALUSrc2_out(ALUSrc2_out),
    .ALUOp_out(ALUOp_out),
    .MemRead_out(MemRead_out),
    .MemWrite_out(MemWrite_out),
    .RegDst_out(RegDst_out),
    .MemtoReg_out(MemtoReg_out),
    .L_out(L_out),
    .S_out(S_out),
    .stall_out(stall_out),
    .invalid1_out(invalid1_out),
    .RA_final_out(RA_final_out),
    .RB_final_out(RB_final_out),
    .RC_out(RC_out),
    .ra_out(ra_out),
    .rb_out(rb_out),
    .SE_Imm1_out(SE_Imm1_out),
    .op_out(op_out),
    .Imm2_out(Imm2_out),
    .comp_out(comp_out),
    .cz_out(cz_out),
    .SM_reg_out(SM_reg_out),
    .CWrite_out(CWrite_out),
    .ZWrite_out(ZWrite_out)
  );
endmodule
