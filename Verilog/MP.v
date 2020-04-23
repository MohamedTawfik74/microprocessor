`timescale 1ns / 1ps


module MP(Design_IN, Clk, Design_OUT);

//IN OUT interface
input [3:0]Design_IN;
output [15:0]Design_OUT;
wire [3:0]Design_IN;
wire [15:0]Design_OUT;


//interconnection wires
wire [15:0]Instruction
		,ALU_Result
		,Program_Counter_Inc
		,R2
		,ALU_B
		,R1
		,Rmux3_to_Rmux4
		,Rmux4_to_Rmux5
		,Program_Counter_Output
		,Program_Counter_Input
		,D_to_DATA_in_RF
		,InPort_to_DATA_in_RF
		,Rmux5_to_DATA_in_RF
		,PCmux2_to_PCmux1
		,PCmux3_to_PCmux2
		,ADDER2_to_PCmux3
		,SE_Result;
		
wire [2:0]Rmux2_to_Rmux1
		,Rmux1_to_WREG
 		,ALU_FUNC
		,ALUMUX2_to_ALUMUX3;
		
wire ZF
	,SIG_SPC3;
	//,Reset;
		
//Clock Wire
input Clk;
wire Clk;

//Control Signals
//17:WRF, 16:WRAM, 15:BRCE, 14:BRCNE, 13:SPC2, 12:SPC1, 11:SRFD1, 10:SRFD2, 9:SRFD3,
//8:SRFW1, 7:SRFW2, 6:SALU, 5:LOP, 4:RPC, 3:RRF, 2:SALU1, 1:SALU0, 0:LPC
wire [17:0]Control_Word;

/*---------------------MAIN MODULES--------------------*/
Instructions_MEM Instructions_MEM(.Address(Program_Counter_Output), .out(Instruction));

Control_Unit Control_Unit(.OPcode(Instruction[15:12]), .Control_Word(Control_Word));

Reg_file Reg_file(.Data_in(Rmux5_to_DATA_in_RF), .WREG(Rmux1_to_WREG), .RREG1(Instruction[11:9]), .RREG2(Instruction[8:6]), .RW(Control_Word[17]), .Clk(Clk), .R1(R1), .R2(R2));

ALU ALU(.Operand1(R1), .Operand2(ALU_B), .FUNC(ALU_FUNC), .Result(ALU_Result), .ZF(ZF));

RAM RAM(.Address(ALU_Result[7:0]), .Data_in(R2), .Data_out(D_to_DATA_in_RF), .DW(Control_Word[16]), .Clk(Clk));

PC_reg PC_reg(.reset(1'b0), .Clk(Clk), .PC_reg(Program_Counter_Output), .Load(Control_Word[0]), .in(Program_Counter_Input));

Sign_extend Sign_extend(.in(Instruction[5:0]), .out(SE_Result));

Input_port Input_port(.in({12'b000000000000,Design_IN}), .out(InPort_to_DATA_in_RF));

Output_port Output_port(.in(R1), .out(Design_OUT), .LOP(Control_Word[5]), .Clk(Clk));

/*-------------------------------MUXES-----------------------------------*/
threebit_2to1MUX RMUX1(.in1(Rmux2_to_Rmux1), .in2(3'b111), .sel(Control_Word[8]), .out(Rmux1_to_WREG));

threebit_2to1MUX RMUX2(.in1(Instruction[8:6]), .in2(Instruction[5:3]), .sel(Control_Word[7]), .out(Rmux2_to_Rmux1));

sixteenbit_2to1MUX ALUMUX1(.in1(R2), .in2(SE_Result), .sel(Control_Word[6]), .out(ALU_B));

threebit_4to1MUX ALUMUX2(.in1(Instruction[2:0]), .in2(3'b000), .in3(3'b010), .in4(3'b011), .sel(Control_Word[2:1]), .out(ALUMUX2_to_ALUMUX3));

threebit_2to1MUX ALUMUX3(.in1(ALUMUX2_to_ALUMUX3), .in2(3'b001), .sel((Control_Word[15] | Control_Word[14])), .out(ALU_FUNC));

sixteenbit_2to1MUX RMUX3(.in1(ALU_Result), .in2(D_to_DATA_in_RF), .sel(Control_Word[9]), .out(Rmux3_to_Rmux4));

sixteenbit_2to1MUX RMUX4(.in1(Rmux3_to_Rmux4), .in2(Program_Counter_Inc), .sel(Control_Word[10]), .out(Rmux4_to_Rmux5));

sixteenbit_2to1MUX RMUX5(.in1(Rmux4_to_Rmux5), .in2(InPort_to_DATA_in_RF), .sel(Control_Word[11]), .out(Rmux5_to_DATA_in_RF));

sixteenbit_2to1MUX PCMUX1(.in1(PCmux2_to_PCmux1), .in2(R1), .sel(Control_Word[12]), .out(Program_Counter_Input));

sixteenbit_2to1MUX PCMUX2(.in1({Program_Counter_Output[15:12],Instruction[11:0]}), .in2(PCmux3_to_PCmux2), .sel(Control_Word[13]), .out(PCmux2_to_PCmux1));
//check here for errors
sixteenbit_2to1MUX PCMUX3(.in1(Program_Counter_Inc), .in2(ADDER2_to_PCmux3), .sel(SIG_SPC3), .out(PCmux3_to_PCmux2));

/*--------------------------------ADDERS---------------------------------*/

//Adder1
assign Program_Counter_Inc = Program_Counter_Output + 1;
//Adder2
assign ADDER2_to_PCmux3 = SE_Result + Program_Counter_Inc;

//And OR Circuit
assign SIG_SPC3 = ( (Control_Word[15] & ZF) |  (Control_Word[14] & (~ZF) ));




endmodule
