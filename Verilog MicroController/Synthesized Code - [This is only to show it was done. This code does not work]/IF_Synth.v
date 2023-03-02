
module IFetch ( PC_Out, MAR_inEn, RW, Enable, InEnMDR_Out, OutEnMDR_Out, IR_in, 
        reset, clk, Done, MFC );
  input reset, clk, Done, MFC;
  output PC_Out, MAR_inEn, RW, Enable, InEnMDR_Out, OutEnMDR_Out, IR_in;
  wire   PC_Out, RW, IR_in, N14, N15, N16, N46, N47, N48, n24, n25, n26, n42,
         n43, n44, n45, n49, n50, n51, n52, n53, n54, n55, n56;
  wire   [3:0] state;
  assign MAR_inEn = PC_Out;
  assign Enable = RW;
  assign OutEnMDR_Out = IR_in;
  assign InEnMDR_Out = IR_in;

  DFFX1 \next_state_reg[2]  ( .D(N48), .CLK(clk), .QN(n24) );
  DFFX1 \next_state_reg[0]  ( .D(N46), .CLK(clk), .QN(n26) );
  DFFX1 \next_state_reg[1]  ( .D(N47), .CLK(clk), .QN(n25) );
  DFFX1 \state_reg[0]  ( .D(N14), .CLK(clk), .Q(state[0]), .QN(n56) );
  DFFX1 \state_reg[2]  ( .D(N16), .CLK(clk), .Q(state[2]), .QN(n55) );
  DFFX1 \state_reg[1]  ( .D(N15), .CLK(clk), .Q(state[1]), .QN(n54) );
  INVX0 U47 ( .IN(n52), .QN(n43) );
  OA21X1 U48 ( .IN1(n56), .IN2(n54), .IN3(state[2]), .Q(IR_in) );
  NOR2X0 U49 ( .IN1(Done), .IN2(n55), .QN(n52) );
  NOR2X0 U50 ( .IN1(n54), .IN2(state[2]), .QN(RW) );
  AO222X1 U51 ( .IN1(n52), .IN2(state[1]), .IN3(n53), .IN4(n56), .IN5(RW), 
        .IN6(n44), .Q(N46) );
  NAND3X0 U52 ( .IN1(n54), .IN2(n55), .IN3(n42), .QN(n53) );
  AO22X1 U53 ( .IN1(state[1]), .IN2(n56), .IN3(state[0]), .IN4(n50), .Q(N47)
         );
  NAND3X0 U54 ( .IN1(n51), .IN2(n43), .IN3(state[1]), .QN(n50) );
  NAND2X0 U55 ( .IN1(n44), .IN2(n55), .QN(n51) );
  NAND3X0 U56 ( .IN1(n43), .IN2(n45), .IN3(n49), .QN(N48) );
  INVX0 U57 ( .IN(IR_in), .QN(n45) );
  NAND3X0 U58 ( .IN1(RW), .IN2(state[0]), .IN3(MFC), .QN(n49) );
  NOR2X0 U59 ( .IN1(n24), .IN2(n42), .QN(N16) );
  NOR2X0 U60 ( .IN1(n42), .IN2(n25), .QN(N15) );
  NOR2X0 U61 ( .IN1(n42), .IN2(n26), .QN(N14) );
  INVX0 U62 ( .IN(reset), .QN(n42) );
  INVX0 U63 ( .IN(MFC), .QN(n44) );
  AND3X1 U64 ( .IN1(state[0]), .IN2(n55), .IN3(n54), .Q(PC_Out) );
endmodule

