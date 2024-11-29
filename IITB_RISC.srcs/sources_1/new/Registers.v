`timescale 1ns / 1ps

module Registers(clk, rst, PC_in, RA_in, RB_in, RD, write_data, write_data_wb, RegWrite, ra, rb, write_data_rr, R0, R1, R2, R3, R4, R5, R6, R7);
    input clk, rst;
    input [15:0] PC_in;
    input [2:0] RA_in, RB_in, RD;
    input [15:0] write_data, write_data_wb;
    input RegWrite;
    output [15:0] ra, rb;
    output [15:0] write_data_rr;
    output [15:0] R0, R1, R2, R3, R4, R5, R6, R7;
    reg [15:0] Register [7:0];//PC(value taken directly from Program counter output) + 7 registers
    integer i = 0;
    integer j = 0;
    
    assign write_data_rr = write_data_wb;
//    assign ra = (RA_in == 3'b000)? PC_in: Register[RA_in-1];
//    assign rb = (RB_in == 3'b000)? PC_in: Register[RB_in-1];
    assign ra = Register[RA_in];
    assign rb = Register[RB_in];
//    wire [2:0] RA_reg, RB_reg;
    always @ (posedge clk) begin
        if(rst) begin
            for (i = 0; i < 7; i = i + 1) begin
                Register[i] <= 16'b0;
            end
        end
//        else if (RegWrite & (RD != 3'b000)) begin
//            Register[RD-1] <= write_data;
//        end
        else if (RegWrite) begin
            Register[RD] <= write_data;
        end
        else begin
            for (j = 0; j < 7; j = j + 1) begin
                Register[j] <= Register[j];
            end
        end
    end
//    assign R0 = PC_in;
//    assign R1 = Register[0];
//    assign R2 = Register[1];
//    assign R3 = Register[2];
//    assign R4 = Register[3];
//    assign R5 = Register[4];
//    assign R6 = Register[5];
//    assign R7 = Register[6];

    assign R0 = Register[0];
    assign R1 = Register[1];
    assign R2 = Register[2];
    assign R3 = Register[3];
    assign R4 = Register[4];
    assign R5 = Register[5];
    assign R6 = Register[6];
    assign R7 = Register[7];
    
//    assign RA_reg = RA;
//    assign RB_reg = RB;
    
    
endmodule