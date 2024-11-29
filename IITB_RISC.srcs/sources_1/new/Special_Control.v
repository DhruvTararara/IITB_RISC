`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2024 01:23:58 PM
// Design Name: 
// Module Name: Special_Control
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


module Special_Control(RD, RegWrite, L, S, special_wb);
    input [2:0] RD;
    input RegWrite;
    input L, S;
    output special_wb;
    
    assign special_wb = ((RD == 3'b000) && RegWrite)? 1'b1: 1'b0;
    
endmodule
