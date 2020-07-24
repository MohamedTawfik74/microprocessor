`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:48:15 05/10/2020 
// Design Name: 
// Module Name:    insmem 
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
module insmem( ADD , DATAOUT 
    );
	 
	 parameter AddressWidth = 2 , // address path width
				  DataWidth = 2 ; // data path width
	 
	 // inputs
	 
	 input [ AddressWidth - 1 : 0 ] ADD ; // address path 
	 
	 // outputs 
	 
	 output [ DataWidth - 1 : 0 ] DATAOUT ; // output data 
	 
	 // memory 
	 
	 reg [ DataWidth - 1 : 0 ] MEM [ 0 : (1<<AddressWidth) - 1 ] ; // address width
	 
	 initial 
		begin : STORE_INS_PROCESS
			$readmemb( "CodeTest.txt" , MEM ) ;
		end			
			
	 assign DATAOUT = MEM [ ADD ] ; // Read instruction 
	 
endmodule
