`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2024 10:37:25 PM
// Design Name: 
// Module Name: ID_RR_PR
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ID_RR_PR(clk, rst, ID_FLUSH, ID_RR_write, PC_in, PC_plus_2_in, op_in, RA_in, RB_in, RC_in, comp_in, invalid1_in, cz_in, Imm2_in, SE_Imm1_in, SE_Imm2_in, 
                PC_out, PC_plus_2_out, op_out, RA_out, RB_out, RC_out, comp_out, invalid1_out, cz_out, Imm2_out, SE_Imm1_out, SE_Imm2_out);
    input clk, rst, ID_FLUSH, ID_RR_write;
    input [15:0] PC_in, PC_plus_2_in;
    input [3:0] op_in;
    input [2:0] RA_in, RB_in, RC_in;
    input comp_in, invalid1_in;
    input [1:0] cz_in;
    input [8:0] Imm2_in;
    input [15:0] SE_Imm1_in, SE_Imm2_in;
    output reg [15:0] PC_out, PC_plus_2_out;
    output reg [3:0] op_out;
    output reg [2:0] RA_out, RB_out, RC_out;
    output reg comp_out, invalid1_out;
    output reg [1:0] cz_out;
    output reg [8:0] Imm2_out;
    output reg [15:0] SE_Imm1_out, SE_Imm2_out;
    
//    always @ (posedge clk) begin
//        if (ID_FLUSH || rst) begin
//            PC_out <= 16'b0;
//            PC_plus_2_out <= 16'b0;
//            op_out <= 4'b0;
//            RA_out <= 3'b0;
//            RB_out <= 3'b0;
//            RC_out <= 3'b0;
//            comp_out <= 1'b0;
//            cz_out <= 2'b0;
//            Imm2_out <= 9'b0;
//            SE_Imm1_out <= 16'b0;
//            SE_Imm2_out <= 16'b0;
//        end
//        else begin
//            if (!ID_RR_write) begin
//                PC_out <= PC_out;
//                PC_plus_2_out <= PC_plus_2_out;
//                op_out <= op_out;
//                RA_out <= RA_out;
//                RB_out <= RB_out;
//                RC_out <= RC_out;
//                comp_out <= comp_out;
//                cz_out <= cz_out;
//                Imm2_out <= Imm2_out;
//                SE_Imm1_out <= SE_Imm1_out;
//                SE_Imm2_out <= SE_Imm2_out;
//            end
//            else begin
//                PC_out <= PC_in;
//                PC_plus_2_out <= PC_plus_2_in;
//                op_out <= op_in;
//                RA_out <= RA_in;
//                RB_out <= RB_in;
//                RC_out <= RC_in;
//                comp_out <= comp_in;
//                cz_out <= cz_in;
//                Imm2_out <= Imm2_in;
//                SE_Imm1_out <= SE_Imm1_in;
//                SE_Imm2_out <= SE_Imm2_in;
//            end
//       end
//    end
    
//    assign IF_ID_write = (rst)? 1'b0: 1'b1;//Changes needed for LM and SM instructions
//    assign ID_FLUSH = (branch)? 1'b1: 1'b0;


    always @ (posedge clk) begin
            if (rst) begin
                // Reset behavior
                PC_out <= 16'b0;
                PC_plus_2_out <= 16'b0;
                op_out <= 4'b1011;
                RA_out <= 3'b0;
                RB_out <= 3'b0;
                RC_out <= 3'b0;
                comp_out <= 1'b0;
                cz_out <= 2'b0;
                Imm2_out <= 9'b0;
                SE_Imm1_out <= 16'b0;
                SE_Imm2_out <= 16'b0;
                invalid1_out <= 1'b0;
            end
            else if (ID_RR_write) begin
                if (ID_FLUSH) begin
                    // Flush behavior
                    PC_out <= 16'b0;
                    PC_plus_2_out <= 16'b0;
                    op_out <= 4'b1011;
                    RA_out <= 3'b0;
                    RB_out <= 3'b0;
                    RC_out <= 3'b0;
                    comp_out <= 1'b0;
                    cz_out <= 2'b0;
                    Imm2_out <= 9'b0;
                    SE_Imm1_out <= 16'b0;
                    SE_Imm2_out <= 16'b0;
                    invalid1_out <= 1'b1;
                end
                else begin
                    // Normal write behavior
                    PC_out <= PC_in;
                    PC_plus_2_out <= PC_plus_2_in;
                    op_out <= op_in;
                    RA_out <= RA_in;
                    RB_out <= RB_in;
                    RC_out <= RC_in;
                    comp_out <= comp_in;
                    cz_out <= cz_in;
                    Imm2_out <= Imm2_in;
                    SE_Imm1_out <= SE_Imm1_in;
                    SE_Imm2_out <= SE_Imm2_in;
                    invalid1_out <= invalid1_in;
                end
            end
            // If ID_RR_write is low, maintain current values (implicit in Verilog)
        end
    
endmodule
