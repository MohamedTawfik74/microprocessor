`timescale 1ns / 1ps


module Sign_extend(in, out);

parameter input_width = 6;
parameter output_width = 16;

input [input_width-1:0]in;
output [output_width-1:0]out;

//copies the MSB of the input to fill the diffrence between input and output widths
assign out = { {output_width-input_width{in[input_width-1]}},in};

endmodule
