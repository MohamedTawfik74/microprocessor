`timescale 1ns / 1ps

module Reg_file(Data_in, WREG, RREG1, RREG2, RW, Clk, R1, R2);

parameter Reg_width = 16;
parameter File_depth = 8;

input RW, Clk;
input [$clog2(File_depth)-1:0]WREG, RREG1, RREG2;
input [Reg_width-1:0]Data_in;
output [Reg_width-1:0]R1,R2;
reg [Reg_width-1:0]Reg_file [File_depth-1:0];

always @ (posedge Clk)
	if(RW)
		//write
		Reg_file[WREG] = Data_in;
	
assign R1 = Reg_file[RREG1];
assign R2 = Reg_file[RREG2];

integer i;
initial
	for ( i = 0 ; i < File_depth ; i = i + 1)
		Reg_file[i] = 0;


endmodule
