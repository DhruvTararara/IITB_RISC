`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2024 11:59:54 AM
// Design Name: 
// Module Name: testbench
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


module testbench();
    reg clk;
    reg rst;
    wire [15:0] PC, R0, R1, R2, R3, R4, R5, R6, R7;
    wire C, Z;
    wire [15:0] Load_data, Store_data, Store_address;
    wire [2:0] Load_address;
    
    IITB_RISC_wrapper processor(Load_address, Load_data, PC, R0, R1, R2, R3, R4, R5, R6, R7, Store_address, Store_data, C, clk, rst, Z);
    
    initial begin
        clk = 1'b0;
        forever #10 clk = ~clk; 
    end
    initial begin
        rst = 1'b0;
        #11 rst = 1'b1;
        #20 rst = 1'b0;
    end
    initial begin
        $readmemh("C:/Xilinx/IITB_RISC/memory.txt", processor.IITB_RISC_i.Instruction_Memory_0.inst.mem);
        $readmemh("C:/Xilinx/IITB_RISC/memory.txt", processor.IITB_RISC_i.Data_memory_0.inst.mem);
    end
endmodule
