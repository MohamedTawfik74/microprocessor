`timescale 1ns / 1ps


module tf_ALU;

	// Inputs
	reg [15:0] Operand1;
	reg [15:0] Operand2;
	reg [3:0] FUNC;

	// Outputs
	wire [15:0] Result;
	wire ZF;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.Operand1(Operand1), 
		.Operand2(Operand2), 
		.FUNC(FUNC), 
		.Result(Result),
		.ZF(ZF)
	);

	initial begin
		// Initialize Inputs
		Operand1 = 0;
		Operand2 = 0;
		FUNC = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		FUNC = 0;
		Operand1 = 5;
		Operand2 = 10;
		
		#10
		FUNC = 1;
		Operand1 = 12;
		Operand2 = 6;
		
		#10
		FUNC = 1;
		Operand1 = 6;
		Operand2 = 12;
		
		#10
		FUNC = 2;
		Operand1 = 16'b0101010101010101;
		Operand2 = 16'b1010101010101010;
		
		#10
		FUNC = 3;
		
		#10
		FUNC = 4;
		Operand1 = 16'b1111000011110000;
		
		#10
		FUNC = 5;
		Operand1 = 16'b1101101011011010;
		Operand2 = 16'b1001101110011011;
		
		#10 
		FUNC = 6;
		Operand1 = 16'b1111111111111111;
		
		#10
		FUNC = 7;

	end
      
endmodule

