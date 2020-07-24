`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:37:04 05/10/2020 
// Design Name: 
// Module Name:    input_port 
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

// input ports is designed as a tri-state buffers always

module input_port( INPUT , INPUTD
    );
	 
	 parameter InSize = 2 ,
				  DataSize = 4 ;
	 
	 input [ InSize - 1 : 0 ] INPUT ;
	 
	 output [ DataSize - 1 : 0 ] INPUTD ;	 
	 
	 reg [ DataSize - 1 : 0 ] INPUTD ;
	 
	 
	 initial 
		INPUTD = 0 ;
		
		always @(INPUT) 
			INPUTD = INPUT ;
		
endmodule
