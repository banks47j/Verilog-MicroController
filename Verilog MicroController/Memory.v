// Memory Module for MircroController
// System Synthesis and Modeling Final Project
// Author: Johnathan Banks
// Due Date: 12/08/22
//*****************************************************************************************

// Modelsim-ASE requires a timescale directive
`timescale 10ns / 1ns

module Memory(clk, Data_out, MFC, RW, Enable, Address, Data_in);
// Inputs
	input 					clk, RW, Enable;
	input 			[15:0]	Address, Data_in;
// Outputs
	output 	reg		[15:0]	Data_out;
	output	reg				MFC;
			reg		[15:0]	MemCell;
	
always @(posedge clk)
	begin
		if(Enable)
			begin
			if (RW)
				begin
					case(Address)
						16'd0:	Data_out = 16'b1011000001010101;	// Movi 	| R1 	 | #15 
																	// 1011		| 000001 |	
						16'd1:	Data_out = 16'b1011000010101111;	// Movi 	| R2	 | #2F		
																	// 1011		| 000010 |						
						16'd2:	Data_out = 16'b0000000001000010;	// ADD	 	| R1	 | R2	
																	// 0000		| 000001 | 000010						
						16'd3:	Data_out = 16'b1010000011000001;	// MOV	 	| P0 	 | R1		
																	// 1010		| 000011 | 000001
						16'd4:	Data_out = 16'b0110000010000001;	// XOR		| R2	 | R1
																	// 0110		| 000010 | 000001
						16'd5:	Data_out = 16'b0010000010000000;	// NOT 		| R2     | ***	
																	// 0010		| 000010 | 000000						
						16'd6:	Data_out = 16'b1101000011000010;	// Store	| P0	 | (R2) 		
																	// 1101		| 000011 |						
						16'd7:	Data_out = 16'b1100000010000000;	// Load		| (R2)	 | R0	
																	// 1100		| 000010 | 000000					  
					  default:	Data_out = MemCell;
					endcase
				end
			else
				begin
					MemCell = Data_in;
				end
			#8 MFC = 1;
			end
	end

always @(negedge Enable)
	begin
		MFC = 0;
	end
endmodule