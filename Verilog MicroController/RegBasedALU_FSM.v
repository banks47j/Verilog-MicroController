// Register Based ALU Operations FSM
// SS&M Final
// Johnathan Banks
//*******************************************************
module RegALU_OP(reg1_out, ALU_in1, reg2_out, ALU_in2, Reg_Dest, PC_Increment, Done, reset, clk, start, ALU_OutEn, ALU_tsb_out);

input reset, clk, start;
output reg1_out, ALU_in1, reg2_out, ALU_in2, Reg_Dest, PC_Increment, Done, ALU_OutEn, ALU_tsb_out;
reg reg1_out, ALU_in1, reg2_out, ALU_in2, Reg_Dest, PC_Increment, Done, ALU_OutEn, ALU_tsb_out;
reg [3:0] state, next_state;

parameter
	Zero  = 4'b0000, // Zero  = Waiting for begin signal *Denotes variable changed this state
	
					// Zero  | reg1_out = 0  | ALU_in1 = 0  | reg2_out = 0  | ALU_in2 = 0  | Reg_Dest = 0  | PC_Increment = 0  | Done = 0
					//------------------------------------------------------------------------------------------------------------
	One   = 4'b0001,// One   | reg1_out = 1* | ALU_in1 = 1* | reg2_out = 0  | ALU_in2 = 0  | Reg_Dest = 0  | PC_Increment = 0  | Done = 0
					//------------------------------------------------------------------------------------------------------------
	Two   = 4'b0010,// Two   | reg1_out = 0* | ALU_in1 = 0* | reg2_out = 0  | ALU_in2 = 0  | Reg_Dest = 0  | PC_Increment = 0  | Done = 0
					//------------------------------------------------------------------------------------------------------------
	Three = 4'b0011,// Three | reg1_out = 0  | ALU_in1 = 0  | reg2_out = 1* | ALU_in2 = 1* | Reg_Dest = 0  | PC_Increment = 0  | Done = 0
					//------------------------------------------------------------------------------------------------------------
	Four  = 4'b0100,// Four  | reg1_out = 0  | ALU_in1 = 0  | reg2_out = 0* | ALU_in2 = 0* | Reg_Dest = 0  | PC_Increment = 0  | Done = 0
					//------------------------------------------------------------------------------------------------------------
	Five  = 4'b0101,//
					//------------------------------------------------------------------------------------------------------------
	Six	  = 4'b0110,// Six   | reg1_out = 0  | ALU_in1 = 0  | reg2_out = 0  | ALU_in2 = 0  | Reg_Dest = 1* | PC_Increment = 1* | Done = 0
					//------------------------------------------------------------------------------------------------------------	
	Seven = 4'b0111,// Seven | reg1_out = 0  | ALU_in1 = 0  | reg2_out = 0  | ALU_in2 = 0  | Reg_Dest = 0* | PC_Increment = 0* | Done = 1*
					//------------------------------------------------------------------------------------------------------------
	Eight = 4'b1000,// Eight | reg1_out = 0  | ALU_in1 = 0  | reg2_out = 0  | ALU_in2 = 0  | Reg_Dest = 0  | PC_Increment = 0  | Done = 0*	
	Nine  = 4'b1001;


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
	Eight: 	next_state <= Nine;
	Nine: 	next_state <= Zero;
	endcase
end

always@(state)
	begin
		reg1_out 		<= 1'b0; 
		ALU_in1 		<= 1'b0;
		reg2_out		<= 1'b0;
		ALU_in2			<= 1'b0;
		Reg_Dest		<= 1'b0;
		ALU_OutEn		<= 1'b0;
		ALU_tsb_out		<= 1'b0;
		PC_Increment	<= 1'b0;
		Done			<= 1'b0;
	// Outputs set to default values
	case (state)
		Zero: /* Empty State */ ;
		One:	;
		Two: 	begin
					reg1_out  	 	<= 1'b1;
					ALU_in1			<= 1'b1;
				end
		Three:  	begin
					reg1_out  		<= 1'b1;
					ALU_in1 		<= 1'b1;
				end	
		Four: 	begin
					reg1_out  		<= 1'b0;
					ALU_in1 		<= 1'b0;	
				end
		Five: 	begin
					reg2_out		<= 1'b1;
					ALU_in2	 		<= 1'b1;
				end
		Six: 	begin
					reg2_out		<= 1'b0;
					ALU_in2	 		<= 1'b0;
					ALU_OutEn		<= 1'b1;
					ALU_tsb_out		<= 1'b1;
				end
		Seven : 	begin
					ALU_OutEn		<= 1'b1;
					ALU_tsb_out		<= 1'b1;
					Reg_Dest		<= 1'b1;
					PC_Increment 	<= 1'b1;
				end
		Eight: 	begin
					ALU_OutEn		<= 1'b0;
					ALU_tsb_out		<= 1'b0;
					Reg_Dest		<= 1'b0;
					PC_Increment 	<= 1'b0;
					Done			<= 1'b1;
				end
		Nine: 	begin
					Done			<= 1'b0;
				end
	endcase
	end
endmodule
