`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:55:44 05/28/2020 
// Design Name: 
// Module Name:    mux8_1 
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
module mux8_1(CHOICE0 , CHOICE1 , CHOICE2 , CHOICE3 , CHOICE4 , CHOICE5 , CHOICE6 , CHOICE7 , SEL , OUT
    );
	 
	 parameter DataPathSize = 2 ;// size of datapath will deal with 
	 parameter CH0 = 3'b000 ,
				  CH1 = 3'b001 ,
				  CH2 = 3'b010 ,
				  CH3 = 3'b011 ,
				  CH4 = 3'b100 ,
				  CH5 = 3'b101 ,
				  CH6 = 3'b110 ,
				  CH7 = 3'b111 ;
				  
	 // inputs 
	 
	 input [ DataPathSize - 1 : 0 ] CHOICE0 , CHOICE1 , CHOICE2 , CHOICE3 , CHOICE4 , CHOICE5 , CHOICE6 , CHOICE7;
	 input [ 2  : 0 ] SEL ; // the selction of mux
	 
	 // outputs
	 
	 output [ DataPathSize - 1 : 0 ] OUT ;
	 reg [ DataPathSize - 1 : 0 ] OUT ; 
	 
	 always @( CHOICE0 or CHOICE1 or CHOICE2 or CHOICE3  or CHOICE4 or CHOICE5  or CHOICE6 or CHOICE7 or SEL ) 
	 
		begin 
			case ( SEL ) // rtl_synthesis full_case
				CH0: begin 
							OUT = CHOICE0 ;
					  end
				CH1: begin 
							OUT = CHOICE1 ;
					  end
				CH2: begin 
							OUT = CHOICE2 ;
					  end
				CH3: begin 
							OUT = CHOICE3 ;
					  end
			   CH4: begin 
							OUT = CHOICE4 ;
					  end
			   CH5: begin 
							OUT = CHOICE5 ;
					  end
				CH6: begin 
							OUT = CHOICE6 ;
					  end
			   CH7: begin 
							OUT = CHOICE7 ;
					  end
			endcase
		end

endmodule
