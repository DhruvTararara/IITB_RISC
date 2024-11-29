`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2024 12:29:49 PM
// Design Name: 
// Module Name: RB_select
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


module RB_select(RB, i, op, SM_reg, RB_final);
    input [2:0] RB;
    input [3:0] op;
    input [2:0] i;
    output [2:0] RB_final;
    output [2:0] SM_reg;
    
    assign SM_reg = 3'd7 - i;
    assign RB_final = (op == 4'd7)? SM_reg: RB;
    
endmodule
