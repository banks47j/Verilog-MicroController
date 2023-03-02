// Instruction Fetch FSM Module
// SS&M Final
// Johnathan Banks
//*******************************************************
module IFetch(PC_Out, MAR_inEn, RW, Enable, InEnMDR_Out, OutEnMDR_Out, IR_in, reset, clk, Done, MFC);

input reset, clk, Done, MFC;
output PC_Out, MAR_inEn, RW, Enable, InEnMDR_Out, OutEnMDR_Out, IR_in;
reg PC_Out, MAR_inEn, RW, Enable, InEnMDR_Out, OutEnMDR_Out, IR_in;
reg [3:0] state, next_state;

parameter
		Zero  = 4'b0000, // Zero  = Waiting for begin signal (Done or Reset) *Denotes variable changed this state
		
						// Zero  | PC_Out = 0  | MAR_inEn = 0  | RW = 0  | Enable = 0  | InEnMDR_Out = 0  | IR_in = 0
						//----------------------------------------------------------------------------------------------
		One   = 4'b0001, // One   | PC_Out = 1* | MAR_inEn = 1* | RW = 0  | Enable = 0  | InEnMDR_Out = 0  | IR_in = 0
						//----------------------------------------------------------------------------------------------
		Two   = 4'b0010, // Two   | PC_Out = 0* | MAR_inEn = 0* | RW = 1* | Enable = 1* | InEnMDR_Out = 0  | IR_in = 0  
						//----------------------------------------------------------------------------------------------
		Three = 4'b0011, // Three | This state is waiting for MFC to be '1'
						//----------------------------------------------------------------------------------------------
		Four  = 4'b0100, // Four  | PC_Out = 0  | MAR_inEn = 0  | RW = 1  | Enable = 1  | InEnMDR_Out = 1* | IR_in = 1*
						//----------------------------------------------------------------------------------------------
		Five  = 4'b0101, // Five  |PC_Out = 0  | MAR_inEn = 0  | RW = 0* | Enable = 0* | InEnMDR_Out = 0* | IR_in = 0* 
		Six	  = 4'b0110,
		Seven = 4'b0111;
		

always @(posedge clk)
begin
if (!reset) state <= Zero;
else /*if (clk)*/ state <= next_state;
end

always@(posedge clk)
begin
	case (state)
	Zero: begin if (reset) next_state <= One;
		  else next_state <= Zero; end
	One: 	next_state <= Two;
	Two: 	next_state <= Three;
	Three: 	begin if (MFC) next_state <= Four;
			else next_state <= Three; end
	Four: 	next_state <= Five;
	Five: 	next_state <= Six;
	Six :	next_state <= Seven;
	Seven: 	if (Done) next_state <= Zero;
			else next_state <= Seven;
	endcase
end

always@(state)
	begin
		PC_Out 			<= 1'b0; 
		MAR_inEn 		<= 1'b0;
		RW				<= 1'b0;
		Enable			<= 1'b0;
		InEnMDR_Out		<= 1'b0;
		OutEnMDR_Out 	<= 1'b0;
		IR_in			<= 1'b0;
	// Outputs set to default values
	case (state)
		Zero: /* Empty State */ ; 	
		One: 	begin
					PC_Out   <= 1'b1;
					MAR_inEn <= 1'b1;
				end
		Two:  	begin
					PC_Out   <= 1'b0;
					MAR_inEn <= 1'b0;
					RW		 <= 1'b1;
					Enable	 <= 1'b1;
				end	
		Three:  begin // Repeat and hold value
					RW		 <= 1'b1;
					Enable	 <= 1'b1;
				end
		Four: 	begin
					RW			  <= 1'b0;
					Enable	 	  <= 1'b0;
					InEnMDR_Out   <= 1'b1;
					OutEnMDR_Out  <= 1'b1;
					IR_in		  <= 1'b1;
				end
		Five:	begin
					InEnMDR_Out   <= 1'b1;
					OutEnMDR_Out  <= 1'b1;
					IR_in		  <= 1'b1;
				end
		Six:	begin
					InEnMDR_Out   <= 1'b1;
					OutEnMDR_Out  <= 1'b1;
					IR_in		  <= 1'b1;
				end
		Seven: 	begin
					InEnMDR_Out   <= 1'b0;
					OutEnMDR_Out  <= 1'b0;
					IR_in		  <= 1'b0;
				end
	endcase
	end
endmodule