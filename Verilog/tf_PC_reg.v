`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:53:42 02/02/2020
// Design Name:   PC_reg
// Module Name:   D:/Testing Traaash/MP/PC_reg/tf_PC_reg.v
// Project Name:  PC_reg
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PC_reg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tf_PC_reg;

	// Inputs
	reg reset;
	reg Clk;
	reg Load;
	reg [15:0] in;

	// Outputs
	wire [15:0] PC_reg;

	// Instantiate the Unit Under Test (UUT)
	PC_reg uut (
		.reset(reset), 
		.Clk(Clk), 
		.PC_reg(PC_reg), 
		.Load(Load), 
		.in(in)
	);

	initial begin
		// Initialize Inputs
		reset = 0;
		Clk = 0;
		Load = 0;
		in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		in = 327;
		
		#50
		Load = 1;
		#10
		Load = 0;
		#100
		reset = 1;
		#10 
		reset = 0;
		
		

	end
	
	always #5 Clk = ~Clk;
      
endmodule

