`timescale 1ns / 1ps

module ALU(op_1, op_2, ALU_CB, c, alu_out, carry_out);
    input [15:0] op_1, op_2;
    input [1:0] ALU_CB;
    input c;
    output reg [15:0] alu_out;
    output reg carry_out;
    wire [16:0] carry;
    
    assign carry = {15'b0, c};
    
    always @ (*) begin
        case (ALU_CB)
            2'b00: {carry_out, alu_out} <= {1'b0, op_1} + {1'b0, op_2};
            2'b01: {carry_out, alu_out} <= {1'b0, op_1} + {1'b0, op_2} + carry;
            2'b10: begin alu_out <= ~(op_1 & op_2); carry_out <= 1'b0; end
            default: begin alu_out <= op_1 + op_2; carry_out <= 1'b0; end
        endcase
    end
    
endmodule