`timescale 1ns / 1ps

module ALU_Control_unit(ALUOp, opcode, cz, ALU_CB);
    input ALUOp;
    input [3:0] opcode;
    input [1:0] cz;
    output [1:0] ALU_CB;
    
    assign ALU_CB = (!ALUOp)? 2'b00: (opcode == 4'b0010)? 2'b10: (cz == 2'b11)? 2'b01: 2'b00;
    
endmodule