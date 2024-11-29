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


// IP VLNV: xilinx.com:module_ref:ALU_inputs:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module IITB_RISC_ALU_inputs_0_0 (
  forwardA,
  forwardB,
  ALUSrc1,
  ALUSrc2,
  ra,
  rb,
  SE_Imm1,
  alu_out_mem,
  Imm2_mem,
  write_data_wb,
  comp,
  L,
  S,
  L_mem,
  op,
  op_mem,
  S_mem,
  op_1,
  op_2,
  ra_final,
  rb_final
);

input wire [1 : 0] forwardA;
input wire [1 : 0] forwardB;
input wire ALUSrc1;
input wire ALUSrc2;
input wire [15 : 0] ra;
input wire [15 : 0] rb;
input wire [15 : 0] SE_Imm1;
input wire [15 : 0] alu_out_mem;
input wire [8 : 0] Imm2_mem;
input wire [15 : 0] write_data_wb;
input wire comp;
input wire L;
input wire S;
input wire L_mem;
input wire [3 : 0] op;
input wire [3 : 0] op_mem;
input wire S_mem;
output wire [15 : 0] op_1;
output wire [15 : 0] op_2;
output wire [15 : 0] ra_final;
output wire [15 : 0] rb_final;

  ALU_inputs inst (
    .forwardA(forwardA),
    .forwardB(forwardB),
    .ALUSrc1(ALUSrc1),
    .ALUSrc2(ALUSrc2),
    .ra(ra),
    .rb(rb),
    .SE_Imm1(SE_Imm1),
    .alu_out_mem(alu_out_mem),
    .Imm2_mem(Imm2_mem),
    .write_data_wb(write_data_wb),
    .comp(comp),
    .L(L),
    .S(S),
    .L_mem(L_mem),
    .op(op),
    .op_mem(op_mem),
    .S_mem(S_mem),
    .op_1(op_1),
    .op_2(op_2),
    .ra_final(ra_final),
    .rb_final(rb_final)
  );
endmodule
