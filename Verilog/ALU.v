`timescale 1ns / 1ps

module ALU(Operand1, Operand2, FUNC, Result, ZF);
//FUNC parameters
parameter   ADD = 3'b000,// 0
				SUB = 3'b001,// 1
				AND = 3'b010,// 2
				OR  = 3'b011,// 3
				NOT = 3'b100,// 4
				XOR = 3'b101,// 5
				SLL = 3'b110,// 6
				SRL = 3'b111;// 7
				
//Ports Declaration 
input [15:0]Operand1,Operand2;
input [2:0]FUNC;
output [15:0]Result;
output ZF;
reg [15:0]Result;
reg ZF;

//ALU functionality
always @ (Operand1 or Operand2 or FUNC)
	begin
	case (FUNC)
		
		ADD : Result = Operand1 + Operand2;
		SUB : Result = Operand1 - Operand2;
		AND : Result = Operand1 & Operand2;
		OR  : Result = Operand1 | Operand2;
		NOT : Result =~Operand1;
		XOR : Result = Operand1 ^ Operand2;
		SLL : Result = Operand1 << 1;
		SRL : Result = Operand1 >> 1;
	endcase
	
	if (Result)
		ZF = 0;
	else
		ZF = 1;
	end

endmodule
