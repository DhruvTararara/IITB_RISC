`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2024 02:31:05 AM
// Design Name: 
// Module Name: Write_Data_Select
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


module Write_Data_Select(ra, rb, S, write_data);
    input [15:0] ra, rb;
    input S;
    output [15:0] write_data;
    
    assign write_data = (S)? rb: ra;
    
endmodule
