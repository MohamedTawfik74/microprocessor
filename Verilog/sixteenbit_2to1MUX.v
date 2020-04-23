`timescale 1ns / 1ps

module sixteenbit_2to1MUX(in1,in2, sel, out);

input [15:0]in1,in2;
input sel;
output [15:0]out;

assign out = sel? in2 : in1;

endmodule

