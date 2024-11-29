`timescale 1ns / 1ps

module MEM_WB_PR(clk, rst, MEM_WB_Write, MEM_FLUSH, dm_data_in, PC_plus_2_in,
                Imm2_in, alu_out_in, PC_in, MemtoReg_in, RD_in, L_in, S_in, RegWrite_in, invalid1_in,
                CWrite_in, ZWrite_in, carry_in, mem_data_in, mem_addr_in,
                dm_data_out, PC_plus_2_out, Imm2_out, alu_out_out, PC_out, MemtoReg_out, 
                RD_out, L_out, S_out, RegWrite_out, invalid1_out,
                CWrite_out, ZWrite_out, carry_out, mem_data_out, mem_addr_out);
    input clk, rst, MEM_WB_Write, MEM_FLUSH;
    input [15:0] dm_data_in, PC_plus_2_in, alu_out_in, PC_in;
    input [8:0] Imm2_in;
    input [1:0] MemtoReg_in;
    input [2:0] RD_in;
    input L_in, S_in, RegWrite_in, invalid1_in;
    input CWrite_in, carry_in;
    input [1:0] ZWrite_in;
    input [15:0] mem_data_in;
    input [15:0] mem_addr_in;
    output reg [15:0] dm_data_out, PC_plus_2_out, alu_out_out, PC_out;
    output reg [8:0] Imm2_out;
    output reg [1:0] MemtoReg_out;
    output reg [2:0] RD_out;
    output reg L_out, S_out, RegWrite_out, invalid1_out;
    output reg CWrite_out, carry_out;
    output reg [1:0] ZWrite_out;
    output reg [15:0] mem_data_out;
    output reg [15:0] mem_addr_out;
    
    always @(posedge clk) begin
        if (rst) begin
            // Reset behavior
            dm_data_out <= 16'b0;
            PC_plus_2_out <= 16'b0;
            alu_out_out <= 16'b0;
            Imm2_out <= 9'b0;
            MemtoReg_out <= 2'b0;
            RD_out <= 3'b0;
            L_out <= 1'b0;
            S_out <= 1'b0;
            RegWrite_out <= 1'b0;
            CWrite_out <= 1'b0;
            ZWrite_out <= 2'b00;
            carry_out <= 1'b0;
            PC_out <= 16'hb000;
            mem_data_out <= 16'h0000;
            mem_addr_out <= 16'h0000;
            invalid1_out <= 1'b0;
        end
        else if (MEM_WB_Write) begin
            if (MEM_FLUSH) begin
                // Flush behavior
                dm_data_out <= 16'b0;
                PC_plus_2_out <= 16'b0;
                alu_out_out <= 16'b0;
                Imm2_out <= 9'b0;
                MemtoReg_out <= 2'b0;
                RD_out <= 3'b0;
                L_out <= 1'b0;
                S_out <= 1'b0;
                RegWrite_out <= 1'b0;
                CWrite_out <= 1'b0;
                ZWrite_out <= 2'b00;
                carry_out <= 1'b0;
                PC_out <= 16'hb000;
                mem_data_out <= 16'h0000;
                mem_addr_out <= 16'h0000;
                invalid1_out <= 1'b1;
            end
            else begin
                // Normal write behavior
                dm_data_out <= dm_data_in;
                PC_plus_2_out <= PC_plus_2_in;
                alu_out_out <= alu_out_in;
                Imm2_out <= Imm2_in;
                MemtoReg_out <= MemtoReg_in;
                RD_out <= RD_in;
                L_out <= L_in;
                S_out <= S_in;
                RegWrite_out <= RegWrite_in;
                CWrite_out <= CWrite_in;
                ZWrite_out <= ZWrite_in;
                carry_out <= carry_in;
                PC_out <= PC_in;
                mem_data_out <= mem_data_in;
                mem_addr_out <= mem_addr_in;
                invalid1_out <= invalid1_in;
            end
        end
        // If MEM_WB_Write is low, maintain current values (implicit in Verilog)
    end
    
endmodule