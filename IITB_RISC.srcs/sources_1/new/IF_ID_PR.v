`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2024 02:23:50 PM
// Design Name: 
// Module Name: IF_ID_PR
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


module IF_ID_PR(clk, rst, IF_ID_write, IF_FLUSH, PC_in, PC_plus_2_in, 
                instr_in, PC_out, PC_plus_2_out, instr_out, invalid1);
    input clk;
    input rst;
//    input L, S;//For LM and SM
    input IF_ID_write, IF_FLUSH;
    input [15:0] PC_in, PC_plus_2_in, instr_in;
    output reg [15:0] PC_out, PC_plus_2_out, instr_out;
    output reg invalid1;
    //wire IF_ID_write;
    
//    always @ (posedge clk) begin
//        if (IF_FLUSH || rst) begin
//            PC_out <= 16'b0;
//            PC_plus_2_out <= 16'b0;
//            instr_out <= 16'b0;
//        end
//        else begin
//            if (!IF_ID_write) begin
//                PC_out <= PC_out;
//                PC_plus_2_out <= PC_plus_2_out;
//                instr_out <= instr_out;
//            end
//            else begin
//                PC_out <= PC_in;
//                PC_plus_2_out <= PC_plus_2_in;
//                instr_out <= instr_in;
//            end
//       end
//    end
    
    //assign IF_ID_write = (rst)? 1'b0: 1'b1;//Changes needed for LM and SM instructions
    //assign IF_FLUSH = (branch)? 1'b1: 1'b0;//In hazard unit

    always @ (posedge clk) begin
        if (rst) begin
            // Reset behavior
            PC_out <= 16'b0;
            PC_plus_2_out <= 16'b0;
            instr_out <= 16'hb000;
            invalid1 <= 1'b0;
        end
        else if (IF_ID_write) begin
            if (IF_FLUSH) begin
                // Flush behavior
                PC_out <= 16'b0;
                PC_plus_2_out <= 16'b0;
                instr_out <= 16'hb000;
                invalid1 <= 1'b1;
            end
            else begin
                // Normal write behavior
                PC_out <= PC_in;
                PC_plus_2_out <= PC_plus_2_in;
                instr_out <= instr_in;
                invalid1 <= 1'b0;
            end
        end
        // If IF_ID_write is low, maintain current values (implicit in Verilog)
    end

endmodule
