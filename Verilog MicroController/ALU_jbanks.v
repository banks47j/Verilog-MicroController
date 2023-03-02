/*
16 bit ALU
Johnathan Banks
System Synthesis and Modeling - Final Project
*/

module ALU(
	input 	[15:0]  in1, in2,		// 16-bit Inputs from DFF input registers
	input  	[3:0]   OpControl,		// Operation Control input
	output 	[15:0]  out				// 16-bit ALU Output
	);			

	reg 	[15:0] 	ALU_Result;		// Result of ALU operation
	
	assign	out  = 	ALU_Result;
    
	always @(posedge in1, in2, OpControl)
    begin
		case (OpControl)
		4'b0000: ALU_Result = in1 + in2 ; 	// Add
        4'b0001: ALU_Result = in1 - in2 ; 	// Subtraction
        4'b0010: ALU_Result = ~in1;			// Logical NOT for in1
        4'b0011: ALU_Result = ~in2;			// Logical NOT for in2		
        4'b0100: ALU_Result = in1 & in2; 	// Logical AND
        4'b0101: ALU_Result = in1 | in2;	// Logical OR
        4'b0110: ALU_Result = in1 ^ in2;	// Logical XOR
        4'b0111: ALU_Result = ~(in1 ^ in2);	// Logical XNOR
		4'b1000: ALU_Result = in1 + in2 ; 	// Addi
		4'b1001: ALU_Result = in1 - in2 ; 	// Subi
        default: ALU_Result = 0;
		endcase
    end

endmodule