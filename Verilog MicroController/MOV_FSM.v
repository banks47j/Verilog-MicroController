// MOV FSM
// SS&M Final
// Johnathan Banks
//*******************************************************
module MOV(reg_outEn, Reg_DestinEN, PC_Increment, Done, reset, clk, start);

input reset, clk, start;
output reg_outEn, Reg_DestinEN, PC_Increment, Done;
reg reg_outEn, Reg_DestinEN, PC_Increment, Done;
reg [2:0] state, next_state;

parameter
	Zero  = 3'b000, // Zero  = Waiting for begin signal *Denotes variable changed this state
	
					// Zero  | reg_outEn = 0  | Reg_DestinEN = 0  | PC_Increment = 0  | Done = 0
					//------------------------------------------------------------------------------------------------------------
	One   = 3'b001, // One   | reg_outEn = 1* | Reg_DestinEN = 1* | PC_Increment = 0  | Done = 0
					//------------------------------------------------------------------------------------------------------------
	Two   = 3'b010, // Two   | reg_outEn = 1  | Reg_DestinEN = 0* | PC_Increment = 0  | Done = 0
					//------------------------------------------------------------------------------------------------------------
	Three = 3'b011, // Three | reg_outEn = 0* | Reg_DestinEN = 0  | PC_Increment = 0  | Done = 0
					//------------------------------------------------------------------------------------------------------------
	Four  = 3'b100, // Four  | reg_outEn = 0  | Reg_DestinEN = 0  | PC_Increment = 1* | Done = 0
					//------------------------------------------------------------------------------------------------------------
	Five  = 3'b101, // Five  | reg_outEn = 0  | Reg_DestinEN = 0  | PC_Increment = 0* | Done = 1*
					//------------------------------------------------------------------------------------------------------------
	Six   = 3'b110; // Six   | reg_outEn = 0  | Reg_DestinEN = 0  | PC_Increment = 0  | Done = 0*
					//------------------------------------------------------------------------------------------------------------

always@(posedge clk)
begin
if (!reset) state <= Zero;
else /*if (clk)*/ state <= next_state;
end

always@(posedge clk)
begin
	case (state)
	Zero: if (start) next_state <= One;
		  else next_state <= Zero;
	One: 	next_state <= Two;
	Two: 	next_state <= Three;
	Three:  next_state <= Four;
	Four: 	next_state <= Five;
	Five: 	next_state <= Six;
	Six:	next_state <= Zero;
	endcase
end

always@(state)
	begin
		reg_outEn 		<= 1'b0;
		Reg_DestinEN	<= 1'b0;
		PC_Increment	<= 1'b0;
		Done			<= 1'b0;
	// Outputs set to default values
	case (state)
		Zero: /* Empty State */ ;
		One: 	begin
					reg_outEn		<= 1'b1;
					Reg_DestinEN	<= 1'b1;
				end
		Two:  	begin
					Reg_DestinEN 	<= 1'b0;
				end	
		Three: 	begin		
					reg_outEn		<= 1'b0;
				end
		Four: 	begin
					PC_Increment	<= 1'b1;
				end
		Five: 	begin
					PC_Increment	<= 1'b0;
					Done		<= 1'b1;
				end
		Six : 	begin
					Done		<= 1'b0;
				end
	endcase
	end
endmodule
