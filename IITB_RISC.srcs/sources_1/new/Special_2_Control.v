`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2024 12:25:07 PM
// Design Name: 
// Module Name: Special_2_Control
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


module Special_2_Control(clk, rst, x_ex, RD_wb, RegWrite_wb, L_wb, special_2);
    input clk, rst;
    input [2:0] x_ex;
    input [2:0] RD_wb;
    input RegWrite_wb, L_wb;
    output reg special_2;
    reg next_special_2;
    
    always @ (posedge clk) begin
        if (rst) special_2 <= 1'b0;
        else special_2 <= next_special_2;
    end
    
    always @ (*) begin
        case (special_2)
            1'b0: begin
                if ((RD_wb == 3'b000) & RegWrite_wb & L_wb) next_special_2 <= 1'b1;
                else next_special_2 <= 1'b0;
            end
            1'b1: begin
                if (x_ex == 3'b010) next_special_2 <= 1'b0;
//                else if (x_ex == 3'b001) next_special_2 <= 1'b0;
                else next_special_2 <= 1'b1;
            end
            default: next_special_2 <= 1'b0;
        endcase
    end
    
endmodule
