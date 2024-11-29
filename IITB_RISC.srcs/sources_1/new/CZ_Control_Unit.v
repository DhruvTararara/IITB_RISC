`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2024 11:50:29 AM
// Design Name: 
// Module Name: CZ_Control_Unit
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


module CZ_Control_Unit(C, Z, carry_out_wb, alu_out_wb, CWrite_wb, ZWrite_wb, 
                       carry_out_mem, alu_out_mem, dm_data_wb, dm_data_mem, CWrite_mem, ZWrite_mem, invalid1_mem, invalid1_wb, C_final, Z_final);
    input C, Z, carry_out_wb, CWrite_wb, carry_out_mem, CWrite_mem, invalid1_mem, invalid1_wb;
    input [1:0] ZWrite_wb, ZWrite_mem;
    input [15:0] alu_out_wb, alu_out_mem, dm_data_wb, dm_data_mem;
    output reg C_final, Z_final;
    reg forwardC, forwardZ;
    
    always @ (*) begin
        if (!invalid1_mem) begin
            if (CWrite_mem) forwardC <= 2'b10;
            else if (CWrite_wb) forwardC <= 2'b01;
            else forwardC <= 2'b00;
        end
        else forwardC <= 2'b00;
    end
    
    always @ (*) begin
        if (!invalid1_wb) begin
            if (ZWrite_mem[0]) forwardZ <= 2'b10;
            else if (ZWrite_wb[0]) forwardZ <= 2'b01;
            else forwardZ <= 2'b00;
        end
        else forwardZ <= 2'b00;
    end
    
    always @ (*) begin
        case (forwardC)
            2'b00: C_final <= C;
            2'b01: C_final <= carry_out_wb;
            2'b10: C_final <= carry_out_mem;
            default: C_final <= C;
        endcase
    end
    
    always @ (*) begin
        case (forwardZ)
            2'b00: Z_final <= Z;
//            2'b01: begin
//                if (alu_out_wb == 16'b0) Z_final <= 1'b1;
//                else Z_final <= 1'b0;
//            end
            2'b01: begin
                if (ZWrite_wb[1]) begin
                    if (dm_data_wb == 16'd0) Z_final <= 1'b1;
                    else Z_final <= 1'b0;
                end
                else begin
                    if (alu_out_wb == 16'd0) Z_final <= 1'b1;
                    else Z_final <= 1'b0;
                end
            end
//            2'b10: begin
//                if (alu_out_mem == 16'b0) Z_final <= 1'b1;
//                else Z_final <= 1'b0;
//            end
            2'b10: begin
                if (ZWrite_mem[1]) begin
                    if (dm_data_mem == 16'd0) Z_final <= 1'b1;
                    else Z_final <= 1'b0;
                end
                else begin
                    if (alu_out_mem == 16'd0) Z_final <= 1'b1;
                    else Z_final <= 1'b0;
                end
            end
            default: Z_final <= Z;
        endcase
    end
    
endmodule
