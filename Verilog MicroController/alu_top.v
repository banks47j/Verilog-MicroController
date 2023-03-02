/*
Top level module for Final Project - Part 1 "The ALU"
Author: Johnathan Banks
*/

module ALU_Top(
// Inputs
	input			reset,
	input 			clk,
	input	[15:0]	bus_in,			// Input from bus		
	input			ALU_in1,		// Input enable for in1 of ALU
	input			ALU_in2,		// Input enable for in2 of ALU
	input	[3:0]	opControl,		// Operation Controller for ALU
	input			ALU_outen,		// Input enable for output register of ALU
	input			ALU_tsb_out,	// Output enable for TSB on output of ALU
//outputs
	output wire [15:0] bus_out); // Output to bus from ALU->outReg->TSB

// Instantiate Reg_in1 & Reg_in2
wire [15:0] q1;
DFF Reg_in1 (	.clk	(clk),
				.reset	(reset),
				.in		(bus_in),
				.in_en	(ALU_in1),
				.q		(q1));

wire [15:0] q2;
DFF Reg_in2 (	.clk	(clk),
				.reset	(reset),
				.in		(bus_in),
				.in_en	(ALU_in2),
				.q		(q2));

// Instantiate ALU
wire [15:0]	ALU_out;
ALU alu		(	.in1		(q1),
				.in2		(q2),
				.OpControl	(opControl),
				.out		(ALU_out));

// Instantiate output Register
wire [15:0] q3;
DFF Reg_out (	.clk	(clk),
				.reset	(reset),
				.in		(ALU_out),
				.in_en	(ALU_outen),
				.q		(q3));

// Instantiate Output TSB
TSB tsb (	.in		(q3),
						.out_en	(ALU_tsb_out),
						.out	(bus_out));

endmodule