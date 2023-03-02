// Top Level Module for MircroController
// System Synthesis and Modeling Final Project
// Author: Johnathan Banks
// Due Date: 12/08/22
//*****************************************************************************************

module Microcontroller_Top(clk, reset, MFC, DataToMDR, P1_Input_from_TB, P1in_en, Enable, Address, RW, P0_toTB, MDR_To_TB, Bus_Monitor);
	// Inputs from Testbench / Memory
	input 	 		clk, reset, MFC;
	input 	[15:0] 	DataToMDR;
	input 	[15:0]	P1_Input_from_TB;
	input		 	P1in_en; 


	// Outputs to Testbench / Memory
	output wire Enable, RW;
	output  	[15:0] Address; 		// This will go to the testbench from MAR to tell it which value to output to MDR
	output  reg [15:0] P0_toTB;		// IO_Port0 to TB 
	output  	[15:0] MDR_To_TB;	// MDR to Memory in Testbench	
	
	
			// This is a dummy wire to monitor the bus value.
			output wire [15:0] Bus_Monitor;	




//*****************************************************************	
// Checklist !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!	
//*****************************************************************		

// Instantiate 		Components of Mircocontroller	| Instantiated?	| Code Verified?	| Reset Checked? 	|
		// 1)  		Instruction Register			| Yes			| Yes				| Yes				|
		// 2)  		Decoder							| Yes			| Yes				| Yes				|	This is most likely where mistakes are.
		// 3)  		PC								| Yes			| Yes				| Yes				|
		// 4) 		PC TSB							| Yes			| Yes				| Yes				|
		// 5)  		MAR								| Yes			| Yes				| Yes				|
		// 6) 		MDRin							| Yes			| Yes				| Yes				|
		// 7) 		MDRout							| Yes			| Yes				| Yes				|
		// 8)  		MDR TSB							| Yes			| Yes				| Yes				|
		// 9) 		ALU								| Yes			| Yes				| Yes				|
		// 10) 		I/O Port 0						| Yes			| Yes				| Yes				|
		// 11) 		I/O Port 0 TSB					| Yes			| Yes				| Yes				|
		// 12) 		I/O Port 1						| Yes			| Yes				| Yes				|
		// 13) 		I/O Port 1 TSB					| Yes			| Yes				| Yes				|
		// 14/15) 	R0 & TSB						| Yes			| Yes				| Yes				|
		// 16/17) 	R1 & TSB						| Yes			| Yes				| Yes				|
		// 18/19) 	R2 & TSB						| Yes			| Yes				| Yes				|

		
// READ YOUR COMMENTS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		
		
		// Fix problems with ALU Out Enable - Done
		// Instantiate IO ports, do checks	- Done
		// Write Testbench / Memory.		- Done
		// Test and fix
		// Synthesize 
		
	//------------------ Here 		
		
		// Test and fix
		// Submit Project
			
//*****************************************************************				
//*****************************************************************		
// Wires for passing data between modules.
//*****************************************************************		
wire [15:0] bus;			// Bus Wire
wire [15:0] IRtoDecoder;	// IR output to Decoder input Data
wire		IR_in;			// IR input enable. From Decoder to IR.
wire		PC_Increment;	// Wired from Decoder to PC
wire		InEnMDR_Out;	// Wired from Decoder to the input enable of the output MDR
wire		OutEnMDR_Out;	// Wired from Decoder to the input enable of the output MDR TSB
wire		ALU_in1;		// Wired from Decoder to ALU value #1 
wire		ALU_in2;		// Wired from Decoder to ALU value #2
wire		R0out_en;		// Wired from Decoder to output enable of R0 (TSB)
wire		R1out_en;		// Wired from Decoder to output enable of R1 (TSB)
wire		R2out_en;		// Wired from Decoder to output enable of R2 (TSB)
wire		P0in_en;		// Wired from Decoder to input enable of Port
wire 		P0out_en; 		// Wired from Decoder to output enable of P0 (TSB)
wire 		P1out_en;		// Wired from Decoder to output enable of P1 (TSB)
wire		PC_Out;			// Wired from Decoder to PC
wire		MAR_inEn;		// Wired from Decoder to MAR
wire		MDR_inEn;		// Wired from Decoder to MDR
wire		R0in_en;		// Wired from Decoder to input enable of R0
wire		R1in_en;		// Wired from Decoder to input enable of R0
wire		R2in_en;		// Wired from Decoder to input enable of R0
wire [3:0]	OpCode;			// Sends OpCode from Decoder to ALU
wire		ALU_OutEn;		// Wired from Decoder to Output Enable of ALU
wire 		ALU_tsb_out;	// Wired from Decoder to Output TSB of ALU


assign	Bus_Monitor = bus;


//*****************************************************************				
// Instantiate IR (1)
//*****************************************************************		
DFF 	IR 			(	.clk	(clk),
						.reset 	(reset),
						.in		(bus),
						.in_en	(IR_in),
						.q		(IRtoDecoder));
						
//*****************************************************************		
// Instantiate Decoder (2)
//*****************************************************************		
Decoder decoder 	(	.clk			(clk),
						.reset 			(reset),
						.MFC			(MFC),
						.Input_Data		(IRtoDecoder),
						.PC_Increment	(PC_Increment),
						.RW				(RW),
						.Enable			(Enable),
						.InEnMDR_Out 	(InEnMDR_Out),
						.OutEnMDR_Out 	(OutEnMDR_Out),
						.ALU_in1		(ALU_in1),
						.ALU_in2		(ALU_in2),
						.R0out_en 		(R0out_en),
						.R1out_en		(R1out_en),
						.R2out_en		(R2out_en),
						.P0in_en		(P0in_en),
						.P0out_en		(P0out_en), 
						.P1out_en		(P1out_en),
						.PC_Out			(PC_Out),
						.IR_in			(IR_in),
						.MAR_inEn		(MAR_inEn),
						.MDR_inEn		(MDR_inEn),
						.R0in_en		(R0in_en), 
						.R1in_en		(R1in_en),
						.R2in_en		(R2in_en),
						.ALU_OutEn		(ALU_OutEn),
						.ALU_tsb_out	(ALU_tsb_out),
						.OpCode			(OpCode),
						.MoviToBus		(bus));
						
//*****************************************************************
// Instantiate Program Counter and TSB (4:3)
//*****************************************************************
wire	[15:0]	PCtoTSB;	// PC Output
PC 	pc 	(	.clk		(clk),
			.reset 		(reset),
			.increment	(PC_Increment),
			.q			(PCtoTSB));

TSB	tsb	(	.in		(PCtoTSB),
			.out_en	(PC_Out),
			.out	(bus));

//*****************************************************************
// Instantiate MAR, MDRin, MDRout, and MDRtsb (8:5)
//*****************************************************************
wire [15:0] Address_MAR;
DFF	MAR		(	.clk	(clk),
				.reset	(reset),
				.in		(bus),
				.in_en	(MAR_inEn),
				.q		(Address_MAR));
				
assign Address = Address_MAR;

wire [15:0] MDR_in_MDR_To_TB;		
DFF	MDR_in	(	.clk	(clk),
				.reset	(reset),
				.in		(bus),
				.in_en	(MDR_inEn),
				.q		(MDR_in_MDR_To_TB));

assign MDR_To_TB = MDR_in_MDR_To_TB;
	
wire [15:0] MDRtoTSB;
DFF	MDR_out	(	.clk	(clk),
				.reset	(reset),
				.in		(DataToMDR),
				.in_en	(InEnMDR_Out),
				.q		(MDRtoTSB));
				
TSB	tsb_mdr	(	.in		(MDRtoTSB),
				.out_en	(OutEnMDR_Out),
				.out	(bus));
				
//*****************************************************************
// Instantiate ALU & ALU TSB (9)
//*****************************************************************
ALU_Top alu_top (	.clk			(clk),
					.reset 			(reset),
					.bus_in			(bus),
					.ALU_in1		(ALU_in1),
					.ALU_in2		(ALU_in2),
					.opControl		(OpCode), 
					.ALU_outen		(ALU_OutEn), 
					.ALU_tsb_out	(ALU_tsb_out), 
					.bus_out		(bus));

//*****************************************************************
// Instantiate I/O Ports and TSBs (13:10)
//*****************************************************************
wire	[15:0]	P0_Out;		// IO_Port0 Output

always @(P0_Out)
	begin
	P0_toTB = P0_Out;	// IO_Port to TB 
	end


DFF P0 		(	.clk	(clk),
				.reset 	(reset),
				.in		(bus),
				.in_en	(P0in_en),					
				.q		(P0_Out)); // Goes to IO_Port0_TSB to bus && to TB

TSB	P0_TSB	(	.in		(P0_Out),
				.out_en	(P0out_en),
				.out	(bus));

wire	[15:0]	P1_Out;	// IO_Port1 Output
DFF P1 		(	.clk	(clk),
				.reset 	(reset),
				.in		(P1_Input_from_TB),
				.in_en	(P1in_en),			// Unused/un-needed enable leave on always; input from TB
				.q		(P1_Out));

TSB	P1_TSB	(	.in		(P1_Out),
				.out_en	(P1out_en),
				.out	(bus));
					
//*****************************************************************						
// Instantiate Registers & TSBs (19 : 14)
//*****************************************************************		
wire	[15:0]	R0toTSB;	//Output wire
DFF R0 		(	.clk	(clk),
				.reset 	(reset),
				.in		(bus),
				.in_en	(R0in_en),
				.q		(R0toTSB));

wire	[15:0]	R1toTSB;	//Output wire
DFF R1 		(	.clk	(clk),
				.reset 	(reset),
				.in		(bus),
				.in_en	(R1in_en),
				.q		(R1toTSB));
				
wire	[15:0]	R2toTSB;	//Output wire
DFF R2 		(	.clk	(clk),
				.reset 	(reset),
				.in		(bus),
				.in_en	(R2in_en),
				.q		(R2toTSB));
			
TSB	tsb_R0	(	.in		(R0toTSB),
				.out_en	(R0out_en),
				.out	(bus));
				
TSB	tsb_R1	(	.in		(R1toTSB),
				.out_en	(R1out_en),
				.out	(bus));
				
TSB	tsb_R2	(	.in		(R2toTSB),
				.out_en	(R2out_en),
				.out	(bus));
				
endmodule