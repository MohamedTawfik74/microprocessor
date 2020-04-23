`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:57:37 02/03/2020
// Design Name:   MP
// Module Name:   D:/Testing Traaash/MP/Microprocessor/tf_MP.v
// Project Name:  Microprocessor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MP
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tf_MP;

	// Inputs
	reg [15:0] Design_IN;
	reg Clk;

	// Outputs
	wire [15:0] Design_OUT;

	// Instantiate the Unit Under Test (UUT)
	MP uut (
		.Design_IN(Design_IN), 
		.Clk(Clk), 
		.Design_OUT(Design_OUT)
	);

	initial begin
		// Initialize Inputs
		Design_IN = 0;
		Clk = 0;
		uut.Reg_file.Reg_file[0] = 0;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

