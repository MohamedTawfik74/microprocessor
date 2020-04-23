`timescale 1ns / 1ps

module Control_Unit(OPcode, Control_Word );

input [3:0]OPcode;

//Control Word is as follows
//WRF	WRAM	BRCE	BRCNE	SPC2	SPC1	SRFD1	SRFD2	SRFD3	SRFW1	SRFW2	SALU	LOP	RPC	RRF	SALU1	SALU0	LPC
output [17:0]Control_Word;

// Order according to OPcode is
//ALU IN OUT JR ADDI ANDI ORI LW SW BEQ BNE J JAL UNDEF NOP HLT
//UNDEF is coded as NOP
reg [17:0]Control [15:0];

initial 
	$readmemb("Control_Words.txt", Control);

assign Control_Word = Control[OPcode];



endmodule
