`timescale 1ns / 1ps

module RAM(Address, Data_in, Data_out, DW, Clk);

parameter Data_width = 16;
parameter RAM_depth = 256;

input DW,Clk;
input [Data_width-1:0]Data_in;
input [$clog2(RAM_depth)-1:0]Address;
output [Data_width-1:0]Data_out;

reg [Data_width-1:0]RAM [RAM_depth-1:0];

always @ (posedge Clk)
	if (DW)
		//write
		RAM[Address] <= Data_in;
		
//output is always visable		
assign Data_out = RAM[Address];

endmodule
