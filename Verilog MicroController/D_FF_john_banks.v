/*	
System Synthesis and Modeling
16-bit D Flip-Flop
Johnathan Banks
*/

module DFF(in, clk, reset, in_en, q);
	input wire 	[15:0] 	in;
	input 				in_en, reset, clk;
	output 		[15:0]	q;
	reg 		[15:0] 	q;

always @(posedge clk)
	if (!reset)
		q<=16'bz;
	else if (in_en)
		q<=in;
endmodule