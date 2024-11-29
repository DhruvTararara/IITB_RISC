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


// IP VLNV: xilinx.com:module_ref:RR_Control:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module IITB_RISC_RR_Control_0_0 (
  op,
  ET,
  LT,
  stall,
  invalid1,
  ALUSrc1,
  ALUSrc2,
  ALUOp,
  RegDst,
  MemRead,
  MemWrite,
  MemtoReg,
  L,
  S,
  S3,
  S2,
  S1,
  branch,
  CWrite,
  ZWrite
);

input wire [3 : 0] op;
input wire ET;
input wire LT;
input wire stall;
input wire invalid1;
output wire ALUSrc1;
output wire ALUSrc2;
output wire ALUOp;
output wire [1 : 0] RegDst;
output wire MemRead;
output wire MemWrite;
output wire [1 : 0] MemtoReg;
output wire L;
output wire S;
output wire [1 : 0] S3;
output wire [1 : 0] S2;
output wire [1 : 0] S1;
output wire [1 : 0] branch;
output wire CWrite;
output wire [1 : 0] ZWrite;

  RR_Control inst (
    .op(op),
    .ET(ET),
    .LT(LT),
    .stall(stall),
    .invalid1(invalid1),
    .ALUSrc1(ALUSrc1),
    .ALUSrc2(ALUSrc2),
    .ALUOp(ALUOp),
    .RegDst(RegDst),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .MemtoReg(MemtoReg),
    .L(L),
    .S(S),
    .S3(S3),
    .S2(S2),
    .S1(S1),
    .branch(branch),
    .CWrite(CWrite),
    .ZWrite(ZWrite)
  );
endmodule
