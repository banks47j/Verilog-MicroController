/*
16 bit Tri-state Buffer 
Johnathan Banks
*/

module TSB(in, out_en, out);
	input  [15:0]	in;
	input  			out_en;
	output [15:0]	out;
	reg	   [15:0]	out;
	
	always @(in or out_en)
	begin if(out_en)
		out = in;
	else out = 16'bz;
	end
endmodule