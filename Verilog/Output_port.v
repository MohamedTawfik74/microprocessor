`timescale 1ns / 1ps


module Output_port(in, out, LOP, Clk);

//Implemented as Latch
parameter Data_width = 16;

input [Data_width-1:0]in;
input LOP,Clk;
output [Data_width-1:0]out;
reg [Data_width-1:0]out;

always @ (posedge Clk)
if (LOP)
	out = in;

endmodule
