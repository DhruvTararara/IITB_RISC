`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2024 11:37:34 PM
// Design Name: 
// Module Name: Hazard_Detection_Unit
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


module Hazard_Detection_Unit(op_rr, op_ex, branch_rr, special_wb, special_2, MemRead_ex, RD_ex, RD_mem, RD_wb, RA_RR, RB_RR, L, S, L_ex, L_mem, L_wb,
                             RegWrite_wb, RegWrite_mem, x, PC_Write, IF_Write, ID_Write, stall, IF_FLUSH, ID_FLUSH, RR_FLUSH, EX_FLUSH, MEM_FLUSH);
    input [3:0] op_ex, op_rr;
    input branch_rr, special_wb, special_2, MemRead_ex;
    input [2:0] RD_ex, RD_mem, RD_wb, RA_RR, RB_RR;
    input L, S, L_ex, L_mem, L_wb, RegWrite_wb, RegWrite_mem;
    input [2:0] x;
    output reg PC_Write, IF_Write, ID_Write, stall;
    output IF_FLUSH, ID_FLUSH, RR_FLUSH, EX_FLUSH, MEM_FLUSH;
    
    always @ (*) begin
        if (MemRead_ex || (op_ex == 4'b0011)) begin
            if ((RD_ex == RA_RR) || (RD_ex == RB_RR)) begin
                PC_Write <= 1'b0;
                IF_Write <= 1'b0;
                ID_Write <= 1'b0;
                stall <= 1'b1;
            end
            else if ((L == 1'b1) || (S == 1'b1)) begin//If LW then LM/SM type condition happens, hazard for LW is of more priority
//                PC_Write <= 1'b0;
//                IF_Write <= 1'b0;
//                ID_Write <= 1'b0;
//                stall <= 1'b0;
                if (x == 1) begin
                    PC_Write <= 1'b1;
                    IF_Write <= 1'b1;
                    ID_Write <= 1'b1;
                    stall <= 1'b0;
                end
                else if (x >= 3'd2) begin
                    if ((RD_wb == 3'b0) && RegWrite_wb) begin
                        if (!L_wb) begin
                            PC_Write <= 1'b1;
                            IF_Write <= 1'b1;
                            ID_Write <= 1'b1;
                            stall <= 1'b0;
                        end
                        else begin
                            PC_Write <= 1'b1;
                            IF_Write <= 1'b0;
                            ID_Write <= 1'b0;
                            stall <= 1'b0;
                        end
                    end
                    else begin
                        PC_Write <= 1'b0;
                        IF_Write <= 1'b0;
                        ID_Write <= 1'b0;
                        stall <= 1'b0;
                    end
                end
                else begin
                    PC_Write <= 1'b0;
                    IF_Write <= 1'b0;
                    ID_Write <= 1'b0;
                    stall <= 1'b0;
                end
            end
            else begin
                PC_Write <= 1'b1;
                IF_Write <= 1'b1;
                ID_Write <= 1'b1;
                stall <= 1'b0;
            end
        end
        else if (((op_rr == 4'b1000) || (op_rr == 4'b1001) || (op_rr == 4'b1010)) && RegWrite_mem) begin
            if ((RD_mem == RA_RR) || (RD_mem == RB_RR)) begin
                PC_Write <= 1'b0;
                IF_Write <= 1'b0;
                ID_Write <= 1'b0;
                stall <= 1'b1;
            end
            else begin
                PC_Write <= 1'b1;
                IF_Write <= 1'b1;
                ID_Write <= 1'b1;
                stall <= 1'b0;
            end
        end
        else if ((L == 1'b1) || (S == 1'b1)) begin
            if (x == 1) begin
                PC_Write <= 1'b1;
                IF_Write <= 1'b1;
                ID_Write <= 1'b1;
                stall <= 1'b0;
            end
            else if (x >= 3'd2) begin
                if ((RD_wb == 3'b0) && RegWrite_wb) begin
                    if (!L_wb) begin
                        PC_Write <= 1'b1;
                        IF_Write <= 1'b1;
                        ID_Write <= 1'b1;
                        stall <= 1'b0;
                    end
                    else begin
                        PC_Write <= 1'b1;
                        IF_Write <= 1'b0;
                        ID_Write <= 1'b0;
                        stall <= 1'b0;
                    end
                end
                else begin
                    PC_Write <= 1'b0;
                    IF_Write <= 1'b0;
                    ID_Write <= 1'b0;
                    stall <= 1'b0;
                end
            end
            else begin
                PC_Write <= 1'b0;
                IF_Write <= 1'b0;
                ID_Write <= 1'b0;
                stall <= 1'b0;
            end
        end
        else begin
            PC_Write <= 1'b1;
            IF_Write <= 1'b1;
            ID_Write <= 1'b1;
            stall <= 1'b0;
        end
    end
    
    assign IF_FLUSH = (branch_rr | (special_wb & !L_wb))? 1'b1: 1'b0;
    assign ID_FLUSH = (branch_rr | (special_wb & !L_wb) | (special_wb & L_wb & (x == 3'b1)) | (special_2 & (x == 3'b1)))? 1'b1: 1'b0;
    assign RR_FLUSH = ((special_wb & !L_wb) || (special_wb & L_wb & !L))? 1'b1: 1'b0;
    assign EX_FLUSH = ((special_wb & !L_wb) || (special_wb & L_wb & !L_ex))? 1'b1: 1'b0;
    assign MEM_FLUSH = ((special_wb & !L_wb) || (special_wb & L_wb & !L_mem))? 1'b1: 1'b0;
    
endmodule
