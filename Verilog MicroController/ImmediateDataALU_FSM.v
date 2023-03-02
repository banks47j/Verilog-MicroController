// Immediate Data Based ALU Operations FSM
// SS&M Final
// Johnathan Banks
//*******************************************************
module ImDataALU_OP(ALU_in1, reg_out, ALU_in2, Reg_Dest, PC_Increment, Done, reset, clk, start, ALU_OutEn, ALU_tsb_out);

input reset, clk, start;
output ALU_in1, reg_out, ALU_in2, Reg_Dest, PC_Increment, Done, ALU_OutEn, ALU_tsb_out;
reg ALU_in1, reg_out, ALU_in2, Reg_Dest, PC_Increment, Done, ALU_OutEn, ALU_tsb_out;
reg [3:0] state, next_state;

parameter
	Zero  = 4'b0000, // Zero  = Waiting for begin signal *Denotes variable changed this state
	
					// Zero  | ALU_in1 = 0  | reg_out = 0  | ALU_in2 = 0  | Reg_Dest = 0  | PC_Increment = 0  | Done = 0
					//------------------------------------------------------------------------------------------------------------
	One   = 4'b0001,// One   | ALU_in1 = 1* | reg_out = 0  | ALU_in2 = 0  | Reg_Dest = 0  | PC_Increment = 0  | Done = 0
					//------------------------------------------------------------------------------------------------------------
	Two   = 4'b0010,// Two   | ALU_in1 = 0* | reg_out = 1* | ALU_in2 = 0  | Reg_Dest = 0  | PC_Increment = 0  | Done = 0
					//------------------------------------------------------------------------------------------------------------
	Three = 4'b0011,// Three | ALU_in1 = 0  | reg_out = 1  | ALU_in2 = 1* | Reg_Dest = 0  | PC_Increment = 0  | Done = 0
					//------------------------------------------------------------------------------------------------------------
	Four  = 4'b0100,// Four  | ALU_in1 = 0  | reg_out = 0* | ALU_in2 = 0* | Reg_Dest = 0  | PC_Increment = 0  | Done = 0
					//------------------------------------------------------------------------------------------------------------
	Five  = 4'b0101,// Five  | 
					//------------------------------------------------------------------------------------------------------------
	Six	  = 4'b0110,// Six   | ALU_in1 = 0  | reg_out = 0  | ALU_in2 = 0  | Reg_Dest = 1* | PC_Increment = 1* | Done = 0
					//------------------------------------------------------------------------------------------------------------	
	Seven = 4'b0111,// Seven | ALU_in1 = 0  | reg_out = 0  | ALU_in2 = 0  | Reg_Dest = 0* | PC_Increment = 0* | Done = 1*
					//------------------------------------------------------------------------------------------------------------
	Eight = 4'b1000;// Eight | ALU_in1 = 0  | reg_out = 0  | ALU_in2 = 0  | Reg_Dest = 0  | PC_Increment = 0  | Done = 0*					


always@(posedge clk)
begin
if (!reset) state <= Zero;
else /*if (clk)*/ state <= next_state;
end

always@(posedge clk)
begin
	case (state)
	Zero: begin if (start) next_state <= One;
		  else next_state <= Zero; end
	One: 	next_state <= Two;
	Two: 	next_state <= Three;
	Three:  next_state <= Four;
	Four: 	next_state <= Five;
	Five: 	next_state <= Six;
	Six: 	next_state <= Seven;
	Seven: 	next_state <= Eight;
	Eight: 	next_state <= Zero;
	endcase
end

always@(state)
	begin
		ALU_in1 		<= 1'b0;
		reg_out			<= 1'b0;
		ALU_in2			<= 1'b0;
		Reg_Dest		<= 1'b0;
		PC_Increment	<= 1'b0;
		Done			<= 1'b0;
		ALU_OutEn		<= 1'b0;
		ALU_tsb_out		<= 1'b0;
	// Outputs set to default values
	case (state)
		Zero: /* Empty State */ ;
		One: 	begin
					ALU_in1		<= 1'b1;
				end
		Two:  	begin
					ALU_in1 	<= 1'b0;
				end	
		Three: 	begin		
					reg_out		<= 1'b1;
					ALU_in2	 	<= 1'b1;
				end
		Four: 	begin
					reg_out		<= 1'b0;
					ALU_in2	 	<= 1'b0;
				end
		Five: 	begin
					ALU_OutEn	<= 1'b1;
					ALU_tsb_out	<= 1'b1;
				end
		Six : 	begin
					Reg_Dest		<= 1'b1;
					PC_Increment 	<= 1'b1;
				end
		Seven: 	begin
					ALU_OutEn		<= 1'b0;
					ALU_tsb_out		<= 1'b0;
					Reg_Dest		<= 1'b0;
					PC_Increment	<= 1'b0;
					Done			<= 1'b1;
				end
		Eight: 	begin
					Done			<= 1'b0;
				end
	endcase
	end
endmodule
