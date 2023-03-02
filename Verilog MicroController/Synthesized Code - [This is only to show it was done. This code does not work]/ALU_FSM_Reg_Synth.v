
module RegALU_OP ( reg1_out, ALU_in1, reg2_out, ALU_in2, Reg_Dest, 
        PC_Increment, Done, reset, clk, start, ALU_OutEn, ALU_tsb_out );
  input reset, clk, start;
  output reg1_out, ALU_in1, reg2_out, ALU_in2, Reg_Dest, PC_Increment, Done,
         ALU_OutEn, ALU_tsb_out;
  wire   reg1_out, ALU_OutEn, N6, N7, N8, N9, n25, n26, n27, n28, reg2_out,
         n54, Reg_Dest, n56, n57, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74;
  wire   [3:0] state;
  wire   [3:0] next_state;
  assign ALU_in1 = reg1_out;
  assign ALU_tsb_out = ALU_OutEn;
  assign ALU_in2 = reg2_out;
  assign PC_Increment = Reg_Dest;

  DFFX1 \next_state_reg[1]  ( .D(n27), .CLK(clk), .Q(next_state[1]) );
  DFFX1 \next_state_reg[2]  ( .D(n25), .CLK(clk), .Q(next_state[2]) );
  DFFX1 \next_state_reg[3]  ( .D(n26), .CLK(clk), .Q(next_state[3]) );
  DFFX1 \next_state_reg[0]  ( .D(n28), .CLK(clk), .Q(next_state[0]), .QN(n74)
         );
  DFFX1 \state_reg[2]  ( .D(N8), .CLK(clk), .Q(state[2]), .QN(n73) );
  DFFX1 \state_reg[1]  ( .D(N7), .CLK(clk), .Q(state[1]), .QN(n71) );
  DFFX1 \state_reg[3]  ( .D(N9), .CLK(clk), .Q(state[3]), .QN(n72) );
  DFFX1 \state_reg[0]  ( .D(N6), .CLK(clk), .Q(state[0]) );
  NAND2X0 U62 ( .IN1(n73), .IN2(n71), .QN(n67) );
  ISOLANDX1 U63 ( .D(n62), .ISO(n71), .Q(ALU_OutEn) );
  NOR2X0 U64 ( .IN1(n74), .IN2(n54), .QN(N6) );
  INVX0 U65 ( .IN(n66), .QN(n57) );
  INVX0 U66 ( .IN(Done), .QN(n56) );
  INVX0 U67 ( .IN(n63), .QN(Reg_Dest) );
  NAND2X0 U68 ( .IN1(ALU_OutEn), .IN2(state[0]), .QN(n63) );
  NOR2X0 U69 ( .IN1(n73), .IN2(state[3]), .QN(n62) );
  AO222X1 U70 ( .IN1(next_state[2]), .IN2(n57), .IN3(n62), .IN4(n70), .IN5(
        reg1_out), .IN6(state[0]), .Q(n25) );
  NAND2X0 U71 ( .IN1(state[1]), .IN2(state[0]), .QN(n70) );
  NAND2X0 U72 ( .IN1(state[3]), .IN2(n67), .QN(n66) );
  AO22X1 U73 ( .IN1(next_state[1]), .IN2(n57), .IN3(n68), .IN4(n72), .Q(n27)
         );
  XOR2X1 U74 ( .IN1(state[1]), .IN2(state[0]), .Q(n68) );
  NOR3X0 U75 ( .IN1(n67), .IN2(state[0]), .IN3(n72), .QN(Done) );
  ISOLANDX1 U76 ( .D(next_state[2]), .ISO(n54), .Q(N8) );
  ISOLANDX1 U77 ( .D(next_state[3]), .ISO(n54), .Q(N9) );
  ISOLANDX1 U78 ( .D(next_state[1]), .ISO(n54), .Q(N7) );
  NOR3X0 U79 ( .IN1(state[2]), .IN2(state[3]), .IN3(n71), .QN(reg1_out) );
  NAND3X0 U80 ( .IN1(n56), .IN2(n63), .IN3(n69), .QN(n26) );
  NAND2X0 U81 ( .IN1(next_state[3]), .IN2(n57), .QN(n69) );
  OAI221X1 U82 ( .IN1(n64), .IN2(n65), .IN3(n66), .IN4(n74), .IN5(n56), .QN(
        n28) );
  NOR2X0 U83 ( .IN1(start), .IN2(n67), .QN(n64) );
  OR2X1 U84 ( .IN1(state[0]), .IN2(state[3]), .Q(n65) );
  INVX0 U85 ( .IN(reset), .QN(n54) );
  AND3X1 U86 ( .IN1(n62), .IN2(n71), .IN3(state[0]), .Q(reg2_out) );
endmodule

