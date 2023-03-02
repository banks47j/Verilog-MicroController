
module PC_DW01_inc_0 ( A, SUM );
  input [15:0] A;
  output [15:0] SUM;

  wire   [15:2] carry;

  HADDX1 U1_1_14 ( .A0(A[14]), .B0(carry[14]), .C1(carry[15]), .SO(SUM[14]) );
  HADDX1 U1_1_13 ( .A0(A[13]), .B0(carry[13]), .C1(carry[14]), .SO(SUM[13]) );
  HADDX1 U1_1_12 ( .A0(A[12]), .B0(carry[12]), .C1(carry[13]), .SO(SUM[12]) );
  HADDX1 U1_1_11 ( .A0(A[11]), .B0(carry[11]), .C1(carry[12]), .SO(SUM[11]) );
  HADDX1 U1_1_10 ( .A0(A[10]), .B0(carry[10]), .C1(carry[11]), .SO(SUM[10]) );
  HADDX1 U1_1_9 ( .A0(A[9]), .B0(carry[9]), .C1(carry[10]), .SO(SUM[9]) );
  HADDX1 U1_1_8 ( .A0(A[8]), .B0(carry[8]), .C1(carry[9]), .SO(SUM[8]) );
  HADDX1 U1_1_7 ( .A0(A[7]), .B0(carry[7]), .C1(carry[8]), .SO(SUM[7]) );
  HADDX1 U1_1_6 ( .A0(A[6]), .B0(carry[6]), .C1(carry[7]), .SO(SUM[6]) );
  HADDX1 U1_1_5 ( .A0(A[5]), .B0(carry[5]), .C1(carry[6]), .SO(SUM[5]) );
  HADDX1 U1_1_4 ( .A0(A[4]), .B0(carry[4]), .C1(carry[5]), .SO(SUM[4]) );
  HADDX1 U1_1_3 ( .A0(A[3]), .B0(carry[3]), .C1(carry[4]), .SO(SUM[3]) );
  HADDX1 U1_1_2 ( .A0(A[2]), .B0(carry[2]), .C1(carry[3]), .SO(SUM[2]) );
  HADDX1 U1_1_1 ( .A0(A[1]), .B0(A[0]), .C1(carry[2]), .SO(SUM[1]) );
  INVX0 U1 ( .IN(A[0]), .QN(SUM[0]) );
  XOR2X1 U2 ( .IN1(carry[15]), .IN2(A[15]), .Q(SUM[15]) );
endmodule


module PC ( q, clk, reset, increment );
  output [15:0] q;
  input clk, reset, increment;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17,
         N18, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n70, n71;

  PC_DW01_inc_0 add_16 ( .A(q), .SUM({N18, N17, N16, N15, N14, N13, N12, N11, 
        N10, N9, N8, N7, N6, N5, N4, N3}) );
  DFFX1 \q_reg[15]  ( .D(n20), .CLK(clk), .Q(q[15]) );
  DFFX1 \q_reg[1]  ( .D(n34), .CLK(clk), .Q(q[1]) );
  DFFX1 \q_reg[2]  ( .D(n33), .CLK(clk), .Q(q[2]) );
  DFFX1 \q_reg[3]  ( .D(n32), .CLK(clk), .Q(q[3]) );
  DFFX1 \q_reg[4]  ( .D(n31), .CLK(clk), .Q(q[4]) );
  DFFX1 \q_reg[5]  ( .D(n30), .CLK(clk), .Q(q[5]) );
  DFFX1 \q_reg[6]  ( .D(n29), .CLK(clk), .Q(q[6]) );
  DFFX1 \q_reg[7]  ( .D(n28), .CLK(clk), .Q(q[7]) );
  DFFX1 \q_reg[8]  ( .D(n27), .CLK(clk), .Q(q[8]) );
  DFFX1 \q_reg[9]  ( .D(n26), .CLK(clk), .Q(q[9]) );
  DFFX1 \q_reg[10]  ( .D(n25), .CLK(clk), .Q(q[10]) );
  DFFX1 \q_reg[11]  ( .D(n24), .CLK(clk), .Q(q[11]) );
  DFFX1 \q_reg[12]  ( .D(n23), .CLK(clk), .Q(q[12]) );
  DFFX1 \q_reg[13]  ( .D(n22), .CLK(clk), .Q(q[13]) );
  DFFX1 \q_reg[14]  ( .D(n21), .CLK(clk), .Q(q[14]) );
  DFFX1 \q_reg[0]  ( .D(n35), .CLK(clk), .Q(q[0]) );
  ISOLANDX1 U39 ( .D(reset), .ISO(increment), .Q(n70) );
  ISOLANDX1 U40 ( .D(reset), .ISO(n70), .Q(n71) );
  AO22X1 U41 ( .IN1(q[0]), .IN2(n70), .IN3(N3), .IN4(n71), .Q(n35) );
  AO22X1 U42 ( .IN1(q[14]), .IN2(n70), .IN3(N17), .IN4(n71), .Q(n21) );
  AO22X1 U43 ( .IN1(q[13]), .IN2(n70), .IN3(N16), .IN4(n71), .Q(n22) );
  AO22X1 U44 ( .IN1(q[12]), .IN2(n70), .IN3(N15), .IN4(n71), .Q(n23) );
  AO22X1 U45 ( .IN1(q[11]), .IN2(n70), .IN3(N14), .IN4(n71), .Q(n24) );
  AO22X1 U46 ( .IN1(q[10]), .IN2(n70), .IN3(N13), .IN4(n71), .Q(n25) );
  AO22X1 U47 ( .IN1(q[9]), .IN2(n70), .IN3(N12), .IN4(n71), .Q(n26) );
  AO22X1 U48 ( .IN1(q[8]), .IN2(n70), .IN3(N11), .IN4(n71), .Q(n27) );
  AO22X1 U49 ( .IN1(q[7]), .IN2(n70), .IN3(N10), .IN4(n71), .Q(n28) );
  AO22X1 U50 ( .IN1(q[6]), .IN2(n70), .IN3(N9), .IN4(n71), .Q(n29) );
  AO22X1 U51 ( .IN1(q[5]), .IN2(n70), .IN3(N8), .IN4(n71), .Q(n30) );
  AO22X1 U52 ( .IN1(q[4]), .IN2(n70), .IN3(N7), .IN4(n71), .Q(n31) );
  AO22X1 U53 ( .IN1(q[3]), .IN2(n70), .IN3(N6), .IN4(n71), .Q(n32) );
  AO22X1 U54 ( .IN1(q[2]), .IN2(n70), .IN3(N5), .IN4(n71), .Q(n33) );
  AO22X1 U55 ( .IN1(q[1]), .IN2(n70), .IN3(N4), .IN4(n71), .Q(n34) );
  AO22X1 U56 ( .IN1(q[15]), .IN2(n70), .IN3(N18), .IN4(n71), .Q(n20) );
endmodule

