`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:05:41 05/28/2020 
// Design Name: 
// Module Name:    controlunit 
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
module controlunit( OPCODE , ControlSignals
    );
	 
	 parameter PCLOAD    = 0 ,
				  PCMUX1    = 1 ,
				  PCMUX2    = 2 ,
				  BRANCHE   = 3 ,
				  BRANCHNE  = 4 ,
				  REGWEN    = 5 ,
				  REGDMUX1  = 6 ,
				  REGDMUX2  = 7 ,
				  REGAMUX1  = 8 ,
				  REGAMUX2  = 9 ,
				  RAMWEN    = 10 ,
				  OUTWEN    = 11 ,
				  ALUOPB    = 12 ,
				  ALUMUX1   = 13 ,
				  ALUMUX2   = 14 ,
				  ALUMUX3   = 15 ;
				  
	parameter  SIZE     = 16 ;   // number of control signals 	

	parameter  ALU  = 4'b0000 ,  // instuctions' opcode 
				  ADDI = 4'b0100 ,
				  ANDI = 4'b0101 ,
				  ORI  = 4'b0110 ,
				  LW   = 4'b0111 ,
				  SW   = 4'b1000 ,
				  J    = 4'b1011 ,
				  JAL  = 4'b1100 ,
				  JR   = 4'b0011 ,
				  BEQ  = 4'b1001 ,
				  BNE  = 4'b1010 ,
				  IN   = 4'b0001 ,
				  OUT  = 4'b0010 ,
				  NOP  = 4'b1110 ,
				  HLT  = 4'b1111 ;
				  
	input [ 3 : 0 ] OPCODE ;
	output [ SIZE - 1 : 0 ] ControlSignals ;
	
	reg [ SIZE - 1 : 0 ] ControlSignals ;	  
				  
	always @( OPCODE ) 
		begin 
			case ( OPCODE ) 
				ALU : 
					ControlSignals = 16'b000_0_0_0_00_00_1_00_00_1 ; 
					
				ADDI : 
					ControlSignals = 16'b010_1_0_0_01_00_1_00_00_1 ;
					
				ANDI : 
					ControlSignals = 16'b011_1_0_0_01_00_1_00_00_1 ;
					
				ORI : 
					ControlSignals = 16'b100_1_0_0_01_00_1_00_00_1 ;
					
				LW  : 
					ControlSignals = 16'b010_0_0_0_01_01_1_00_00_1 ;
					
				SW : 
					ControlSignals = 16'b010_0_0_1_00_01_0_00_00_1 ;
					
				J  : 
					ControlSignals = 16'b000_0_0_0_00_00_0_00_10_1 ;
					
				JAL : 
					ControlSignals = 16'b000_0_0_0_10_11_1_00_10_1 ;
					
				JR : 
					ControlSignals = 16'b000_0_0_0_00_00_0_00_11_1 ;
					
				BEQ : 
					ControlSignals = 16'b001_1_0_0_00_01_0_01_01_1 ;
					
				BNE : 
					ControlSignals = 16'b001_1_0_0_00_01_0_10_01_1 ;
					
				IN : 
					ControlSignals = 16'b000_0_0_0_00_10_1_00_00_1 ;
					
				OUT : 
					ControlSignals = 16'b000_0_1_0_00_00_0_00_00_1 ;
					
				HLT : 
					ControlSignals = 16'b000_0_0_0_00_00_0_00_00_0 ;
					
				NOP : 
					ControlSignals = 16'b000_0_0_0_00_00_0_00_00_1 ;
					
				default :  
					ControlSignals = 16'b000_0_0_0_00_00_0_00_00_1 ;
					
			endcase
		end

endmodule
