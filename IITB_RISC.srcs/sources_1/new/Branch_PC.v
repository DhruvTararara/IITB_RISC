`timescale 1ns / 1ps

module Branch_PC(S3, S2, S1, SE_Imm1, SE_Imm2, PC, ra, rb, branch_pc);
    input S3, S2, S1;
    input [15:0] SE_Imm1, SE_Imm2, PC, ra, rb;
    output [15:0] branch_pc;
    wire [15:0] a, b;
    
    assign a = (S2)? ra: PC;
    assign b = (S3)? ({SE_Imm2[14:0], 1'b0}): ({SE_Imm1[14:0], 1'b0});
    assign branch_pc = (!S1)? rb: (a + b);
    
endmodule