// MOVI FSM
// SS&M Final
// Johnathan Banks
//*******************************************************
module MOVI(Reg_DestinEN, PC_Increment, Done, MoviStorage_out, reset, clk, start);

input reset, clk, start;
output Reg_DestinEN, PC_Increment, Done, MoviStorage_out;
reg Reg_DestinEN, PC_Increment, Done, MoviStorage_out;
reg [2:0] state, next_state;

parameter
	Zero  = 3'b000, // Zero  = Waiting for begin signal *Denotes variable changed this state
	
					// Zero  | Reg_DestinEN = 0  | PC_Increment = 0  | Done = 0
					//------------------------------------------------------------------------------------------------------------
	One   = 3'b001, // One   | Reg_DestinEN = 1* | PC_Increment = 0  | Done = 0
					//------------------------------------------------------------------------------------------------------------
	Two   = 3'b010, // Two   | Reg_DestinEN = 0* | PC_Increment = 0  | Done = 0
					//------------------------------------------------------------------------------------------------------------
	Three = 3'b011, // Three | Reg_DestinEN = 0  | PC_Increment = 1* | Done = 0
					//------------------------------------------------------------------------------------------------------------
	Four  = 3'b100, // Four  | Reg_DestinEN = 0  | PC_Increment = 0* | Done = 1*
					//------------------------------------------------------------------------------------------------------------
	Five  = 3'b101, // Five   | Reg_DestinEN = 0  | PC_Increment = 0  | Done = 0*
					//------------------------------------------------------------------------------------------------------------
	Six	  = 3'b110;

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
	Six: 	next_state <= Zero;
	endcase
end

always@(state)
	begin
		Reg_DestinEN	<= 1'b0;
		PC_Increment	<= 1'b0;
		Done			<= 1'b0;
		MoviStorage_out <= 1'b0;
	// Outputs set to default values
	case (state)
		Zero: /* Empty State */ ;
		One:	;
		Two: 	begin
					MoviStorage_out <= 1'b1;
					Reg_DestinEN	<= 1'b1;
				end
		Three:  begin
					MoviStorage_out <= 1'b1;
					Reg_DestinEN	<= 1'b1;
				end
		Four: 	begin
					MoviStorage_out <= 1'b1;		
					Reg_DestinEN 	<= 1'b1;
					PC_Increment	<= 1'b1;
				end
		Five: 	begin
					PC_Increment	<= 1'b0;
					MoviStorage_out <= 1'b0;
					Reg_DestinEN 	<= 1'b0;
					Done			<= 1'b1;
				end
		Six: 	begin
					Done			<= 1'b0;
				end
	endcase
	end
endmodule
