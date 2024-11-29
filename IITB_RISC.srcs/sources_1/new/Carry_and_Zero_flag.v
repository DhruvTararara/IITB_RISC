`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2024 02:07:06 PM
// Design Name: 
// Module Name: Carry_and_Zero_flag
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


module Carry_and_Zero_flag(clk, rst, CWrite, ZWrite, carry_in, alu_in, dm_data_in, c, z);
    input clk, rst;
    input CWrite;
    input [1:0] ZWrite;
    input carry_in;
    input [15:0] alu_in, dm_data_in;
    output c, z;
    reg carry_flag, zero_flag;
    
    assign c = carry_flag;
    assign z = carry_flag;
    
    always @ (posedge clk) begin
        if (rst) begin
            carry_flag <= 1'b0;
            zero_flag <= 1'b0;
        end
        else begin
            if (CWrite) carry_flag <= carry_in;
            else carry_flag <= carry_flag;
            if (ZWrite[0]) begin
                if (ZWrite[1]) begin
                    if (dm_data_in == 16'b0) zero_flag <= 1'b1;
                    else zero_flag <= 1'b0;
                end
                else begin
                    if (alu_in == 16'b0) zero_flag <= 1'b1;
                    else zero_flag <= 1'b0;
                end
            end
            else zero_flag <= zero_flag;
        end
    end
    
endmodule
