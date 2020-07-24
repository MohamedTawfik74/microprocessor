`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:53:48 05/10/2020 
// Design Name: 
// Module Name:    output_port 
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
module output_port( DATA , OUT , Load , CLK
    );
	 
	 parameter OutSize = 2 ; // the size of register 
	 
	 // inputs 
	 input [ OutSize - 1 : 0] DATA ; // the input data to register  
	 input Load ; // syncrouns enable to load data into register 
	 input CLK ;  // the clock of the design 
	 
	 // outputs 
	 output [ OutSize - 1 : 0 ] OUT ; // the ouput data 
	 
	 reg [ OutSize - 1 : 0 ] OUT ; // re-define the output port
	 
	 
	 always @( posedge CLK ) 
		begin //: REGISTER
	 
			if ( Load == 1) 
				begin //: ASSIN_DATA
					OUT <= DATA ;  // load the new data 
				end 
			else ;/* do nothing */ 
		end

endmodule
