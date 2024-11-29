`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2024 02:06:49 PM
// Design Name: 
// Module Name: Instruction_Memory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Instruction_Memory(rst, PC, instr);
    input rst;
    input [15:0] PC;
    output [15:0] instr;
    parameter depth = 2**16;
    reg [7:0] mem [depth-1:0];
    wire misaligned_instr;
    
    //initial $readmemh("C:/Xilinx/IITB_RISC/memory.txt",mem);
    assign instr = (rst)? 16'hb000: {mem[PC+1], mem[PC]};
    assign misaligned_instr = PC[0];
endmodule
