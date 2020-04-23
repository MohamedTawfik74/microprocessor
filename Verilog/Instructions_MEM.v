`timescale 1ns / 1ps

module Instructions_MEM(Address, out);

//Modify Inst_MEM.txt to automatically fill this Memory with data

parameter Inst_width = 16;
parameter Inst_MEM_depth = 65536;

input [$clog2(Inst_MEM_depth)-1:0]Address;
output [Inst_width-1:0]out;

reg [Inst_width-1:0]Insts [Inst_MEM_depth-1:0];

initial 
	$readmemb("Inst_MEM.txt", Insts, 0, 65535);

assign out = Insts[Address];


endmodule
