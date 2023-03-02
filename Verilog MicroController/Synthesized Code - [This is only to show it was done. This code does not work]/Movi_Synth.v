
module MOVI ( Reg_DestinEN, PC_Increment, Done, MoviStorage_out, reset, clk, 
        start );
  input reset, clk, start;
  output Reg_DestinEN, PC_Increment, Done, MoviStorage_out;
  wire   MoviStorage_out, \next_state[0] , N6, N7, N8, n22, n23, n24, n49, n52,
         n56, n57, n58, n59, n60, n61, n62, n63, n66, n67, n68, n69;
  wire   [2:0] state;
  assign Reg_DestinEN = MoviStorage_out;

  DFFX1 \next_state_reg[0]  ( .D(n24), .CLK(clk), .Q(\next_state[0] ) );
  DFFX1 \next_state_reg[1]  ( .D(n23), .CLK(clk), .QN(n68) );
  DFFX1 \next_state_reg[2]  ( .D(n22), .CLK(clk), .QN(n69) );
  DFFX1 \state_reg[0]  ( .D(N6), .CLK(clk), .Q(state[0]), .QN(n67) );
  DFFX1 \state_reg[2]  ( .D(N8), .CLK(clk), .Q(state[2]), .QN(n66) );
  DFFX1 \state_reg[1]  ( .D(N7), .CLK(clk), .Q(state[1]) );
  INVX0 U50 ( .IN(n59), .QN(PC_Increment) );
  NAND2X0 U51 ( .IN1(n63), .IN2(n67), .QN(n59) );
  NOR2X0 U52 ( .IN1(n69), .IN2(n49), .QN(N8) );
  NOR2X0 U53 ( .IN1(n68), .IN2(n49), .QN(N7) );
  INVX0 U54 ( .IN(n63), .QN(n52) );
  NOR2X0 U55 ( .IN1(n52), .IN2(n67), .QN(Done) );
  NOR2X0 U56 ( .IN1(n66), .IN2(state[1]), .QN(n63) );
  ISOLANDX1 U57 ( .D(\next_state[0] ), .ISO(n49), .Q(N6) );
  NAND3X0 U58 ( .IN1(n67), .IN2(n66), .IN3(state[1]), .QN(n58) );
  NAND4X0 U59 ( .IN1(n56), .IN2(n57), .IN3(n58), .IN4(n59), .QN(n24) );
  NAND4X0 U60 ( .IN1(state[0]), .IN2(\next_state[0] ), .IN3(state[1]), .IN4(
        state[2]), .QN(n57) );
  NAND3X0 U61 ( .IN1(n67), .IN2(n66), .IN3(start), .QN(n56) );
  NAND2X0 U62 ( .IN1(n52), .IN2(n61), .QN(n22) );
  NAND3X0 U63 ( .IN1(state[1]), .IN2(n62), .IN3(state[0]), .QN(n61) );
  NAND2X0 U64 ( .IN1(state[2]), .IN2(n69), .QN(n62) );
  OAI21X1 U65 ( .IN1(n60), .IN2(n67), .IN3(n58), .QN(n23) );
  OA21X1 U66 ( .IN1(n66), .IN2(n68), .IN3(state[1]), .Q(n60) );
  INVX0 U67 ( .IN(reset), .QN(n49) );
  AO21X1 U68 ( .IN1(state[1]), .IN2(n66), .IN3(PC_Increment), .Q(
        MoviStorage_out) );
endmodule

