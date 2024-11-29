`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2024 03:35:41 PM
// Design Name: 
// Module Name: Instruction_Decoder
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


module Instruction_Decoder(instr_in, ID_FLUSH, op, RA, RB, RC, comp, cz, Imm1, Imm2);
    input [15:0] instr_in;
    input ID_FLUSH;
    output [3:0] op;
    output [2:0] RA, RB, RC;
    output comp;
    output [1:0] cz;
    output [5:0] Imm1;
    output [8:0] Imm2;
    wire [15:0] instr;
    
    assign instr = (ID_FLUSH)? 16'hb000: instr_in;//Figure out whether 16'bb000 at flush in is correct or not
    assign op = instr[15:12];
    assign RA = instr[11:9];
    assign RB = instr[8:6];
    assign RC = instr[5:3];
    assign comp = instr[2];
    assign cz = instr[1:0];
    assign Imm1 = instr[5:0];
    assign Imm2 = instr[8:0];
    
endmodule
