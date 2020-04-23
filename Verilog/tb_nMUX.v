`timescale 1ns / 1ps


module tb_nMUX;

	// Inputs
	reg [1:0] in;
	reg [0:0] sel;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	ntooneMUX #(2) uut (
		.in(in), 
		.sel(sel), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;
		sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		//in = 4'b1010;
		in = 2'b10;
		sel = 0;
		
		#10 sel = 1;
		//#10 sel = 2;
		//#10 sel = 3;

	end
      
endmodule

