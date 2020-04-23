`timescale 1ns / 1ps

module Adder(in, out);

parameter Added_value = 1;
parameter Data_width = 16;

input [Data_width-1:0]in;
output [Data_width-1:0]out;

assign out = in + Added_value;

endmodule
