`timescale 1ns / 1ps

module threebit_4to1MUX(in1,in2,in3,in4, sel, out);

input [2:0]in1,in2,in3,in4;
input [1:0]sel;
output [2:0]out;
reg [2:0]out;

always @ (in1 or in2 or in3 or in4 or sel)
case (sel)
	2'b00: out <= in1;
	2'b01: out <= in2;
	2'b10: out <= in3;
	2'b11: out <= in4;
endcase

endmodule 