`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:26:45 05/26/2020 
// Design Name: 
// Module Name:    signextension 
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
module signextension( INPUT , OUTPUT 
    );
	 
	 parameter INPUTSize  = 1 ,
				  OUTPUTSize = 2 ;
	 
	 input [ INPUTSize - 1 : 0 ] INPUT ;
	 output [ OUTPUTSize - 1 : 0 ] OUTPUT ;
	 
	 assign OUTPUT = { { (OUTPUTSize - INPUTSize) { INPUT[INPUTSize-1] }} , INPUT } ;

endmodule
