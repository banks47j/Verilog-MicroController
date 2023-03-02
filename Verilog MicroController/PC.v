/*	
System Synthesis and Modeling
Program Counter
Johnathan Banks
*/

module PC (q, clk, reset, increment);
	input 			clk, reset, increment;
	output 	[15:0] 	q;
	reg		[15:0]	q;
	
	always @(posedge clk)
		if (!reset)
			q = 16'd0;
		else if (increment)
			q = q + 1;
endmodule