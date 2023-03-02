// Load / Store Operations FSM
// SS&M Final
// Johnathan Banks
//*******************************************************
module Load_Store(RegOut, MDR_inEn, MAR_inEn, Enable, RW, InEnMDROut, OutEnMDROut, RegIn, PC_Increment, Done, reset, clk, start, MFC, Load);

input reset, clk, start, MFC, Load/*If '1' Load, if '0' Store*/;
output RegOut, MDR_inEn, MAR_inEn, Enable, RW, InEnMDROut, OutEnMDROut, RegIn, PC_Increment, Done;
reg RegOut, MDR_inEn, MAR_inEn, Enable, RW, InEnMDROut, OutEnMDROut, RegIn, PC_Increment, Done;
reg [3:0] state, next_state;

parameter
	Zero  = 4'b0000, // Zero  = Waiting for begin signal *Denotes variable changed this state
	
					// Zero  | RegOut = 0  | MDR_inEn = 0  | Enable = 0  | RW = 0  | InEnMDROut = 0  | RegIn = 0  | PC_Increment = 0  | Done = 0
					//------------------------------------------------------------------------------------------------------------
	One   = 4'b0001,// One   | RegOut = 1* | MDR_inEn = 1* | Enable = 0  | RW = 0  | InEnMDROut = 0  | RegIn = 0  | PC_Increment = 0  | Done = 0
					//-------------------------------------------------------------------------------------------------------------------------- Goes to state 2 or 3 depending on load or store
	Two   = 4'b0010,// Two   | RegOut = 0* | MDR_inEn = 0* | Enable = 1* | RW = 0  | InEnMDROut = 0  | RegIn = 0  | PC_Increment = 0  | Done = 0 ----- Load
					//------------------------------------------------------------------------------------------------------------
	Three = 4'b0011,// Three | RegOut = 0* | MDR_inEn = 0* | Enable = 1* | RW = 1* | InEnMDROut = 0  | RegIn = 0  | PC_Increment = 0  | Done = 0 ----- Store
					//------------------------------------------------------------------------------------------------------------
	Four  = 4'b0100,// Four  | This state is waiting for MFC to be '1'
					//------------------------------------------------------------------------------------------------------------
	Five  = 4'b0101,// Five  | RegOut = 0  | MDR_inEn = 0  | Enable = 0  | RW = 0  | InEnMDROut = 1* | RegIn = 1* | PC_Increment = 0  | Done = 0
					//------------------------------------------------------------------------------------------------------------
	Six	  = 4'b0110,// Six   | RegOut = 0  | MDR_inEn = 0  | Enable = 0* | RW = 0* | InEnMDROut = 0* | RegIn = 0* | PC_Increment = 1* | Done = 0
					//------------------------------------------------------------------------------------------------------------	
	Seven = 4'b0111,// Seven | RegOut = 0  | MDR_inEn = 0  | Enable = 0  | RW = 0  | InEnMDROut = 0  | RegIn = 0  | PC_Increment = 0* | Done = 1*
					//------------------------------------------------------------------------------------------------------------
	Eight = 4'b1000,// Eight | RegOut = 0  | MDR_inEn = 0  | Enable = 0  | RW = 0  | InEnMDROut = 0  | RegIn = 0  | PC_Increment = 0  | Done = 0*
	Nine	= 4'b1001,
	Ten		= 4'b1010,
	Eleven	= 4'b1011,
	Twelve	= 4'b1100;

always@(posedge clk,  negedge clk)
begin
if (!reset) state <= Zero;
else /*if (clk)*/ state <= next_state;
end

always@(posedge clk, negedge clk)
begin
	case (state)
	Zero: 	if (start) next_state <= One;
			else next_state <= Zero;
	One: 	if (Load)next_state <= Two;
			else next_state <= Seven;
	Two: 	next_state <= Three; 			// Load 0		
	Three:  next_state <= Four;	 			// Load 0	
	Four: 	next_state <= Five;				// Load 1
	Five: 	next_state <= Six; 		 		// Load 2
	Six: 	if (MFC) next_state <= Nine;	// Load Hold
			else next_state <= Six;			
	Seven: 	next_state <= Eight;			// Store
	Eight: 	if (MFC) next_state <= Nine;	// Store Hold
			else next_state <= Eight;
	Nine: 	next_state <= Ten;
	Ten: 	next_state <= Eleven;
	Eleven: next_state <= Twelve;
	Twelve:	next_state <= Zero;
	endcase
end

always@(state)
	begin
		RegOut 			<= 1'b0;
		MDR_inEn		<= 1'b0;
		MAR_inEn		<= 1'b0;
		Enable			<= 1'b0;
		RW				<= 1'b0;
		InEnMDROut		<= 1'b0;
		OutEnMDROut		<= 1'b0;
		RegIn			<= 1'b0;
		PC_Increment	<= 1'b0;
		Done			<= 1'b0;
	// Outputs set to default values
	case (state)
		Zero: /* Empty State */ ;
		One: 	begin
					RegOut 			<= 1'b1;
				end
		Two:  	begin // Load 0
					RegOut 			<= 1'b1;
					MAR_inEn		<= 1'b1;
					RW				<= 1'b1;
					Enable			<= 1'b1;
				end
		Three:  	begin // Load Hold 0
					RegOut 			<= 1'b1;
					MAR_inEn		<= 1'b1;
					RW				<= 1'b1;
					Enable			<= 1'b1;
				end
		Four:  	begin // Load 1
					RegOut 			<= 1'b0;
					MAR_inEn		<= 1'b0;
					OutEnMDROut		<= 1'b1;
					InEnMDROut		<= 1'b1;
					RW				<= 1'b1;
					Enable			<= 1'b1;
				end	
		Five:  	begin // Load 2
					InEnMDROut		<= 1'b1;
					OutEnMDROut		<= 1'b1;
					RegIn			<= 1'b1;
					RW				<= 1'b1;
					Enable			<= 1'b1;
				end	
		Six:  	begin // Load 2 Hold
					InEnMDROut		<= 1'b1;
					OutEnMDROut		<= 1'b1;
					RegIn			<= 1'b1;
					RW				<= 1'b1;
					Enable			<= 1'b1;
				end	
		Seven: 	begin // Store
					RegOut 			<= 1'b1;
					MDR_inEn		<= 1'b1;
					Enable			<= 1'b1;
					RegIn			<= 1'b1;
				end
		Eight: 	begin // Wait Store
					RegOut 			<= 1'b1;
					MDR_inEn		<= 1'b1;
					Enable			<= 1'b1;
					RegIn			<= 1'b1;
				end
		Nine: 	begin // Turn it all off
					RegOut 			<= 1'b0;
					MDR_inEn		<= 1'b0;
					Enable			<= 1'b1;
					RegIn			<= 1'b0;
					InEnMDROut		<= 1'b0;
					OutEnMDROut		<= 1'b0;
					RW				<= 1'b0;
				end
		Ten : 	begin
					Enable			<= 1'b0;
					PC_Increment 	<= 1'b1;
				end
		Eleven: begin
					PC_Increment 	<= 1'b0;
					Done			<= 1'b1;
				end
		Twelve: begin
					Done			<= 1'b0;
				end
	endcase
	end
endmodule
