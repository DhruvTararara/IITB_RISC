`timescale 1ns / 1ps

module Comparator(ra, rb, ET, LT);
    input [15:0] ra, rb;
    output ET, LT;
    
    assign ET = (ra == rb)? 1'b1: 1'b0;
    assign LT = (ra < rb)? 1'b1: 1'b0;
    
endmodule