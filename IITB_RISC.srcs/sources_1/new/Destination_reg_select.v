`timescale 1ns / 1ps

module Destination_reg_select(RA, RB, RC, LM_reg, RD, RegDst);
    input [2:0] RA, RB, RC, LM_reg;
    input [1:0] RegDst;
    output reg [2:0] RD;
    
    always @ (*) begin
        case (RegDst)
            2'b00: RD <= RC;
            2'b01: RD <= RA;
            2'b10: RD <= RB;
            2'b11: RD <= LM_reg;
            default: RD <= RC;
        endcase
    end
    
endmodule