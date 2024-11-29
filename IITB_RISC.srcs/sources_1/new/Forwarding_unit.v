`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2024 01:24:09 PM
// Design Name: 
// Module Name: Forwarding_unit
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


module Forwarding_unit(RA, RB, RD_mem, RD_wb, RegWrite_mem, RegWrite_wb, invalid1_mem, invalid1_wb, MemtoReg_mem, forwardA, forwardB);
    input [2:0] RA, RB, RD_mem, RD_wb;
    input RegWrite_mem, RegWrite_wb, invalid1_mem, invalid1_wb;
    input [1:0] MemtoReg_mem;
    output reg [1:0] forwardA, forwardB;
    
//    always @ (*) begin
//        if (RegWrite_mem) begin
//            if (RD_mem == RA) begin
//                if (MemtoReg_mem == 2'b11) forwardA <= 2'b11;
//                else forwardA <= 2'b10;
//            end
//            else if (RD_wb == RA) forwardA <= 2'b01;
//            else forwardA <= 2'b00;
//        end
////        else if (RegWrite_wb) begin
////            if (RD_mem == RB) forwardB <= 2'b10;
////            else if (RD_wb == RB) forwardB <= 2'b01;
////            else forwardB <= 2'b00;
////        end
//        else begin
//            forwardA <= 2'b00;
////            forwardB <= 2'b00;
//        end
//    end
    
//    always @ (*) begin
//        if (RegWrite_wb) begin
//            if (RD_mem == RB) begin
//                if (MemtoReg_mem == 2'b11) forwardB <= 2'b11;
//                else forwardB <= 2'b10;
//            end
//            else if (RD_wb == RB) forwardB <= 2'b01;
//            else forwardB <= 2'b00;
//        end
//        else begin
//            forwardB <= 2'b00;
//        end
//    end
    
    always @ (*) begin
        if (!invalid1_mem) begin
            if (RegWrite_mem) begin
                if (RD_mem == RA) begin
                    if (MemtoReg_mem == 2'b11) forwardA <= 2'b11;
                    else forwardA <= 2'b10;
                end
            end
            else if (RegWrite_wb) begin
                if (RD_wb == RA) forwardA <= 2'b01;
            end
            else forwardA <= 2'b00;
        end
        else forwardA <= 2'b00;
    end
    always @ (*) begin
        if (!invalid1_wb) begin
            if (RegWrite_mem) begin
                if (RD_mem == RB) begin
                    if (MemtoReg_mem == 2'b11) forwardB <= 2'b11;
                    else forwardB <= 2'b10;
                end
            end
            else if (RegWrite_wb) begin
                if (RD_wb == RB) forwardB <= 2'b01;
            end
            else forwardB <= 2'b00;
        end
        else forwardB <= 2'b00;
    end
endmodule
