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


// IP VLNV: xilinx.com:module_ref:Forwarding_unit:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module IITB_RISC_Forwarding_unit_0_0 (
  RA,
  RB,
  RD_mem,
  RD_wb,
  RegWrite_mem,
  RegWrite_wb,
  invalid1_mem,
  invalid1_wb,
  MemtoReg_mem,
  forwardA,
  forwardB
);

input wire [2 : 0] RA;
input wire [2 : 0] RB;
input wire [2 : 0] RD_mem;
input wire [2 : 0] RD_wb;
input wire RegWrite_mem;
input wire RegWrite_wb;
input wire invalid1_mem;
input wire invalid1_wb;
input wire [1 : 0] MemtoReg_mem;
output wire [1 : 0] forwardA;
output wire [1 : 0] forwardB;

  Forwarding_unit inst (
    .RA(RA),
    .RB(RB),
    .RD_mem(RD_mem),
    .RD_wb(RD_wb),
    .RegWrite_mem(RegWrite_mem),
    .RegWrite_wb(RegWrite_wb),
    .invalid1_mem(invalid1_mem),
    .invalid1_wb(invalid1_wb),
    .MemtoReg_mem(MemtoReg_mem),
    .forwardA(forwardA),
    .forwardB(forwardB)
  );
endmodule
