`timescale 1ns / 1ps

module ntooneMUX(in, sel, out);
parameter n = 4;
parameter data_width = 1;

input [data_width*(n-1):0]in;
input [$clog2(n)-1:0]sel;
output [data_width-1:0]out;

assign out = in[sel*data_width+data_width:sel*data_width];

endmodule
