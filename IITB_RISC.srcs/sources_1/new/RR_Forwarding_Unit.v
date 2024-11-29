`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/12/2024 01:51:54 PM
// Design Name: 
// Module Name: RR_Forwarding_Unit
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


module RR_Forwarding_Unit(RA_in, RB_in, RD, RegWrite, invalid1_wb, write_data, ra, rb, ra_final, rb_final);
    input [2:0] RA_in, RB_in, RD;
    input RegWrite, invalid1_wb;
    input [15:0] write_data, ra, rb;
    output reg [15:0] ra_final, rb_final;
    
    always @ (*) begin
        if (!invalid1_wb) begin
            if ((RD == RA_in) && (RegWrite)) ra_final <= write_data;
            else ra_final <= ra;
        end
        else ra_final <= ra;
    end
    always @ (*) begin
        if (!invalid1_wb) begin
            if ((RD == RB_in) && (RegWrite)) rb_final <= write_data;
            else rb_final <= rb;
        end
        else rb_final <= rb;
    end
    
endmodule
