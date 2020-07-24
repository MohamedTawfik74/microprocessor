`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:04:08 05/10/2020 
// Design Name: 
// Module Name:    registerfile 
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

module registerfile( ADD1 , ADD2 , WADD , CLK , WEN , R1 , R2 , DATAIN , RESET
    );
	 
	 parameter DataWidth = 16 ,
				  AddWidth  = 3 ;
				  
	 // inputs 
	 
	 input [ AddWidth - 1 : 0 ] ADD1 , ADD2 , WADD ; // addresses
	 input [ DataWidth - 1 : 0 ] DATAIN ;
	 input CLK ; 
	 input WEN ;  // write enable 
	 input RESET ;
	 integer i ;
	 
	 // outputs 
	 
	 output [ DataWidth - 1 : 0 ] R1 , R2 ;
	 
	 // memory 
	 
	 reg [ DataWidth - 1 : 0 ] MEM [ 0 : ( 1 << AddWidth) - 1 ] ;
	 
	 initial // not a good behaviour but for simulation only 
		begin 
			for ( i = 0 ; i < ( 1 << AddWidth) ; i = i + 1 )
				MEM[i]  <= 0 ;
		end
	 
	 always @( posedge CLK or posedge RESET ) 
		begin 
		if ( RESET == 1 ) 
			begin 
				for ( i = 0 ; i < ( 1 << AddWidth) ; i = i + 1 )
				MEM[i]  <= 0 ;
			end
		else
			begin
				if ( WEN == 1 )
					begin 
						MEM [ WADD ] <= DATAIN ;
					end
				else /* Do nothing just to avoid inference latch */ ;
			end
		end 
		
		assign R1 = MEM [ ADD1 ] ,
			    R2 = MEM [ ADD2 ] ;
		
	 

endmodule
