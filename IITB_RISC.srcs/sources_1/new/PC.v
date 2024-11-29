`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2024 06:23:52 PM
// Design Name: 
// Module Name: PC
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


module PC(clk, rst, branch_rr, special_wb, PC_Write, write_data_rr, branch_pc, PC_in, PC, PC_plus_2);
    input clk;
    input rst;
    input branch_rr;
    input special_wb;
    input PC_Write;
    input [15:0] write_data_rr;
    input [15:0] branch_pc;
    input [15:0] PC_in;
    output reg [15:0] PC;
    output reg [15:0] PC_plus_2;
    parameter BOOT_ADDRESS = 16'h0000;
    
    always @ (posedge clk) begin
        if (rst) begin
            PC <= BOOT_ADDRESS;
            PC_plus_2 <= BOOT_ADDRESS + 16'h2;
        end
        else begin
            if (PC_Write) begin
                if (!special_wb) begin
                    if (branch_rr) begin
                        PC <= branch_pc;
                        PC_plus_2 <= branch_pc + 16'h2;
                    end
                    else begin
                        PC <= PC_in + 16'h2;
                        PC_plus_2 <= PC_in + 16'h2;
                    end
                end
                else begin
                    PC <= write_data_rr;
                    PC_plus_2 <= write_data_rr + 16'h2;
                end
            end
            else begin
                PC <= PC;
                PC_plus_2 <= PC_plus_2;
            end
        end
    end

endmodule
