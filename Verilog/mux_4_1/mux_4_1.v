`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:32:06 05/10/2020 
// Design Name: 
// Module Name:    mux_4_1 
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
module mux_4_1( CHOICE0 , CHOICE1 , CHOICE2 , CHOICE3 , SEL , OUT
    );
	 
	 parameter DataPathSize = 3 ;// size of datapath will deal with 
	 parameter CH0 = 2'b00 ,
				  CH1 = 2'b01 ,
				  CH2 = 2'b10 ,
				  CH3 = 2'b11 ;
				  
	 // inputs 
	 
	 input [ DataPathSize - 1 : 0 ] CHOICE0 , CHOICE1 , CHOICE2 , CHOICE3 ;
	 input [ 1  : 0 ] SEL ; // the selction of mux
	 
	 // outputs
	 
	 output [ DataPathSize - 1 : 0 ] OUT ;
	 reg [ DataPathSize - 1 : 0 ] OUT ; 
	 
	 always @( CHOICE0 or CHOICE1 or CHOICE2 or CHOICE3 or SEL ) 
	 
		begin 
			case ( SEL ) 
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
			endcase
		end

endmodule

