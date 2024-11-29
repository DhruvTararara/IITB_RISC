`timescale 1ns / 1ps

module Register_File(clk, rst, PC_in, RA, RB, RD, write_data, write_data_wb, RegWrite, ra, rb, write_data_rr);
    input clk, rst;
    input PC_in;
    input [2:0] RA, RB, RD;
    input [15:0] write_data, write_data_wb;
    input RegWrite;
    output [15:0] ra, rb;
    output [15:0] write_data_rr;
    reg [15:0] Register [6:0];//PC(value taken directly from Program counter output) + 7 registers
    integer i = 0;
    integer j = 0;
    
    always @ (posedge clk) begin
        if(rst) begin
            for (i = 0; i < 7; i = i + 1) begin
                Register[i] <= 16'b0;
            end
        end
        else if (RegWrite & (RD != 3'b000)) begin
            Register[RD-1] <= write_data;
        end
        else begin
            for (j = 0; j < 7; j = j + 1) begin
                Register[j] <= Register[j];
            end
        end
    end
    
    assign write_data_rr = write_data_wb;
    assign ra = (RA == 3'b000)? PC_in: Register[RA-1];
    assign rb = (RB == 3'b000)? PC_in: Register[RB-1];
    
endmodule