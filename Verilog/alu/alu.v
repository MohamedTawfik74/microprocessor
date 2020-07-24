`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:32:01 05/10/2020 
// Design Name: 
// Module Name:    alu 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

`define SizeOfFunc 3

module alu( OPERAND1 , OPERAND2 , FUNC , ZF , RESULT  
    );
	 
	 parameter OperandSize =  2 ; // size of operands 
	 
	 parameter ADD = 3'b000 , // add function code 
				  SUB = 3'b001 , // sub function code 
				  AND = 3'b010 , // and function code 
				  OR  = 3'b011 , // or  function code 
				  NOR = 3'b100 , // nor function code 
				  XOR = 3'b101 , // xor function code 
				  SLL = 3'b110 , // shift left function code 
				  SRL = 3'b111 ; // shift right function code 
	 
	 // inputs 
	 
	 input [ OperandSize - 1 : 0 ] OPERAND1 , OPERAND2 ; // the operands
	 input [ `SizeOfFunc - 1 : 0 ] FUNC ;  // the required function 
	 
	 // outputs
	 
	 output ZF ;  // zero flag 
	 output [ OperandSize - 1 : 0 ] RESULT ; // the result of the operation
	 
	 reg [ OperandSize - 1 : 0 ] RESULT ; // redefine the result of the operation as register
	 
	 
	 always @( OPERAND1 or OPERAND2 or FUNC )
		begin : EXCUTE_FUNC
			case ( FUNC ) 
				ADD : begin : ADD_OPERATION  
							RESULT = OPERAND1 + OPERAND2 ;
						end
				SUB : begin : SUN_OPERATION  
							RESULT = OPERAND1 - OPERAND2 ;
						end
				AND : begin : AND_OPERATION  
							RESULT = OPERAND1 & OPERAND2 ;
						end
				OR  : begin : OR_OPERATION  
							RESULT = OPERAND1 | OPERAND2 ;
						end
				NOR : begin : NOR_OPERATION  
							RESULT = ~(OPERAND1 | OPERAND2) ;
						end
				XOR : begin : XOR_OPERATION  
							RESULT = OPERAND1 ^ OPERAND2 ;
						end
				SLL : begin : SLL_OPERATION  
							RESULT = ( OPERAND1 << 1 ) ;
						end
				SRL : begin : SRL_OPERATION  
							RESULT = ( OPERAND1 >> 1 ) ;
						end
			endcase
		end
		
		assign ZF = RESULT? 1'b0 : 1'b1 ; // assign the zero flag  

endmodule
