`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2024 01:24:53 PM
// Design Name: 
// Module Name: ALU_inputs
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


module ALU_inputs(forwardA, forwardB, ALUSrc1, ALUSrc2, ra, rb, SE_Imm1, alu_out_mem, Imm2_mem, write_data_wb, 
                  comp, L, S, L_mem, op, op_mem, S_mem, op_1, op_2, ra_final, rb_final);
    input [1:0] forwardA, forwardB;
    input ALUSrc1, ALUSrc2, comp;
    input L, S, L_mem, S_mem;
    input [15:0] ra, rb, SE_Imm1, write_data_wb, alu_out_mem;
    input [3:0] op, op_mem;
    input [8:0] Imm2_mem;
    output reg [15:0] op_1, op_2;
    output reg [15:0] ra_final, rb_final;
    
    always @ (*) begin
        case (forwardA)
            2'b00: ra_final <= ra;
            2'b01: ra_final <= write_data_wb;
            2'b10: ra_final <= alu_out_mem;
            2'b11: ra_final <= {7'b0, Imm2_mem};
            default: ra_final <= ra;
        endcase
        case (forwardB)
            2'b00: rb_final <= rb;
            2'b01: rb_final <= write_data_wb;
            2'b10: rb_final <= alu_out_mem;
            2'b11: rb_final <= {7'b0, Imm2_mem};
            default: rb_final <= rb;
        endcase
    end
    
    always @ (*) begin
        if ((L | S) & (L_mem | S_mem)) begin
            op_1 <= alu_out_mem;
        end
        else begin
            case (ALUSrc1)
            1'b0: op_1 <= ra_final;
            1'b1: op_1 <= rb_final;
            default: op_1 <= ra_final;
        endcase
        end
        if (L | S) begin
            if ((L_mem | S_mem) & (op == op_mem)) op_2 <= 16'd2;
            else op_2 <= 16'd0;
        end
        else begin
            case (ALUSrc2)
                1'b0: begin
                    if (comp) op_2 <= ~rb_final;
                    else op_2 <= rb_final;
                end
                1'b1: op_2 <= SE_Imm1;
                default: op_2 <= rb_final;
            endcase
        end
    end
    
endmodule
