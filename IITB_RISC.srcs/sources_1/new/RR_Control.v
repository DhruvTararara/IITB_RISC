`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2024 10:38:17 PM
// Design Name: 
// Module Name: RR_Control
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


module RR_Control(op, ET, LT, stall, invalid1, ALUSrc1, ALUSrc2, ALUOp, RegDst, MemRead, MemWrite, MemtoReg, 
                  L, S, S3, S2, S1, branch, CWrite, ZWrite);
    input [3:0] op;
    input ET, LT, stall, invalid1;
    output reg ALUSrc1, ALUSrc2, ALUOp, MemRead, MemWrite, L, S;
    output reg [1:0] RegDst, MemtoReg, S3, S2, S1, branch;
    output reg CWrite;
    output reg [1:0] ZWrite;
    
    
    always @ (*) begin
        if (stall | invalid1) begin
            ALUSrc1 <= 1'b0; ALUSrc2 <= 1'b0; ALUOp <= 1'b0; RegDst <= 2'b00; MemRead <= 1'b0; MemWrite <= 1'b0; MemtoReg <= 2'b00; L <= 1'b0; S <= 1'b0; CWrite <= 1'b0; ZWrite <= 2'b00;
        end
        else begin
            case (op[3:0])
                4'b0000: begin ALUSrc1 <= 1'b0; ALUSrc2 <= 1'b1; ALUOp <= 1'b0; RegDst <= 2'b10; MemRead <= 1'b0; MemWrite <= 1'b0; MemtoReg <= 2'b00; L <= 1'b0; S <= 1'b0; CWrite <= 1'b1; ZWrite <= 2'b01; end
                4'b0001: begin ALUSrc1 <= 1'b0; ALUSrc2 <= 1'b0; ALUOp <= 1'b1; RegDst <= 2'b00; MemRead <= 1'b0; MemWrite <= 1'b0; MemtoReg <= 2'b00; L <= 1'b0; S <= 1'b0; CWrite <= 1'b1; ZWrite <= 2'b01; end
                4'b0010: begin ALUSrc1 <= 1'b0; ALUSrc2 <= 1'b0; ALUOp <= 1'b1; RegDst <= 2'b00; MemRead <= 1'b0; MemWrite <= 1'b0; MemtoReg <= 2'b00; L <= 1'b0; S <= 1'b0; CWrite <= 1'b0; ZWrite <= 2'b01; end
                4'b0011: begin ALUOp <= 1'b0; RegDst <= 2'b01; MemRead <= 1'b0; MemWrite <= 1'b0; MemtoReg <= 2'b11; L <= 1'b0; S <= 1'b0; CWrite <= 1'b0; ZWrite <= 2'b00; end
                4'b0100: begin ALUSrc1 <= 1'b1; ALUSrc2 <= 1'b1; ALUOp <= 1'b0; RegDst <= 2'b01; MemRead <= 1'b1; MemWrite <= 1'b0; MemtoReg <= 2'b01; L <= 1'b0; S <= 1'b0; CWrite <= 1'b0; ZWrite <= 2'b11; end
                4'b0101: begin ALUSrc1 <= 1'b1; ALUSrc2 <= 1'b1; ALUOp <= 1'b0; MemRead <= 1'b0; MemWrite <= 1'b1; L <= 1'b0; S <= 1'b0; CWrite <= 1'b0; ZWrite <= 2'b00; end
                4'b0110: begin ALUSrc1 <= 1'b0; ALUOp <= 1'b0; RegDst <= 2'b11; MemRead <= 1'b1; MemWrite <= 1'b0; MemtoReg <= 2'b01; L <= 1'b1; S <= 1'b0; CWrite <= 1'b0; ZWrite <= 2'b00; end
                4'b0111: begin ALUSrc1 <= 1'b0; ALUOp <= 1'b0; MemRead <= 1'b0; MemWrite <= 1'b1; L <= 1'b0; S <= 1'b1; CWrite <= 1'b0; ZWrite <= 2'b00; end
                4'b1000: begin ALUOp <= 1'b0; MemRead <= 1'b0; MemWrite <= 1'b0; L <= 1'b0; S <= 1'b0; CWrite <= 1'b0; ZWrite <= 2'b00; end
                4'b1001: begin ALUOp <= 1'b0; MemRead <= 1'b0; MemWrite <= 1'b0; L <= 1'b0; S <= 1'b0; CWrite <= 1'b0; ZWrite <= 2'b00; end
                4'b1010: begin ALUOp <= 1'b0; MemRead <= 1'b0; MemWrite <= 1'b0; L <= 1'b0; S <= 1'b0; CWrite <= 1'b0; ZWrite <= 2'b00; end
                4'b1100: begin ALUOp <= 1'b0; RegDst <= 2'b01; MemRead <= 1'b0; MemWrite <= 1'b0; MemtoReg <= 2'b10; L <= 1'b0; S <= 1'b0; CWrite <= 1'b0; ZWrite <= 2'b00; end
                4'b1101: begin ALUOp <= 1'b0; RegDst <= 2'b01; MemRead <= 1'b0; MemWrite <= 1'b0; MemtoReg <= 2'b10; L <= 1'b0; S <= 1'b0; CWrite <= 1'b0; ZWrite <= 2'b00; end
                4'b1111: begin ALUOp <= 1'b0; MemRead <= 1'b0; MemWrite <= 1'b0; L <= 1'b0; S <= 1'b0; CWrite <= 1'b0; ZWrite <= 2'b00; end
                default: begin ALUOp <= 1'b0; MemRead <= 1'b0; MemWrite <= 1'b0; L <= 1'b0; S <= 1'b0; CWrite <= 1'b0; ZWrite <= 2'b00; end
            endcase
        end
//        case (op[3:0])
//            4'b0000: begin ALUSrc1 <= 1'b0; ALUSrc2 <= 1'b1; ALUOp <= 1'b0; RegDst <= 2'b10; MemRead <= 1'b0; MemWrite <= 1'b0; MemtoReg <= 2'b00; L <= 1'b0; S <= 1'b0; end
//            4'b0001: begin ALUSrc1 <= 1'b0; ALUSrc2 <= 1'b0; ALUOp <= 1'b1; RegDst <= 2'b00; MemRead <= 1'b0; MemWrite <= 1'b0; MemtoReg <= 2'b00; L <= 1'b0; S <= 1'b0; end
//            4'b0010: begin ALUSrc1 <= 1'b0; ALUSrc2 <= 1'b0; ALUOp <= 1'b1; RegDst <= 2'b00; MemRead <= 1'b0; MemWrite <= 1'b0; MemtoReg <= 2'b00; L <= 1'b0; S <= 1'b0; end
//            4'b0011: begin ALUOp <= 1'b0; RegDst <= 2'b01; MemRead <= 1'b1; MemWrite <= 1'b0; MemtoReg <= 2'b11; L <= 1'b0; S <= 1'b0; end
//            4'b0100: begin ALUSrc1 <= 1'b1; ALUSrc2 <= 1'b1; ALUOp <= 1'b0; RegDst <= 2'b01; MemRead <= 1'b1; MemWrite <= 1'b0; MemtoReg <= 2'b01; L <= 1'b0; S <= 1'b0; end
//            4'b0101: begin ALUSrc1 <= 1'b1; ALUSrc2 <= 1'b1; ALUOp <= 1'b0; MemRead <= 1'b0; MemWrite <= 1'b1; L <= 1'b0; S <= 1'b0; end
//            4'b0110: begin ALUSrc1 <= 1'b0; ALUOp <= 1'b0; RegDst <= 2'b11; MemRead <= 1'b0; MemWrite <= 1'b0; MemtoReg <= 2'b01; L <= 1'b1; S <= 1'b0; end
//            4'b0111: begin ALUSrc1 <= 1'b0; ALUOp <= 1'b0; MemRead <= 1'b0; MemWrite <= 1'b1; L <= 1'b0; S <= 1'b1; end
//            4'b1000: begin ALUOp <= 1'b0; MemRead <= 1'b0; MemWrite <= 1'b0; L <= 1'b0; S <= 1'b0; end
//            4'b1001: begin ALUOp <= 1'b0; MemRead <= 1'b0; MemWrite <= 1'b0; L <= 1'b0; S <= 1'b0; end
//            4'b1010: begin ALUOp <= 1'b0; MemRead <= 1'b0; MemWrite <= 1'b0; L <= 1'b0; S <= 1'b0; end
//            4'b1100: begin ALUOp <= 1'b0; RegDst <= 2'b01; MemRead <= 1'b0; MemWrite <= 1'b0; MemtoReg <= 2'b10; L <= 1'b0; S <= 1'b0; end
//            4'b1101: begin ALUOp <= 1'b0; RegDst <= 2'b01; MemRead <= 1'b0; MemWrite <= 1'b0; MemtoReg <= 2'b10; L <= 1'b0; S <= 1'b0; end
//            4'b1111: begin ALUOp <= 1'b0; MemRead <= 1'b0; MemWrite <= 1'b0; L <= 1'b0; S <= 1'b0; end
//            default: begin ALUOp <= 1'b0; MemRead <= 1'b0; MemWrite <= 1'b0; L <= 1'b0; S <= 1'b0; end
//        endcase
    end
    
    always @ (*) begin
        if (stall | invalid1) begin
            S3 <= 1'b0; S2 <= 1'b0; S1 <= 1'b0; branch <= 1'b0;
        end
        else begin
            case (op[3:0])
                4'b0000, 4'b0001, 4'b0010, 4'b0011, 4'b0100, 4'b0101, 4'b0110, 4'b0111: begin branch <= 1'b0; end
                4'b1101: begin S1 <= 1'b0; branch <= 1'b1; end
                4'b1100: begin S3 <= 1'b1; S2 <= 1'b0; S1 <= 1'b1; branch <= 1'b1; end
                4'b1111: begin S3 <= 1'b1; S2 <= 1'b1; S1 <= 1'b1; branch <= 1'b1; end
                4'b1000: begin
                    if (ET) begin S3 <= 1'b0; S2 <= 1'b0; S1 <= 1'b1; branch <= 1'b1; end
                    else begin branch <= 1'b0; end
                end
                4'b1001: begin
                    if (LT) begin S3 <= 1'b0; S2 <= 1'b0; S1 <= 1'b1; branch <= 1'b1; end
                    else begin branch <= 1'b0; end
                end
                4'b1010: begin
                    if ((~ET)&(~LT)) begin branch <= 1'b0; end
                    else if ((~ET)&(LT)) begin S3 <= 1'b0; S2 <= 1'b0; S1 <= 1'b1; branch <= 1'b1; end
                    else if ((ET)&(~LT)) begin S3 <= 1'b0; S2 <= 1'b0; S1 <= 1'b1; branch <= 1'b1; end
                    else begin S3 <= 1'b0; S2 <= 1'b0; S1 <= 1'b1; branch <= 1'b1; end
                end
                default: begin
                    S3 <= 1'b0; S2 <= 1'b0; S1 <= 1'b0; branch <= 1'b0;
                end
            endcase
        end
//        case (op[3:0])
//            4'b0000, 4'b0001, 4'b0010, 4'b0011, 4'b0100, 4'b0101, 4'b0110, 4'b0111: begin branch <= 1'b0; end
//            4'b1101: begin S1 <= 1'b0; branch <= 1'b1; end
//            4'b1100: begin S3 <= 1'b1; S2 <= 1'b0; S1 <= 1'b1; branch <= 1'b1; end
//            4'b1111: begin S3 <= 1'b1; S2 <= 1'b1; S1 <= 1'b1; branch <= 1'b1; end
//            4'b1000: begin
//                if (ET) begin S3 <= 1'b0; S2 <= 1'b0; S1 <= 1'b1; branch <= 1'b1; end
//                else begin branch <= 1'b0; end
//            end
//            4'b1001: begin
//                if (LT) begin S3 <= 1'b0; S2 <= 1'b0; S1 <= 1'b1; branch <= 1'b1; end
//                else begin branch <= 1'b0; end
//            end
//            4'b1010: begin
//                if ((~ET)&(~LT)) begin branch <= 1'b0; end
//                else if ((~ET)&(LT)) begin S3 <= 1'b0; S2 <= 1'b0; S1 <= 1'b1; branch <= 1'b1; end
//                else if ((ET)&(~LT)) begin S3 <= 1'b0; S2 <= 1'b0; S1 <= 1'b1; branch <= 1'b1; end
//                else begin S3 <= 1'b0; S2 <= 1'b0; S1 <= 1'b1; branch <= 1'b1; end
//            end
//        endcase
    end
    
endmodule