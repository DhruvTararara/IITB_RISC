`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2024 03:46:34 PM
// Design Name: 
// Module Name: Sign_Extension
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


module Sign_Extension(Imm1, Imm2, SE_Imm1, SE_Imm2);
    input [5:0] Imm1;
    input [8:0] Imm2;
    output [15:0] SE_Imm1;
    output [15:0] SE_Imm2;
    
    assign SE_Imm1 = {{10{Imm1[5]}}, Imm1};
    assign SE_Imm2 = {{7{Imm2[8]}}, Imm2};
    
endmodule
