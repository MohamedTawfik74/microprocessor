`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:08:20 05/10/2020 
// Design Name: 
// Module Name:    datamem 
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
module datamem( ADD , DATAIN , DATAOUT , CLK , WEN
    ); 
	 
	 parameter AddWidth  = 2 , // the width of address path 
				  DataWidth = 2 ; // the width of data path
				  
	 // inputs 
	 
	 input [ DataWidth - 1 : 0 ]  DATAIN ; // input data
	 input [ AddWidth  - 1 : 0 ]  ADD ; // input address
	 input CLK ; // clock source
	 input WEN ; // synchrouns write enable
	 
	 // outputs 

	 output [ DataWidth - 1 : 0 ] DATAOUT ; // output data 
	 
	 // memory 
	 
	 reg [ DataWidth - 1 : 0 ] MEM [ 0 : ( 1 << AddWidth ) - 1 ] ; // memory structure
	 
	 always @( posedge CLK ) 
		begin : WRITE_PROCESS
			if (WEN == 1) // if write is enabled 
				begin 
					MEM [ ADD ] <= DATAIN ; // write data into memory
				end 
			else /* do nothing just to avoid latch inference */ ;
		end
		
		assign DATAOUT = MEM [ ADD ] ; // output data is always exists
			
endmodule
