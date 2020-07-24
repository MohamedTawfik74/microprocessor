`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:18:28 05/10/2020 
// Design Name: 
// Module Name:    mux_2_1 
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
module mux_2_1( CHOICE0 , CHOICE1 , SEL , OUT
    );
	 
	 parameter DataPathSize = 2 ;// size of datapath will deal with 
	 
	 // inputs 
	 
	 input [ DataPathSize - 1 : 0 ] CHOICE0 , CHOICE1  ;
	 input SEL ; // the selction of mux
	 
	 // outputs
	 
	 output [ DataPathSize - 1 : 0 ] OUT ;
	 reg [ DataPathSize - 1 : 0 ] OUT ; 
	 
	 always @( CHOICE0 or CHOICE1 or SEL ) 
	 
		begin 
			if ( SEL == 1 )
				begin 
					OUT = CHOICE1 ;
				end 
			else 
				begin 
					OUT = CHOICE0 ;
				end 
		end

endmodule
