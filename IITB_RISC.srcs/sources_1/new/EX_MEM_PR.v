`timescale 1ns / 1ps

module EX_MEM_PR(clk, rst, EX_FLUSH, EX_MEM_Write, 
                alu_out_in, RD_in, 
                PC_plus_2_in, Imm2_in, ra_in, rb_in, PC_in, op_in, RegWrite_in, L_in,
                S_in, invalid1_in, MemRead_in, MemWrite_in, MemtoReg_in, 
                CWrite_in, ZWrite_in, carry_in,
                alu_out_out, RD_out, PC_plus_2_out, Imm2_out, 
                ra_out, rb_out, PC_out, op_out, RegWrite_out, L_out, S_out, invalid1_out,
                MemRead_out, MemWrite_out, MemtoReg_out,
                CWrite_out, ZWrite_out, carry_out);
    input clk, rst, EX_FLUSH, EX_MEM_Write;
    input [15:0] alu_out_in, PC_plus_2_in, ra_in, rb_in, PC_in;
    input [3:0] op_in;
    input [2:0] RD_in;
    input [8:0] Imm2_in;
    input MemRead_in, MemWrite_in, RegWrite_in, L_in, S_in, invalid1_in;
    input [1:0] MemtoReg_in;
    input CWrite_in, carry_in;
    input [1:0] ZWrite_in;
    output reg [15:0] alu_out_out, PC_plus_2_out, ra_out, rb_out, PC_out;
    output reg [3:0] op_out;
    output reg [2:0] RD_out;
    output reg [8:0] Imm2_out;
    output reg MemRead_out, MemWrite_out, RegWrite_out, L_out, S_out, invalid1_out;
    output reg [1:0] MemtoReg_out;
    output reg CWrite_out, carry_out;
    output reg [1:0] ZWrite_out;
    
    always @ (posedge clk) begin
        if (rst) begin
            // Reset behavior
            alu_out_out <= 16'b0;
            RD_out <= 4'b0;
            PC_plus_2_out <= 16'b0;
            Imm2_out <= 9'b0;
            MemRead_out <= 1'b0;
            MemWrite_out <= 1'b0;
            MemtoReg_out <= 2'b00;
            ra_out <= 16'b0;
            rb_out <= 16'b0;
            RegWrite_out <= 1'b0;
            L_out <= 1'b0;
            S_out <= 1'b0;
            CWrite_out <= 1'b0;
            ZWrite_out <= 2'b00;
            carry_out <= 1'b0;
            op_out <= 4'hb;
            PC_out <= 16'hb000;
            invalid1_out <= 1'b0;
        end
        else if (EX_MEM_Write) begin
            if (EX_FLUSH) begin
                // Flush behavior
                alu_out_out <= 16'b0;
                RD_out <= 4'b0;
                PC_plus_2_out <= 16'b0;
                Imm2_out <= 9'b0;
                MemRead_out <= 1'b0;
                MemWrite_out <= 1'b0;
                MemtoReg_out <= 2'b00;
                ra_out <= 16'b0;
                rb_out <= 16'b0;
                RegWrite_out <= 1'b0;
                L_out <= 1'b0;
                S_out <= 1'b0;
                CWrite_out <= 1'b0;
                ZWrite_out <= 2'b00;
                carry_out <= 1'b0;
                op_out <= 4'hb;
                PC_out <= 16'hb000;
                invalid1_out <= 1'b1;
            end
            else begin
                // Normal write behavior
                alu_out_out <= alu_out_in;
                RD_out <= RD_in;
                PC_plus_2_out <= PC_plus_2_in;
                Imm2_out <= Imm2_in;
                MemRead_out <= MemRead_in;
                MemWrite_out <= MemWrite_in;
                MemtoReg_out <= MemtoReg_in;
                ra_out <= ra_in;
                rb_out <= rb_in;
                RegWrite_out <= RegWrite_in;
                L_out <= L_in;
                S_out <= S_in;
                CWrite_out <= CWrite_in;
                ZWrite_out <= ZWrite_in;
                carry_out <= carry_in;
                op_out <= op_in;
                PC_out <= PC_in;
                invalid1_out <= invalid1_in;
            end
        end
        // If EX_MEM_Write is low, maintain current values (implicit in Verilog)
    end
    
endmodule