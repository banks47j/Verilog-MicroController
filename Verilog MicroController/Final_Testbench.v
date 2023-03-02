// Memory and Testbench Module for MircroController
// System Synthesis and Modeling Final Project
// Author: Johnathan Banks
// Due Date: 12/08/22
//*****************************************************************************************

`timescale 10ns / 1ns

module Microcontroller_Testbench;
	// Outputs to Microcontroller_Top
	reg 			clk, reset, MFC;
	reg 	[15:0] 	DataToMDR;
	reg 	[15:0]	P1_Input_from_TB;
	reg				P1in_en;

	// Inputs from Microcontroller_Top
	wire 	     RW, Enable; 
	wire  [15:0] Address; 		// This will go to the testbench from MAR to tell it which value to output to MDR
	wire  [15:0] P0_toTB;		// IO_Port0 to TB 
	wire  [15:0] MDR_To_TB;		// MDR to Memory in Testbench	

	wire  [15:0] Bus_Monitor;
	
wire MFC_Mem_to_Controller;		
wire [15:0] MemDataToMDR;						
// Instantiate Memory
Memory				memory	(	.clk				(clk),
								.Data_out 			(MemDataToMDR),
								.MFC 				(MFC_Mem_to_Controller),
								.RW 				(RW),
								.Enable 			(Enable),
								.Address 			(Address),
								.Data_in			(MDR_To_TB));

// Instantiate Top Level 

Microcontroller_Top		top	(	.clk				(clk),
								.reset				(reset),
								.MFC				(MFC_Mem_to_Controller),
								.DataToMDR			(MemDataToMDR),
								.P1_Input_from_TB	(P1_Input_from_TB),
								.P1in_en			(P1in_en),
								.Enable				(Enable),
								.RW					(RW),
								.Address			(Address),
								.P0_toTB			(P0_toTB),
								.MDR_To_TB			(MDR_To_TB),
								.Bus_Monitor		(Bus_Monitor));

								
// Generate Clock
always #2 clk = ~clk; 

// Form Stimulus
initial begin
	// Initialize Testbench Variables
	clk 	<= 0;
	reset	<= 0;
	P1in_en <= 1;
	
	// Drive Stimulus
	#41	reset	<= 1;
		P1_Input_from_TB <= 16'b1111000011110000; // #F0F0
		end	
endmodule