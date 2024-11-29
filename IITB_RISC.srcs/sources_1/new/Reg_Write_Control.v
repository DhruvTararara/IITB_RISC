`timescale 1ns / 1ps

module Reg_Write_Control(stall, invalid1, op, c, z, cz, RegWrite);
    input [3:0] op;
    input stall;
    input invalid1;
    input c, z;
    input [1:0] cz;
    output RegWrite;
    reg R_W;
    
    assign RegWrite = (stall | invalid1)? 1'b0: (R_W);//lw then R-type (hazard)
    
    always @ (*) begin
        case (op)
            4'b0000, 4'b0100, 4'b1101, 4'b0011, 4'b1100: R_W <= 1'b1;
            4'b0101, 4'b1000, 4'b1001, 4'b1010, 4'b1111: R_W <= 1'b0;
            4'b0001: begin
                if (cz == 2'b10) R_W <= c;
                else if (cz == 2'b01) R_W <= z;
                else R_W <= 1'b1;
            end
            4'b0010: begin
                if (cz == 2'b00) R_W <= 1'b1;
                else if (cz == 2'b01) R_W <= z;
                else if (cz == 2'b10) R_W <= c;
                else R_W <= 1'b0;
            end
            4'b0110: R_W <= 1;//LM
            4'b0111: R_W <= 0;//SM
            default: R_W <= 1'b0;
        endcase
    end
    
endmodule