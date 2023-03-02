
module DFF ( in, clk, reset, in_en, q );
  input [15:0] in;
  output [15:0] q;
  input clk, reset, in_en;
  wire   N20, N23, N26, N29, N32, N35, N38, N41, N44, N47, N50, N53, N56, N59,
         N62, N65, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n152, n153, n170, n171, n172, n173, n174, n175, n176, n177, n178;
  tri   [15:0] q;

  TNBUFFHX1 \q_tri[0]  ( .IN(n114), .ENB(n50), .Q(q[0]) );
  TNBUFFHX1 \q_tri[1]  ( .IN(n113), .ENB(n48), .Q(q[1]) );
  TNBUFFHX1 \q_tri[2]  ( .IN(n112), .ENB(n46), .Q(q[2]) );
  TNBUFFHX1 \q_tri[3]  ( .IN(n111), .ENB(n44), .Q(q[3]) );
  TNBUFFHX1 \q_tri[4]  ( .IN(n110), .ENB(n42), .Q(q[4]) );
  TNBUFFHX1 \q_tri[5]  ( .IN(n109), .ENB(n40), .Q(q[5]) );
  TNBUFFHX1 \q_tri[6]  ( .IN(n108), .ENB(n38), .Q(q[6]) );
  TNBUFFHX1 \q_tri[7]  ( .IN(n107), .ENB(n36), .Q(q[7]) );
  TNBUFFHX1 \q_tri[8]  ( .IN(n106), .ENB(n34), .Q(q[8]) );
  TNBUFFHX1 \q_tri[9]  ( .IN(n105), .ENB(n32), .Q(q[9]) );
  TNBUFFHX1 \q_tri[10]  ( .IN(n104), .ENB(n30), .Q(q[10]) );
  TNBUFFHX1 \q_tri[11]  ( .IN(n103), .ENB(n28), .Q(q[11]) );
  TNBUFFHX1 \q_tri[12]  ( .IN(n102), .ENB(n26), .Q(q[12]) );
  TNBUFFHX1 \q_tri[13]  ( .IN(n101), .ENB(n24), .Q(q[13]) );
  TNBUFFHX1 \q_tri[14]  ( .IN(n100), .ENB(n22), .Q(q[14]) );
  TNBUFFHX1 \q_tri[15]  ( .IN(n99), .ENB(n20), .Q(q[15]) );
  DFFX1 \q_tri_enable_reg[15]  ( .D(n97), .CLK(clk), .Q(N20), .QN(n20) );
  DFFX1 \q_tri_enable_reg[14]  ( .D(n95), .CLK(clk), .Q(N23), .QN(n22) );
  DFFX1 \q_tri_enable_reg[13]  ( .D(n93), .CLK(clk), .Q(N26), .QN(n24) );
  DFFX1 \q_tri_enable_reg[12]  ( .D(n91), .CLK(clk), .Q(N29), .QN(n26) );
  DFFX1 \q_tri_enable_reg[11]  ( .D(n89), .CLK(clk), .Q(N32), .QN(n28) );
  DFFX1 \q_tri_enable_reg[10]  ( .D(n87), .CLK(clk), .Q(N35), .QN(n30) );
  DFFX1 \q_tri_enable_reg[9]  ( .D(n85), .CLK(clk), .Q(N38), .QN(n32) );
  DFFX1 \q_tri_enable_reg[8]  ( .D(n83), .CLK(clk), .Q(N41), .QN(n34) );
  DFFX1 \q_tri_enable_reg[7]  ( .D(n81), .CLK(clk), .Q(N44), .QN(n36) );
  DFFX1 \q_tri_enable_reg[6]  ( .D(n79), .CLK(clk), .Q(N47), .QN(n38) );
  DFFX1 \q_tri_enable_reg[5]  ( .D(n77), .CLK(clk), .Q(N50), .QN(n40) );
  DFFX1 \q_tri_enable_reg[4]  ( .D(n75), .CLK(clk), .Q(N53), .QN(n42) );
  DFFX1 \q_tri_enable_reg[3]  ( .D(n73), .CLK(clk), .Q(N56), .QN(n44) );
  DFFX1 \q_tri_enable_reg[2]  ( .D(n71), .CLK(clk), .Q(N59), .QN(n46) );
  DFFX1 \q_tri_enable_reg[1]  ( .D(n69), .CLK(clk), .Q(N62), .QN(n48) );
  DFFX1 \q_tri_enable_reg[0]  ( .D(n67), .CLK(clk), .Q(N65), .QN(n50) );
  DFFX1 \q_reg[15]  ( .D(n98), .CLK(clk), .Q(n99) );
  DFFX1 \q_reg[14]  ( .D(n96), .CLK(clk), .Q(n100) );
  DFFX1 \q_reg[13]  ( .D(n94), .CLK(clk), .Q(n101) );
  DFFX1 \q_reg[12]  ( .D(n92), .CLK(clk), .Q(n102) );
  DFFX1 \q_reg[11]  ( .D(n90), .CLK(clk), .Q(n103) );
  DFFX1 \q_reg[10]  ( .D(n88), .CLK(clk), .Q(n104) );
  DFFX1 \q_reg[9]  ( .D(n86), .CLK(clk), .Q(n105) );
  DFFX1 \q_reg[8]  ( .D(n84), .CLK(clk), .Q(n106) );
  DFFX1 \q_reg[7]  ( .D(n82), .CLK(clk), .Q(n107) );
  DFFX1 \q_reg[6]  ( .D(n80), .CLK(clk), .Q(n108) );
  DFFX1 \q_reg[5]  ( .D(n78), .CLK(clk), .Q(n109) );
  DFFX1 \q_reg[4]  ( .D(n76), .CLK(clk), .Q(n110) );
  DFFX1 \q_reg[3]  ( .D(n74), .CLK(clk), .Q(n111) );
  DFFX1 \q_reg[2]  ( .D(n72), .CLK(clk), .Q(n112) );
  DFFX1 \q_reg[1]  ( .D(n70), .CLK(clk), .Q(n113) );
  DFFX1 \q_reg[0]  ( .D(n68), .CLK(clk), .Q(n114) );
  INVX0 U87 ( .IN(n153), .QN(n174) );
  INVX0 U88 ( .IN(n175), .QN(n171) );
  INVX0 U89 ( .IN(n175), .QN(n170) );
  INVX0 U90 ( .IN(n174), .QN(n172) );
  INVX0 U91 ( .IN(n174), .QN(n173) );
  INVX0 U92 ( .IN(n153), .QN(n175) );
  INVX0 U93 ( .IN(n153), .QN(n176) );
  INVX0 U94 ( .IN(n153), .QN(n177) );
  INVX0 U95 ( .IN(n153), .QN(n178) );
  NOR2X0 U96 ( .IN1(in_en), .IN2(n152), .QN(n153) );
  AO22X1 U97 ( .IN1(n172), .IN2(n114), .IN3(in[0]), .IN4(n176), .Q(n68) );
  AO22X1 U98 ( .IN1(n173), .IN2(n113), .IN3(in[1]), .IN4(n176), .Q(n70) );
  AO22X1 U99 ( .IN1(n173), .IN2(n112), .IN3(in[2]), .IN4(n177), .Q(n72) );
  AO22X1 U100 ( .IN1(n173), .IN2(n111), .IN3(in[3]), .IN4(n177), .Q(n74) );
  AO22X1 U101 ( .IN1(n173), .IN2(n110), .IN3(in[4]), .IN4(n178), .Q(n76) );
  AO22X1 U102 ( .IN1(n173), .IN2(n109), .IN3(in[5]), .IN4(n178), .Q(n78) );
  AO22X1 U103 ( .IN1(n173), .IN2(n108), .IN3(in[6]), .IN4(n178), .Q(n80) );
  AO22X1 U104 ( .IN1(n173), .IN2(n107), .IN3(in[7]), .IN4(n178), .Q(n82) );
  AO22X1 U105 ( .IN1(n173), .IN2(n106), .IN3(in[8]), .IN4(n176), .Q(n84) );
  AO22X1 U106 ( .IN1(n172), .IN2(n105), .IN3(in[9]), .IN4(n178), .Q(n86) );
  AO22X1 U107 ( .IN1(n172), .IN2(n104), .IN3(in[10]), .IN4(n177), .Q(n88) );
  AO22X1 U108 ( .IN1(n172), .IN2(n103), .IN3(in[11]), .IN4(n176), .Q(n90) );
  AO22X1 U109 ( .IN1(n172), .IN2(n102), .IN3(in[12]), .IN4(n176), .Q(n92) );
  AO22X1 U110 ( .IN1(n172), .IN2(n101), .IN3(in[13]), .IN4(n177), .Q(n94) );
  AO22X1 U111 ( .IN1(n172), .IN2(n100), .IN3(in[14]), .IN4(n177), .Q(n96) );
  AO22X1 U112 ( .IN1(n99), .IN2(n172), .IN3(in[15]), .IN4(n176), .Q(n98) );
  AO21X1 U113 ( .IN1(n170), .IN2(N65), .IN3(n152), .Q(n67) );
  AO21X1 U114 ( .IN1(n170), .IN2(N62), .IN3(n152), .Q(n69) );
  AO21X1 U115 ( .IN1(n170), .IN2(N59), .IN3(n152), .Q(n71) );
  AO21X1 U116 ( .IN1(n170), .IN2(N56), .IN3(n152), .Q(n73) );
  AO21X1 U117 ( .IN1(n170), .IN2(N53), .IN3(n152), .Q(n75) );
  AO21X1 U118 ( .IN1(n170), .IN2(N50), .IN3(n152), .Q(n77) );
  AO21X1 U119 ( .IN1(n171), .IN2(N47), .IN3(n152), .Q(n79) );
  AO21X1 U120 ( .IN1(n171), .IN2(N44), .IN3(n152), .Q(n81) );
  AO21X1 U121 ( .IN1(n171), .IN2(N41), .IN3(n152), .Q(n83) );
  AO21X1 U122 ( .IN1(n171), .IN2(N38), .IN3(n152), .Q(n85) );
  AO21X1 U123 ( .IN1(n171), .IN2(N35), .IN3(n152), .Q(n87) );
  AO21X1 U124 ( .IN1(n171), .IN2(N32), .IN3(n152), .Q(n89) );
  AO21X1 U125 ( .IN1(n171), .IN2(N29), .IN3(n152), .Q(n91) );
  AO21X1 U126 ( .IN1(n171), .IN2(N26), .IN3(n152), .Q(n93) );
  AO21X1 U127 ( .IN1(n170), .IN2(N23), .IN3(n152), .Q(n95) );
  AO21X1 U128 ( .IN1(n170), .IN2(N20), .IN3(n152), .Q(n97) );
  INVX2 U129 ( .IN(reset), .QN(n152) );
endmodule

