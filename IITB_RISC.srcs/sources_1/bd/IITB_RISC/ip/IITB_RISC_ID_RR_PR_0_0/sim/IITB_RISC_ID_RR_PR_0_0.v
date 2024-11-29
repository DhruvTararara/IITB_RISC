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


// IP VLNV: xilinx.com:module_ref:ID_RR_PR:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module IITB_RISC_ID_RR_PR_0_0 (
  clk,
  rst,
  ID_FLUSH,
  ID_RR_write,
  PC_in,
  PC_plus_2_in,
  op_in,
  RA_in,
  RB_in,
  RC_in,
  comp_in,
  invalid1_in,
  cz_in,
  Imm2_in,
  SE_Imm1_in,
  SE_Imm2_in,
  PC_out,
  PC_plus_2_out,
  op_out,
  RA_out,
  RB_out,
  RC_out,
  comp_out,
  invalid1_out,
  cz_out,
  Imm2_out,
  SE_Imm1_out,
  SE_Imm2_out
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN IITB_RISC_clk_0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst RST" *)
input wire rst;
input wire ID_FLUSH;
input wire ID_RR_write;
input wire [15 : 0] PC_in;
input wire [15 : 0] PC_plus_2_in;
input wire [3 : 0] op_in;
input wire [2 : 0] RA_in;
input wire [2 : 0] RB_in;
input wire [2 : 0] RC_in;
input wire comp_in;
input wire invalid1_in;
input wire [1 : 0] cz_in;
input wire [8 : 0] Imm2_in;
input wire [15 : 0] SE_Imm1_in;
input wire [15 : 0] SE_Imm2_in;
output wire [15 : 0] PC_out;
output wire [15 : 0] PC_plus_2_out;
output wire [3 : 0] op_out;
output wire [2 : 0] RA_out;
output wire [2 : 0] RB_out;
output wire [2 : 0] RC_out;
output wire comp_out;
output wire invalid1_out;
output wire [1 : 0] cz_out;
output wire [8 : 0] Imm2_out;
output wire [15 : 0] SE_Imm1_out;
output wire [15 : 0] SE_Imm2_out;

  ID_RR_PR inst (
    .clk(clk),
    .rst(rst),
    .ID_FLUSH(ID_FLUSH),
    .ID_RR_write(ID_RR_write),
    .PC_in(PC_in),
    .PC_plus_2_in(PC_plus_2_in),
    .op_in(op_in),
    .RA_in(RA_in),
    .RB_in(RB_in),
    .RC_in(RC_in),
    .comp_in(comp_in),
    .invalid1_in(invalid1_in),
    .cz_in(cz_in),
    .Imm2_in(Imm2_in),
    .SE_Imm1_in(SE_Imm1_in),
    .SE_Imm2_in(SE_Imm2_in),
    .PC_out(PC_out),
    .PC_plus_2_out(PC_plus_2_out),
    .op_out(op_out),
    .RA_out(RA_out),
    .RB_out(RB_out),
    .RC_out(RC_out),
    .comp_out(comp_out),
    .invalid1_out(invalid1_out),
    .cz_out(cz_out),
    .Imm2_out(Imm2_out),
    .SE_Imm1_out(SE_Imm1_out),
    .SE_Imm2_out(SE_Imm2_out)
  );
endmodule
