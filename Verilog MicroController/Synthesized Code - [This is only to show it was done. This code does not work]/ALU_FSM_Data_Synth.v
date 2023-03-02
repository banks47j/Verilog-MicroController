
module ImDataALU_OP ( ALU_in1, reg_out, ALU_in2, Reg_Dest, PC_Increment, Done, 
        reset, clk, start, ALU_OutEn, ALU_tsb_out );
  input reset, clk, start;
  output ALU_in1, reg_out, ALU_in2, Reg_Dest, PC_Increment, Done, ALU_OutEn,
         ALU_tsb_out;
  wire   N6, N7, N8, N9, n31, n32, n33, n34, reg_out, Reg_Dest, ALU_tsb_out,
         n71, n72, n74, n75, n77, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n94, n95, n96, n97;
  wire   [3:0] state;
  wire   [3:0] next_state;
  assign ALU_in2 = reg_out;
  assign PC_Increment = Reg_Dest;
  assign ALU_OutEn = ALU_tsb_out;

  DFFX1 \next_state_reg[1]  ( .D(n33), .CLK(clk), .Q(next_state[1]) );
  DFFX1 \next_state_reg[3]  ( .D(n31), .CLK(clk), .Q(next_state[3]) );
  DFFX1 \next_state_reg[2]  ( .D(n32), .CLK(clk), .Q(next_state[2]) );
  DFFX1 \next_state_reg[0]  ( .D(n34), .CLK(clk), .QN(n97) );
  DFFX1 \state_reg[2]  ( .D(N8), .CLK(clk), .Q(state[2]) );
  DFFX1 \state_reg[3]  ( .D(N9), .CLK(clk), .Q(state[3]), .QN(n95) );
  DFFX1 \state_reg[1]  ( .D(N7), .CLK(clk), .Q(state[1]), .QN(n94) );
  DFFX1 \state_reg[0]  ( .D(N6), .CLK(clk), .Q(state[0]), .QN(n96) );
  INVX0 U72 ( .IN(n80), .QN(n72) );
  NOR2X0 U73 ( .IN1(n97), .IN2(n71), .QN(N6) );
  NOR2X0 U74 ( .IN1(n87), .IN2(n91), .QN(ALU_tsb_out) );
  XNOR2X1 U75 ( .IN1(n83), .IN2(state[2]), .Q(n86) );
  NAND2X0 U76 ( .IN1(state[3]), .IN2(n85), .QN(n80) );
  NAND3X0 U77 ( .IN1(n96), .IN2(n94), .IN3(n86), .QN(n85) );
  AO22X1 U78 ( .IN1(n80), .IN2(n83), .IN3(next_state[1]), .IN4(n72), .Q(n33)
         );
  NAND2X0 U79 ( .IN1(state[0]), .IN2(n94), .QN(n91) );
  AO221X1 U80 ( .IN1(n77), .IN2(n84), .IN3(next_state[2]), .IN4(n72), .IN5(
        reg_out), .Q(n32) );
  INVX0 U81 ( .IN(n87), .QN(n77) );
  OAI21X1 U82 ( .IN1(n94), .IN2(state[0]), .IN3(n91), .QN(n83) );
  OAI22X1 U83 ( .IN1(n80), .IN2(n97), .IN3(n81), .IN4(n82), .QN(n34) );
  NAND2X0 U84 ( .IN1(n96), .IN2(n95), .QN(n82) );
  NOR3X0 U85 ( .IN1(start), .IN2(state[2]), .IN3(state[1]), .QN(n81) );
  NAND2X0 U86 ( .IN1(state[1]), .IN2(state[0]), .QN(n84) );
  NAND2X0 U87 ( .IN1(state[2]), .IN2(n95), .QN(n87) );
  NOR3X0 U88 ( .IN1(n90), .IN2(state[3]), .IN3(n86), .QN(Done) );
  ISOLANDX1 U89 ( .D(next_state[3]), .ISO(n71), .Q(N9) );
  ISOLANDX1 U90 ( .D(next_state[2]), .ISO(n71), .Q(N8) );
  ISOLANDX1 U91 ( .D(next_state[1]), .ISO(n71), .Q(N7) );
  AOI21X1 U92 ( .IN1(state[2]), .IN2(n83), .IN3(n75), .QN(n90) );
  INVX0 U93 ( .IN(n84), .QN(n75) );
  NOR3X0 U94 ( .IN1(state[2]), .IN2(state[3]), .IN3(n84), .QN(reg_out) );
  NAND2X0 U95 ( .IN1(n74), .IN2(n88), .QN(n31) );
  INVX0 U96 ( .IN(Done), .QN(n74) );
  NAND3X0 U97 ( .IN1(state[3]), .IN2(n89), .IN3(next_state[3]), .QN(n88) );
  NAND2X0 U98 ( .IN1(n90), .IN2(n86), .QN(n89) );
  INVX0 U99 ( .IN(reset), .QN(n71) );
  NOR3X0 U100 ( .IN1(n87), .IN2(state[0]), .IN3(n94), .QN(Reg_Dest) );
  NOR3X0 U101 ( .IN1(n91), .IN2(state[3]), .IN3(state[2]), .QN(ALU_in1) );
endmodule

