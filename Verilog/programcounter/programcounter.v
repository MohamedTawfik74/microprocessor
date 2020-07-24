`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:41:05 05/10/2020 
// Design Name: 
// Module Name:    programcounter 
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
module programcounter( INDATA , OUTDATA , CLK , RESET , LOAD
    );
	 
	 parameter DataSize = 2 ;
	 
	 // inputs 
	 
	 input [ DataSize - 1 : 0 ] INDATA ; // input to the register
	 input CLK ; // clock source 
	 input RESET ; // asynchrouns reset 
	 input LOAD ; // synchroouns enable 
	 
	 
	 // outputs 
	 
	 output [ DataSize - 1 : 0 ] OUTDATA ;
	 reg [ DataSize - 1 : 0 ] OUTDATA ;
	 
	 initial // not a good behaviour but for simuLATION
		 begin 
			OUTDATA <= 0 ;
		 end
	 
	 always @( posedge CLK or posedge RESET )
	 
		begin 
			if ( RESET == 1 )
				begin 
					OUTDATA <= 0 ;
				end 
			else 
				begin 
					if (LOAD == 1) 
						begin
							OUTDATA <= INDATA ;
                  end
               else /* Do nothing */ ;						
				end
		end
	 
endmodule
