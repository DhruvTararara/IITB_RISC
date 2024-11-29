`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2024 11:12:31 PM
// Design Name: 
// Module Name: RR_EX_PR
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


module RR_EX_PR(clk, rst, RR_EX_Write, RR_FLUSH, i_in, x_in, PC_in, PC_plus_2_in, 
                ALUSrc1_in, ALUSrc2_in, ALUOp_in, MemRead_in, MemWrite_in, RegDst_in, MemtoReg_in, 
                L_in, S_in, stall_in, invalid1_in,
                RA_final_in, RB_final_in, RC_in, ra_in, rb_in, SE_Imm1_in, op_in, Imm2_in, comp_in, cz_in, SM_reg_in, 
                CWrite_in, ZWrite_in,
                i_out, x_out, PC_out, PC_plus_2_out,
                ALUSrc1_out, ALUSrc2_out, ALUOp_out, MemRead_out, MemWrite_out, RegDst_out, MemtoReg_out,
                L_out, S_out, stall_out, invalid1_out,
                RA_final_out, RB_final_out, RC_out, ra_out, rb_out, SE_Imm1_out, op_out, Imm2_out, comp_out, cz_out, SM_reg_out,
                CWrite_out, ZWrite_out);
                
    input clk, rst, RR_EX_Write, RR_FLUSH;
    input [2:0] i_in, x_in;
    input [15:0] PC_in, PC_plus_2_in;
    input ALUSrc1_in, ALUSrc2_in, ALUOp_in, MemRead_in, MemWrite_in, L_in, S_in, 
          stall_in, invalid1_in;
    input [1:0] RegDst_in, MemtoReg_in;
    input [2:0]  RA_final_in, RB_final_in, RC_in;
    input [15:0] ra_in, rb_in, SE_Imm1_in;
    input [3:0] op_in;
    input [8:0] Imm2_in;
    input comp_in;
    input [1:0] cz_in;
    input [2:0] SM_reg_in;
    input CWrite_in;
    input [1:0] ZWrite_in;
    output reg [2:0] i_out, x_out;
    output reg [15:0] PC_out, PC_plus_2_out;
    output reg ALUSrc1_out, ALUSrc2_out, ALUOp_out, MemRead_out, MemWrite_out, L_out, S_out, 
          stall_out, invalid1_out;
    output reg [1:0] RegDst_out, MemtoReg_out;
    output reg [2:0]  RA_final_out, RB_final_out, RC_out;
    output reg [15:0] ra_out, rb_out, SE_Imm1_out;
    output reg [3:0] op_out;
    output reg [8:0] Imm2_out;
    output reg comp_out;
    output reg [1:0] cz_out;
    output reg [2:0] SM_reg_out;
    output reg CWrite_out;
    output reg [1:0] ZWrite_out;
    
//    always @ (posedge clk) begin
//        if (rst)begin
//        end
//        else if (RR_EX_Write) begin
//            if (RR_FLUSH) begin
//            end
//            else begin
//            end
//        end
//    end

    always @ (posedge clk) begin
        if (rst) begin
            // Reset behavior
            i_out <= 3'b0;
            x_out <= 3'b0;
            PC_out <= 16'b0;
            PC_plus_2_out <= 16'b0;
            ALUSrc1_out <= 1'b0;
            ALUSrc2_out <= 1'b0;
            ALUOp_out <= 1'b0;
            MemRead_out <= 1'b0;
            MemWrite_out <= 1'b0;
            RegDst_out <= 2'b0;
            MemtoReg_out <= 2'b0;
            L_out <= 1'b0;
            S_out <= 1'b0;
            stall_out <= 1'b0;
            RA_final_out <= 4'b0;
            RB_final_out <= 4'b0;
            RC_out <= 4'b0;
            ra_out <= 16'b0;
            rb_out <= 16'b0;
            SE_Imm1_out <= 16'b0;
            op_out <= 4'b1011;
            Imm2_out <= 9'b0;
            comp_out <= 1'b0;
            cz_out <= 2'b0;
            SM_reg_out <= 2'b00;
            CWrite_out <= 1'b0;
            ZWrite_out <= 2'b00;
            invalid1_out <= 1'b0;
        end
        else if (RR_EX_Write) begin
            if (RR_FLUSH) begin
                // Flush behavior
                i_out <= 3'b0;
                x_out <= 3'b0;
                PC_out <= 16'b0;
                PC_plus_2_out <= 16'b0;
                ALUSrc1_out <= 1'b0;
                ALUSrc2_out <= 1'b0;
                ALUOp_out <= 1'b0;
                MemRead_out <= 1'b0;
                MemWrite_out <= 1'b0;
                RegDst_out <= 2'b0;
                MemtoReg_out <= 2'b0;
                L_out <= 1'b0;
                S_out <= 1'b0;
                stall_out <= 1'b0;
                RA_final_out <= 4'b0;
                RB_final_out <= 4'b0;
                RC_out <= 4'b0;
                ra_out <= 16'b0;
                rb_out <= 16'b0;
                SE_Imm1_out <= 16'b0;
                op_out <= 4'b1011;
                Imm2_out <= 9'b0;
                comp_out <= 1'b0;
                cz_out <= 2'b0;
                SM_reg_out <= 2'b00;
                CWrite_out <= 1'b0;
                ZWrite_out <= 2'b00;
                invalid1_out <= 1'b1;
            end
            else begin
                // Normal write behavior
                i_out <= i_in;
                x_out <= x_in;
                PC_out <= PC_in;
                PC_plus_2_out <= PC_plus_2_in;
                ALUSrc1_out <= ALUSrc1_in;
                ALUSrc2_out <= ALUSrc2_in;
                ALUOp_out <= ALUOp_in;
                MemRead_out <= MemRead_in;
                MemWrite_out <= MemWrite_in;
                RegDst_out <= RegDst_in;
                MemtoReg_out <= MemtoReg_in;
                L_out <= L_in;
                S_out <= S_in;
                stall_out <= stall_in;
                RA_final_out <= RA_final_in;
                RB_final_out <= RB_final_in;
                RC_out <= RC_in;
                ra_out <= ra_in;
                rb_out <= rb_in;
                SE_Imm1_out <= SE_Imm1_in;
                op_out <= op_in;
                Imm2_out <= Imm2_in;
                comp_out <= comp_in;
                cz_out <= cz_in;
                SM_reg_out <= SM_reg_in;
                CWrite_out <= CWrite_in;
                ZWrite_out <= ZWrite_in;
                invalid1_out <= invalid1_in;
            end
        end
        // If RR_EX_Write is low, maintain current values (implicit in Verilog)
    end
    
endmodule