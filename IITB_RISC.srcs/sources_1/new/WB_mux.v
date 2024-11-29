`timescale 1ns / 1ps

module WB_mux(MemtoReg, alu_out, dm_data, PC_plus_2, Imm2, write_data);
    input [15:0] alu_out, dm_data, PC_plus_2;
    input [8:0] Imm2;
    input [1:0] MemtoReg;
    output reg [15:0] write_data;
    wire [15:0] LLI_out;
    
    assign LLI_out = {7'b0, Imm2};
    
    always @ (*) begin
        case (MemtoReg)
            2'b00: write_data <= alu_out;
            2'b01: write_data <= dm_data;
            2'b10: write_data <= PC_plus_2;
            2'b11: write_data <= LLI_out;
            default: ;
        endcase
    end
    
endmodule