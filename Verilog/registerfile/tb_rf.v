`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:50:55 05/10/2020
// Design Name:   registerfile
// Module Name:   C:/Users/Tefa/Desktop/LAST_YEAR/registerfile/tb_rf.v
// Project Name:  registerfile
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: registerfile
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_rf;

	// Inputs
	reg [2:0] ADD1;
	reg [2:0] ADD2;
	reg [2:0] WADD;
	reg CLK;
	reg WEN;
	reg [15:0] DATAIN;

	// Outputs
	wire [15:0] R1;
	wire [15:0] R2;

	// Instantiate the Unit Under Test (UUT)
	registerfile uut (
		.ADD1(ADD1), 
		.ADD2(ADD2), 
		.WADD(WADD), 
		.CLK(CLK), 
		.WEN(WEN), 
		.R1(R1), 
		.R2(R2), 
		.DATAIN(DATAIN)
	);

	initial begin
		// Initialize Inputs
		ADD1 = 0;
		ADD2 = 0;
		WADD = 0;
		CLK = 0;
		WEN = 0;
		DATAIN = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		always 
		#20 CLK = ~CLK ;

	end
      
endmodule

