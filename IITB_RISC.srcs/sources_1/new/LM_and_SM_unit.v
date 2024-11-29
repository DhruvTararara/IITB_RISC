`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2024 11:59:17 AM
// Design Name: 
// Module Name: LM_and_SM_unit
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


module LM_and_SM_unit(L_ex, S_ex, i_ex, Imm2, L, S, i, x);
    input L_ex, S_ex;
    input [2:0] i_ex;
    input [8:0] Imm2;
    input L, S;
    output reg [2:0] i, x;
    wire [3:0] add;
    wire [7:0] I;
    
    assign I = ((L_ex & ~S) | (S_ex & ~L)) ? Imm2 & ((1 << i_ex) - 1) : Imm2;
    assign add = I[0] + I[1] + I[2] + I[3] + I[4] + I[5] + I[6] + I[7]; 
    //Logic for x
    always @ (*) begin
        if (L == 1 || S == 1) x <= add;
        else x <= 4'b0;
    end
    //Logic for i
    always @ (*) begin
        if (L == 1 || S == 1) begin
            if (I[7]) i <= 4'd7;
            else if (I[6]) i <= 4'd6;
            else if (I[5]) i <= 4'd5;
            else if (I[4]) i <= 4'd4;
            else if (I[3]) i <= 4'd3;
            else if (I[2]) i <= 4'd2;
            else if (I[1]) i <= 4'd1;
            else i <= 4'd0;
        end
        else i <= 4'd7;
    end
endmodule
