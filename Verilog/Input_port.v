`timescale 1ns / 1ps

module Input_port(in, out);

parameter Data_width = 16;

input [Data_width-1:0]in;
output [Data_width-1:0]out;

assign out = in;

endmodule
