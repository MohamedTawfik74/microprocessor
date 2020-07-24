`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:46:33 06/05/2020 
// Design Name: 
// Module Name:    Microprocessor 
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
			
module Microprocessor( INPUT , OUTPUT , ClK , RESET
    );
	 
	 parameter InputPortSize  = 4 , // define input port size 
			 OutputPortSize = 16 , // define output port size 
			 BusWidth = 16 ;
	 
	 // inputs 
	 input [ InputPortSize - 1 : 0 ] INPUT ; // define input port 
	 input ClK ; // the clock of the design  
	 input RESET ; // a software asynchrouns reset ( default state is One ) 
	 
	 // outputs
	 output [ OutputPortSize -1 : 0 ] OUTPUT ; // define output port
	 
	 
	 // internal nets and wires
	 
	 wire M_RESET , ZeroFlag ;
	 
	 wire [ 15  : 0 ] Control , INPUTD ;
	 
	 wire [ BusWidth - 1 : 0 ] PCOUT , PCINC , PCJUMP , PCIN , PCOFFSET , PCOFFSETM ;
	 
	 wire [ BusWidth - 1 : 0 ] INS , OFFSET ;
	 
	 wire [ 2 : 0 ] WADD , ALUFUNC ;
	 
	 wire [ BusWidth - 1 : 0 ] RFDATA , R1 , R2 ;
	 
	 wire [ BusWidth - 1 : 0 ] ALUB , ALURESULT ;
	 
	 wire [ BusWidth - 1 : 0 ] RAMOUT ;
	 
	 wire BRANCH ;
	 
	 
	 // instances
	 
	  controlunit CU ( .OPCODE(INS[15:12]) , .ControlSignals(Control)
    );
	 
	  mux_2_1#(16) BRANCHMUX ( .CHOICE0(PCINC) , .CHOICE1(PCOFFSET) , /* very bad design this the insertion of mux */  
	          .SEL(BRANCH) , .OUT(PCOFFSETM)
    );
	 
	 mux_4_1#(16) PCMUX ( .CHOICE0(PCINC) , .CHOICE1(PCOFFSETM) , .CHOICE2(PCJUMP) , 
	                 .CHOICE3(R1) , .SEL(Control[2:1]) , 
						  .OUT(PCIN) 
    );
	 
	 programcounter#(16) PC ( .INDATA(PCIN) , .OUTDATA(PCOUT) , 
	                 .CLK(ClK) , .RESET(M_RESET) , .LOAD(Control[CU.PCLOAD])
    );
	 
	 insmem#(16,16) ROM ( .ADD(PCOUT) , .DATAOUT(INS) 
    );
	 
	 mux_4_1#(3) WREGMUX ( .CHOICE0(INS[5:3]) , .CHOICE1(INS[8:6]) , .CHOICE2(3'b111) , 
	          .CHOICE3(INS[5:3]) , .SEL(Control[9:8]) , .OUT(WADD)
    );
	 
	 signextension#(6,16) SIGNEXTENSION ( .INPUT(INS[5:0]) , .OUTPUT(OFFSET) 
    );
	 
	 registerfile RF ( .ADD1(INS[11:9]) , .ADD2(INS[8:6]) , .WADD(WADD) , 
	               .CLK(ClK) , .WEN(Control[CU.REGWEN]) , 
						.R1(R1) , .R2(R2) , .DATAIN(RFDATA) , .RESET(M_RESET)
    );
	 
	 mux_4_1#(16) DATAINMUX ( .CHOICE0(ALURESULT) , .CHOICE1(RAMOUT) , .CHOICE2(INPUTD) , 
	                          .CHOICE3(PCINC) , .SEL(Control[7:6]) , .OUT(RFDATA)
    );
	 
	 mux_2_1#(16) ALUBOPERAND ( .CHOICE0(R2) , .CHOICE1(OFFSET) , 
	          .SEL(Control[CU.ALUOPB]) , .OUT(ALUB)
    );
	 
	 mux8_1#(3) ALUCU ( .CHOICE0(INS[2:0]) , .CHOICE1(3'b001) , .CHOICE2(3'b000) , 
	                    .CHOICE3(3'b010) , .CHOICE4(3'b011) , .CHOICE5(3'b000) , 
							  .CHOICE6(3'b000) , .CHOICE7(3'b000) , .SEL(Control[15:13]) , 
							  .OUT(ALUFUNC)
    );
	 
	 alu#(16) ALU ( .OPERAND1(R1) , .OPERAND2(ALUB) , 
	               .FUNC(ALUFUNC) , .ZF(ZeroFlag) , .RESULT(ALURESULT)  
    );
	 
	/* datamem#(7,16) RAM ( .ADD(R1[6:0]) , .DATAIN(R2) , .DATAOUT(RAMOUT) , 
								 .CLK(ClK) , .WEN(Control[CU.RAMWEN]) 
	 ); */ 
	 
	RamMips RAM (
  .clka(ClK), // input clka
  .wea(Control[CU.RAMWEN]), // input [0 : 0] wea
  .addra(R1[6:0]), // input [6 : 0] addra
  .dina(R2), // input [15 : 0] dina
  .douta(RAMOUT) // output [15 : 0] douta
);
	 
	 output_port#(16) OUTPUTPORT ( .DATA(R1) , .OUT(OUTPUT) , 
	                               .Load(Control[CU.OUTWEN]) , .CLK(ClK)
    );
	 
	 input_port#(4,16) instance_name (
    .INPUT(INPUT), 
    .INPUTD(INPUTD)
    );
	 
	 // top level functionality 
	 
	 assign PCINC = PCOUT + 1 ;
	 assign PCJUMP = PCOUT[15:12] + INS[11:0] ;
	 assign M_RESET = ~RESET ;
	 assign PCOFFSET = OFFSET + PCOUT + 1 ;
	 assign BRANCH = (Control[CU.BRANCHE] && (!ZeroFlag)) || (Control[CU.BRANCHNE] && (ZeroFlag)) ; 

endmodule
