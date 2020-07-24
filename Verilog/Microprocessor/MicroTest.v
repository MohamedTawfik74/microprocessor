`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:46:11 06/05/2020
// Design Name:   Microprocessor
// Module Name:   C:/Users/Tefa/Desktop/LAST_YEAR/Microprocessor/MicroTest.v
// Project Name:  Microprocessor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Microprocessor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////


module MicroTest;
	// Inputs
	reg [3:0] INPUT;
	reg ClK;
	reg RESET;
	
	reg [ 15 : 0 ] Expected [ 0 : 31 ] ;
	integer i ;

	// Outputs
	wire [15:0] OUTPUT;

	// Instantiate the Unit Under Test (UUT)
	Microprocessor uut (
		.INPUT(INPUT), 
		.OUTPUT(OUTPUT), 
		.ClK(ClK), 
		.RESET(RESET)
	);

	initial begin
		// Initialize Inputs
		INPUT = 4'b1111;
		ClK = 0;
		RESET = 1;
		i =0 ;
		
		//$display ( "Time  PC Address  Instruction  Control ") ;

		// Wait 100 ns for global reset to finish
		#100;	
        
		// Add stimulus here
		// no inputs for the moment 
	end
	
	initial 
		$readmemb ( "expected.txt" , Expected ) ; 
	
	always // generate clock 
		#20 ClK = ~ClK ;
	
	
	always @(OUTPUT) 
	 begin 
		if ( OUTPUT === Expected[i] )
			begin 
				$display ( " Output Matched " ) ;
			end
		else 
			begin 
				$display ( " Output is wrong " , $realtime  ) ;
			end 
			i = i + 1 ;
	end
	 
      
endmodule

