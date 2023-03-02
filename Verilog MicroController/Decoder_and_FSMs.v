// Decoder and FSM Top Level
// SS&M Final
// Johnathan Banks
//*******************************************************

module Decoder(reset, clk, MFC, Input_Data, 
				PC_Increment, RW, Enable, InEnMDR_Out, OutEnMDR_Out,
				ALU_in1, ALU_in2, R0out_en, R1out_en, 
				R2out_en, PC_Out, IR_in, 
				MAR_inEn, MDR_inEn, R0in_en, R1in_en, R2in_en, ALU_OutEn, ALU_tsb_out, OpCode, P0out_en, P1out_en, P0in_en, MoviToBus);
// Inputs
	input			reset, clk, MFC;		
	input	[15:0]	Input_Data;		// This is what is getting decoded.		
//outputs
	output reg		PC_Increment, RW, Enable, InEnMDR_Out, OutEnMDR_Out, ALU_in1, ALU_in2, R0in_en, R1in_en, R2in_en;	
	output reg		R0out_en, R1out_en, R2out_en, P0out_en, P1out_en, P0in_en, ALU_OutEn, ALU_tsb_out, MAR_inEn; 		
	output wire		PC_Out, IR_in, MDR_inEn;	
	output reg [3:0] OpCode;	
	output reg [15:0] MoviToBus;


//*******************************************************************************************
// Handle Movi Number Output to bus
//*******************************************************************************************
	wire MoviStorage_out; // Signal from Movi to output stored data to bus
	reg [15:0] MoviStorage;
always @(posedge clk)
	begin
		if (MoviStorage_out) 	MoviToBus = MoviStorage;
		else 					MoviToBus = 16'bz;			
	end


// Notes
// IR_in is the input enable to the Instruction Register, when it asserts 1, the Instruction Register 
// 		will take the information from bus, then send that to the decoder as the variable Input_Data.
//		@(Input_Data) should be able to trigger the decoder, I think.

//*******************************************************************************************
//Create internal 'Done' Signal that starts IF and comes from other FSMs
//*******************************************************************************************
reg  Done;
wire Done_RegALU, Done_ImmALU, Done_Mov, Done_Movi, Done_LoadStore;
always @(posedge (Done_RegALU || Done_ImmALU || Done_Mov || Done_Movi || Done_LoadStore), 
		 negedge (Done_RegALU || Done_ImmALU || Done_Mov || Done_Movi || Done_LoadStore)) 
	begin
		Done = (Done_RegALU || Done_ImmALU || Done_Mov || Done_Movi || Done_LoadStore);
	end
	
//*******************************************************************************************
// Push Values from different FSMs to output of this module level
//*******************************************************************************************
wire PC_Increment_RegALU, PC_Increment_ImmALU, PC_Increment_Mov, PC_Increment_Movi, PC_Increment_LoadStore;
always @(posedge (PC_Increment_RegALU || PC_Increment_ImmALU || PC_Increment_Mov || 
							PC_Increment_Movi || PC_Increment_LoadStore), 
		 negedge (PC_Increment_RegALU || PC_Increment_ImmALU || PC_Increment_Mov || 
							PC_Increment_Movi || PC_Increment_LoadStore)) 
	begin
		PC_Increment = (PC_Increment_RegALU || PC_Increment_ImmALU || PC_Increment_Mov 
								|| PC_Increment_Movi || PC_Increment_LoadStore);
	end

wire RW_IFetch, RW_LoadStore;
always @(posedge (RW_IFetch || RW_LoadStore), 
		 negedge (RW_IFetch || RW_LoadStore))
	begin
		RW = (RW_IFetch || RW_LoadStore);
	end
	
wire Enable_IFetch, Enable_LoadStore;
always @(posedge (Enable_IFetch || Enable_LoadStore), 
		 negedge (Enable_IFetch || Enable_LoadStore))
	begin
		Enable = (Enable_IFetch || Enable_LoadStore);
	end
	
wire InEnMDR_Out_IFetch, InEnMDR_Out_LoadStore;
always @(posedge (InEnMDR_Out_IFetch || InEnMDR_Out_LoadStore), 
		 negedge (InEnMDR_Out_IFetch || InEnMDR_Out_LoadStore))
	begin
		InEnMDR_Out = (InEnMDR_Out_IFetch || InEnMDR_Out_LoadStore);
	end
	
wire OutEnMDR_Out_IFetch, OutEnMDR_Out_LoadStore;
always @(posedge (OutEnMDR_Out_IFetch || OutEnMDR_Out_LoadStore), 
		 negedge (OutEnMDR_Out_IFetch || OutEnMDR_Out_LoadStore))
	begin
		OutEnMDR_Out = (OutEnMDR_Out_IFetch || OutEnMDR_Out_LoadStore);
	end

wire ALU_in1_Reg, ALU_in2_Reg, ALU_in1_Data, ALU_in2_Data, ALU_OutEn_Reg, ALU_OutEn_Data, ALU_tsb_out_Data, ALU_tsb_out_Reg ;
always @(posedge (ALU_in1_Reg || ALU_in1_Data),
		 negedge (ALU_in1_Reg || ALU_in1_Data))
	begin
		ALU_in1 = (ALU_in1_Reg || ALU_in1_Data);
	end
	
always @(posedge (ALU_in2_Reg || ALU_in2_Data),
		 negedge (ALU_in2_Reg || ALU_in2_Data))
	begin
		ALU_in2 = (ALU_in2_Reg || ALU_in2_Data);
	end

always @(posedge (ALU_OutEn_Reg || ALU_OutEn_Data), 
		 negedge (ALU_OutEn_Reg || ALU_OutEn_Data))
	begin
		ALU_OutEn = (ALU_OutEn_Reg || ALU_OutEn_Data);
	end

always @(posedge (ALU_tsb_out_Data || ALU_tsb_out_Reg), 
		 negedge (ALU_tsb_out_Data || ALU_tsb_out_Reg))
	begin
		ALU_tsb_out = (ALU_tsb_out_Data || ALU_tsb_out_Reg);
	end


wire MAR_inEn_IF, MAR_inEn_LS;
always @(posedge (MAR_inEn_IF || MAR_inEn_LS),
		 negedge (MAR_inEn_IF || MAR_inEn_LS))
	begin
		MAR_inEn = (MAR_inEn_IF || MAR_inEn_LS);
	end

// Register Selection Register
reg [2:0] registerSelect1, registerSelect2;

// Register Output Enables
wire reg1_out_ALU_Reg, reg2_out_ALU_Reg, reg_out_ALU_Data, reg_out_MOV, reg_out_LoadStore;
always @(posedge (reg1_out_ALU_Reg || reg2_out_ALU_Reg || reg_out_ALU_Data || reg_out_MOV || reg_out_LoadStore), 
		 negedge (reg1_out_ALU_Reg || reg2_out_ALU_Reg || reg_out_ALU_Data || reg_out_MOV || reg_out_LoadStore))
	begin
		case(registerSelect1)
			3'b000: 	begin
						if(reg1_out_ALU_Reg || reg_out_ALU_Data || reg_out_LoadStore) R0out_en = 1;
						else R0out_en = 0;
					end
			3'b001: begin
						if(reg1_out_ALU_Reg || reg_out_ALU_Data || reg_out_LoadStore) R1out_en = 1;
						else R1out_en = 0;
					end
			3'b010: begin
						if(reg1_out_ALU_Reg || reg_out_ALU_Data || reg_out_LoadStore) R2out_en = 1;
						else R2out_en = 0;
					end
			3'b011: begin
						if(reg1_out_ALU_Reg || reg_out_ALU_Data || reg_out_LoadStore) P0out_en = 1;
						else P0out_en = 0;
					end
			3'b100: begin
						if(reg1_out_ALU_Reg || reg_out_ALU_Data || reg_out_LoadStore) P1out_en = 1;
						else P1out_en = 0;
					end
		endcase
		case(registerSelect2)
			3'b000: 	begin
						if(reg2_out_ALU_Reg || reg_out_MOV) R0out_en = 1;
						else R0out_en = 0;
					end
			3'b001: begin
						if(reg2_out_ALU_Reg || reg_out_MOV) R1out_en = 1;
						else R1out_en = 0;
					end
			3'b010: begin
						if(reg2_out_ALU_Reg || reg_out_MOV) R2out_en = 1;
						else R2out_en = 0;
					end
			3'b011: begin
						if(reg2_out_ALU_Reg || reg_out_MOV) P0out_en = 1;
						else P0out_en = 0;
					end
			3'b100: begin
						if(reg2_out_ALU_Reg || reg_out_MOV) P1out_en = 1;
						else P1out_en = 0;
					end
		endcase
	end

// Register Input Enables
wire RegIn_ALU_Reg, RegIn_ALU_Data, RegIn_MOV, RegIn_MOVI, RegIn_LoadStore;
always @(posedge (RegIn_ALU_Reg || RegIn_ALU_Data || RegIn_MOV || RegIn_MOVI), 
		 negedge (RegIn_ALU_Reg || RegIn_ALU_Data || RegIn_MOV || RegIn_MOVI))
	begin
		case(registerSelect1)
			3'b000: 	begin
						if(RegIn_ALU_Reg || RegIn_ALU_Data || RegIn_MOV || RegIn_MOVI || RegIn_LoadStore) R0in_en = 1;
						else R0in_en = 0;
					end
			3'b001: begin
						if(RegIn_ALU_Reg || RegIn_ALU_Data || RegIn_MOV || RegIn_MOVI || RegIn_LoadStore) R1in_en = 1;
						else R1in_en = 0;
					end
			3'b010: begin
						if(RegIn_ALU_Reg || RegIn_ALU_Data || RegIn_MOV || RegIn_MOVI || RegIn_LoadStore) R2in_en = 1;
						else R2in_en = 0;
					end
			3'b011: begin
						if(RegIn_ALU_Reg || RegIn_ALU_Data || RegIn_MOV || RegIn_MOVI || RegIn_LoadStore) P0in_en = 1;
						else P0in_en = 0;
					end					
		endcase
	end
	
always @(posedge RegIn_LoadStore, negedge RegIn_LoadStore)
	begin
		case(registerSelect2)
			3'b000: 	begin
						if(RegIn_LoadStore) R0in_en = 1;
						else R0in_en = 0;
					end
			3'b001: begin
						if(RegIn_LoadStore) R1in_en = 1;
						else R1in_en = 0;
					end
			3'b010: begin
						if(RegIn_LoadStore) R2in_en = 1;
						else R2in_en = 0;
					end
			3'b011: begin
						if(RegIn_LoadStore) P0in_en = 1;
						else P0in_en = 0;
					end					
		endcase
	end

reg start_regALU, start_dataALU, start_MOV, start_MOVI, Start_LS;
// Make the Decoder
// reg [3:0] OpCode; // Moved to top of file and made output
reg [5:0] para1;
reg [5:0] para2;

wire [9:0]  Zeros;
assign Zeros = 10'b0000000000;
reg Load;
always @(Input_Data)
	begin
		OpCode	= Input_Data[15:12];
		para1	= Input_Data[11:6];
		para2	= Input_Data[5:0];
		
		// Op Code Decoder
		case (OpCode)
			4'b0000: start_regALU  = 1; //Add
			4'b0001: start_regALU  = 1; //Subtract
			4'b0010: start_regALU  = 1; //Logical NOT
			4'b0011: start_regALU  = 1; //Logical NOT
			4'b0100: start_regALU  = 1; //Logical AND
			4'b0101: start_regALU  = 1; //Logical OR
			4'b0110: start_regALU  = 1; //Logical XOR
			4'b0111: start_regALU  = 1;	//Logical XNOR
			4'b1000: start_dataALU = 1;	//Addi
			4'b1001: start_dataALU = 1; //Subi
			4'b1010: start_MOV	   = 1; //MOV
			4'b1011: begin
						start_MOVI 		= 1; //MOVI
						MoviStorage		= { Zeros, para2 };
					end
			4'b1100: begin 				//Load
						Start_LS = 1;   
						Load	 = 1;
					 end
			4'b1101: begin				//Store
						Start_LS = 1; 
						Load	 = 0;
					 end
			default: begin
						start_regALU	= 0;
						start_dataALU	= 0;
						start_MOV		= 0;
						start_MOVI		= 0;
						Start_LS		= 0;
						Load			= 0;
					 end
		endcase
		// Register Decoders
		case (para1)
			6'b000000: registerSelect1 = 3'b000; // Register 0
			6'b000001: registerSelect1 = 3'b001; // Register 1
			6'b000010: registerSelect1 = 3'b010; // Register 2
			6'b000011: registerSelect1 = 3'b011; // Port 0
			6'b000100: registerSelect1 = 3'b100; // Port 1
		endcase
		case (para2)
			6'b000000: registerSelect2 = 3'b000; // Register 0
			6'b000001: registerSelect2 = 3'b001; // Register 1
			6'b000010: registerSelect2 = 3'b010; // Register 2
			6'b000011: registerSelect2 = 3'b011; // Port 0
			6'b000100: registerSelect2 = 3'b100; // Port 1
		endcase
	end	
	
always@(Done)
	begin
		start_regALU	= 0;
		start_dataALU	= 0;
		start_MOV		= 0;
		start_MOVI		= 0;
		Start_LS		= 0;
		Load			= 0;
	end

// Instantiate FSMs
IFetch 			iFetch 		(	.clk			(clk), 					// These comments mean that they are coded.
								.reset			(reset), 				//
								.Done			(Done), 				//
								.MFC			(MFC),					//
								.PC_Out			(PC_Out),				//
								.MAR_inEn		(MAR_inEn_IF),			//
								.RW				(RW_IFetch),			//
								.Enable			(Enable_IFetch),		//
								.InEnMDR_Out 	(InEnMDR_Out_IFetch), 	//
								.OutEnMDR_Out	(OutEnMDR_Out_IFetch),
								.IR_in			(IR_in));				//

RegALU_OP 		regALU_OP 	(	.clk			(clk),					//
								.reset			(reset),				//
								.start			(start_regALU),			//
								.ALU_OutEn		(ALU_OutEn_Reg),		//
								.ALU_tsb_out	(ALU_tsb_out_Reg),		//
								.reg1_out		(reg1_out_ALU_Reg),		//
								.ALU_in1		(ALU_in1_Reg),			//
								.reg2_out		(reg2_out_ALU_Reg),		//
								.ALU_in2		(ALU_in2_Reg),			//
								.Reg_Dest		(RegIn_ALU_Reg),		//
								.PC_Increment	(PC_Increment_RegALU),	//
								.Done			(Done_RegALU));			//

ImDataALU_OP	imDataALU	(	.clk			(clk),					//
								.reset			(reset),				//
								.start			(start_dataALU),		//
								.ALU_OutEn		(ALU_OutEn_Data),		//
								.ALU_tsb_out	(ALU_tsb_out_Data),		//
								.ALU_in1		(ALU_in1_Data),			//
								.reg_out		(reg_out_ALU_Data),		//
								.ALU_in2		(ALU_in2_Data),			//
								.Reg_Dest		(RegIn_ALU_Data),		//
								.PC_Increment	(PC_Increment_ImmALU),	//
								.Done			(Done_ImmALU));			//

MOV 			mov	 		(	.clk			(clk),					//
								.reset			(reset),				//
								.start			(start_MOV),			//
								.reg_outEn		(reg_out_MOV),			//
								.Reg_DestinEN	(RegIn_MOV),			//
								.PC_Increment	(PC_Increment_Mov),		//
								.Done			(Done_Mov));			//

MOVI 			movi	 	(	.clk			(clk),					//
								.reset			(reset),				//
								.start			(start_MOVI),			//
								.Reg_DestinEN	(RegIn_MOVI),			//
								.PC_Increment	(PC_Increment_Movi),	//
								.Done			(Done_Movi),
								.MoviStorage_out (MoviStorage_out));	//
								

Load_Store		loadstore	(	.clk			(clk),						//
								.reset			(reset),					//
								.start			(Start_LS),					//
								.MFC			(MFC),						//
								.Load			(Load),						//
								.RegOut			(reg_out_LoadStore),		//
								.MDR_inEn		(MDR_inEn),					//
								.MAR_inEn		(MAR_inEn_LS),				//
								.Enable			(Enable_LoadStore),			//
								.RW				(RW_LoadStore),				//
								.InEnMDROut 	(InEnMDR_Out_LoadStore),	//
								.OutEnMDROut	(OutEnMDR_Out_LoadStore),
								.RegIn			(RegIn_LoadStore),			//
								.PC_Increment	(PC_Increment_LoadStore),	//
								.Done			(Done_LoadStore));			//
endmodule