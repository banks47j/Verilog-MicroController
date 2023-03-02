
module Load_Store ( RegOut, MDR_inEn, MAR_inEn, Enable, RW, InEnMDROut, 
        OutEnMDROut, RegIn, PC_Increment, Done, reset, clk, start, MFC, Load
 );
  input reset, clk, start, MFC, Load;
  output RegOut, MDR_inEn, MAR_inEn, Enable, RW, InEnMDROut, OutEnMDROut,
         RegIn, PC_Increment, Done;
  wire   N15, N16, N17, N18, n38, n39, n40, n41, n92, n93, n95, n96, n98, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130;
  wire   [3:0] state;
  wire   [3:0] next_state;
  assign InEnMDROut = 1'b0;

  DFFX1 \next_state_reg[1]  ( .D(n39), .CLK(clk), .Q(next_state[1]) );
  DFFX1 \next_state_reg[2]  ( .D(n38), .CLK(clk), .Q(next_state[2]) );
  DFFX1 \next_state_reg[3]  ( .D(n40), .CLK(clk), .Q(next_state[3]) );
  DFFX1 \next_state_reg[0]  ( .D(n41), .CLK(clk), .Q(next_state[0]), .QN(n130)
         );
  DFFX1 \state_reg[3]  ( .D(N18), .CLK(clk), .Q(state[3]), .QN(n127) );
  DFFX1 \state_reg[2]  ( .D(N17), .CLK(clk), .Q(state[2]), .QN(n128) );
  DFFX1 \state_reg[0]  ( .D(N15), .CLK(clk), .Q(state[0]) );
  DFFX1 \state_reg[1]  ( .D(N16), .CLK(clk), .Q(state[1]), .QN(n129) );
  NAND2X0 U100 ( .IN1(n96), .IN2(n98), .QN(n115) );
  OR2X1 U101 ( .IN1(MDR_inEn), .IN2(RW), .Q(Enable) );
  INVX0 U102 ( .IN(n124), .QN(MDR_inEn) );
  INVX0 U103 ( .IN(n104), .QN(OutEnMDROut) );
  NOR2X0 U104 ( .IN1(n130), .IN2(n92), .QN(N15) );
  INVX0 U105 ( .IN(n122), .QN(n98) );
  INVX0 U106 ( .IN(n126), .QN(n96) );
  INVX0 U107 ( .IN(n108), .QN(n95) );
  OA21X1 U108 ( .IN1(n123), .IN2(n111), .IN3(n115), .Q(n124) );
  NAND2X0 U109 ( .IN1(n98), .IN2(n126), .QN(n104) );
  AO21X1 U110 ( .IN1(n98), .IN2(n116), .IN3(MDR_inEn), .Q(RegIn) );
  NOR2X0 U111 ( .IN1(n111), .IN2(n126), .QN(Done) );
  NAND2X0 U112 ( .IN1(n105), .IN2(n104), .QN(RW) );
  INVX0 U113 ( .IN(n105), .QN(MAR_inEn) );
  NAND2X0 U114 ( .IN1(state[1]), .IN2(state[0]), .QN(n126) );
  NAND2X0 U115 ( .IN1(state[3]), .IN2(n128), .QN(n111) );
  NAND2X0 U116 ( .IN1(state[2]), .IN2(n127), .QN(n122) );
  NAND2X0 U117 ( .IN1(state[1]), .IN2(n93), .QN(n112) );
  NAND3X0 U118 ( .IN1(state[2]), .IN2(n123), .IN3(state[3]), .QN(n108) );
  AO221X1 U119 ( .IN1(n96), .IN2(n128), .IN3(next_state[2]), .IN4(n95), .IN5(
        n120), .Q(n38) );
  OAI21X1 U120 ( .IN1(n121), .IN2(n122), .IN3(n106), .QN(n120) );
  OA21X1 U121 ( .IN1(state[0]), .IN2(MFC), .IN3(state[1]), .Q(n121) );
  AO221X1 U122 ( .IN1(n116), .IN2(n128), .IN3(next_state[1]), .IN4(n95), .IN5(
        n117), .Q(n39) );
  NAND2X0 U123 ( .IN1(n118), .IN2(n119), .QN(n117) );
  OR3X1 U124 ( .IN1(state[0]), .IN2(state[3]), .IN3(n112), .Q(n118) );
  NAND3X0 U125 ( .IN1(n129), .IN2(n127), .IN3(state[0]), .QN(n119) );
  XOR2X1 U126 ( .IN1(state[0]), .IN2(state[1]), .Q(n116) );
  ISOLANDX1 U127 ( .D(next_state[2]), .ISO(n92), .Q(N17) );
  ISOLANDX1 U128 ( .D(next_state[1]), .ISO(n92), .Q(N16) );
  ISOLANDX1 U129 ( .D(next_state[3]), .ISO(n92), .Q(N18) );
  OAI222X1 U130 ( .IN1(state[2]), .IN2(n106), .IN3(state[0]), .IN4(n107), 
        .IN5(n108), .IN6(n130), .QN(n41) );
  OA222X1 U131 ( .IN1(state[2]), .IN2(n129), .IN3(n109), .IN4(n110), .IN5(n111), .IN6(n93), .Q(n107) );
  NOR2X0 U132 ( .IN1(start), .IN2(state[2]), .QN(n109) );
  NAND2X0 U133 ( .IN1(n112), .IN2(n127), .QN(n110) );
  OR2X1 U134 ( .IN1(state[1]), .IN2(state[0]), .Q(n123) );
  OR2X1 U135 ( .IN1(Load), .IN2(n119), .Q(n106) );
  NAND4X0 U136 ( .IN1(n113), .IN2(n114), .IN3(n111), .IN4(n115), .QN(n40) );
  NAND3X0 U137 ( .IN1(n98), .IN2(state[1]), .IN3(MFC), .QN(n114) );
  NAND2X0 U138 ( .IN1(next_state[3]), .IN2(n95), .QN(n113) );
  INVX0 U139 ( .IN(reset), .QN(n92) );
  INVX0 U140 ( .IN(MFC), .QN(n93) );
  NAND3X0 U141 ( .IN1(n128), .IN2(n127), .IN3(state[1]), .QN(n105) );
  NAND3X0 U142 ( .IN1(n124), .IN2(n105), .IN3(n125), .QN(RegOut) );
  NAND3X0 U143 ( .IN1(n128), .IN2(n127), .IN3(state[0]), .QN(n125) );
  NOR3X0 U144 ( .IN1(n111), .IN2(state[0]), .IN3(n129), .QN(PC_Increment) );
endmodule

