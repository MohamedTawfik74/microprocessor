`timescale 1ns / 1ps

module PC_reg(reset,Clk,PC_reg,Load,in);

//This has A-Sync Load and Reset

parameter width = 16;

input reset,Clk,Load;
input [width-1:0]in;
output [width-1:0]PC_reg;
reg [width-1:0]PC_reg;

initial 
PC_reg <= 0;

always @(posedge reset or posedge Clk)
	begin
	if (reset)
		PC_reg <= 0 ;
	else if (~Load)
		PC_reg <= in;
	end


endmodule
