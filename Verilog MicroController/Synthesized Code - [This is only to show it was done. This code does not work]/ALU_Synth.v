
module ALU_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] DIFF;
  input CI;
  output CO;
  wire   n35, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33;
  wire   [16:0] carry;

  FADDX1 U2_14 ( .A(A[14]), .B(n19), .CI(carry[14]), .CO(carry[15]), .S(
        DIFF[14]) );
  FADDX1 U2_13 ( .A(A[13]), .B(n20), .CI(carry[13]), .CO(carry[14]), .S(
        DIFF[13]) );
  FADDX1 U2_12 ( .A(A[12]), .B(n21), .CI(carry[12]), .CO(carry[13]), .S(
        DIFF[12]) );
  FADDX1 U2_11 ( .A(A[11]), .B(n22), .CI(carry[11]), .CO(carry[12]), .S(
        DIFF[11]) );
  FADDX1 U2_10 ( .A(A[10]), .B(n23), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  FADDX1 U2_9 ( .A(A[9]), .B(n24), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  FADDX1 U2_8 ( .A(A[8]), .B(n25), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8])
         );
  FADDX1 U2_7 ( .A(A[7]), .B(n26), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  FADDX1 U2_6 ( .A(A[6]), .B(n27), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  FADDX1 U2_5 ( .A(A[5]), .B(n28), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  FADDX1 U2_4 ( .A(A[4]), .B(n29), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  FADDX1 U2_3 ( .A(A[3]), .B(n30), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  FADDX1 U2_2 ( .A(A[2]), .B(n31), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  FADDX1 U2_1 ( .A(A[1]), .B(n32), .CI(n18), .CO(carry[2]), .S(DIFF[1]) );
  NOR2X0 U1 ( .IN1(n33), .IN2(A[0]), .QN(n35) );
  AO21X1 U2 ( .IN1(A[0]), .IN2(n33), .IN3(n35), .Q(DIFF[0]) );
  XNOR3X1 U3 ( .IN1(A[15]), .IN2(B[15]), .IN3(carry[15]), .Q(DIFF[15]) );
  INVX0 U4 ( .IN(B[1]), .QN(n32) );
  INVX0 U5 ( .IN(n35), .QN(n18) );
  INVX0 U6 ( .IN(B[2]), .QN(n31) );
  INVX0 U7 ( .IN(B[3]), .QN(n30) );
  INVX0 U8 ( .IN(B[4]), .QN(n29) );
  INVX0 U9 ( .IN(B[5]), .QN(n28) );
  INVX0 U10 ( .IN(B[6]), .QN(n27) );
  INVX0 U11 ( .IN(B[7]), .QN(n26) );
  INVX0 U12 ( .IN(B[8]), .QN(n25) );
  INVX0 U13 ( .IN(B[9]), .QN(n24) );
  INVX0 U14 ( .IN(B[10]), .QN(n23) );
  INVX0 U15 ( .IN(B[11]), .QN(n22) );
  INVX0 U16 ( .IN(B[12]), .QN(n21) );
  INVX0 U17 ( .IN(B[13]), .QN(n20) );
  INVX0 U18 ( .IN(B[14]), .QN(n19) );
  INVX0 U19 ( .IN(B[0]), .QN(n33) );
endmodule


module ALU_DW01_add_0 ( A, B, CI, SUM, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] SUM;
  input CI;
  output CO;

  wire   [15:1] carry;

  FADDX1 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  FADDX1 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  FADDX1 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  FADDX1 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  FADDX1 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  FADDX1 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  FADDX1 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  FADDX1 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  FADDX1 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  FADDX1 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  FADDX1 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  FADDX1 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  FADDX1 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  FADDX1 U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  XOR3X1 U1_15 ( .IN1(A[15]), .IN2(B[15]), .IN3(carry[15]), .Q(SUM[15]) );
  AND2X1 U1 ( .IN1(A[0]), .IN2(B[0]), .Q(carry[1]) );
  XOR2X1 U2 ( .IN1(B[0]), .IN2(A[0]), .Q(SUM[0]) );
endmodule


module ALU ( in1, in2, OpControl, out );
  input [15:0] in1;
  input [15:0] in2;
  input [3:0] OpControl;
  output [15:0] out;
  wire   N73, N74, N75, N76, N77, N78, N79, N80, N81, N82, N83, N84, N85, N86,
         N87, N88, N89, N90, N91, N92, N93, N94, N95, N96, N97, N98, N99, N100,
         N101, N102, N103, N104, n281, n282, n283, n284, n285, n286, n288,
         n289, n290, n291, n293, n294, n295, n296, n297, n298, n299, n300,
         n301, n302, n303, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n315, n316, n317, n318, n319, n320, n321, n322,
         n323, n324, n325, n326, n327, n328, n329, n330, n331, n332, n333,
         n334, n335, n336, n337, n338, n339, n340, n341, n342, n343, n344,
         n345, n346, n347, n348, n349, n350, n351, n352, n353, n354, n355,
         n356, n357, n358, n359, n360, n361, n362, n363, n364, n365, n366,
         n367, n368, n369, n370, n371, n372, n373, n374, n375, n376, n377,
         n378, n379, n380, n381, n382, n383, n384, n385, n386, n387, n388,
         n389, n390, n391, n392, n393, n394, n395, n396, n397, n398, n399,
         n400, n401, n402, n403, n404, n405, n406, n407, n408, n409, n410,
         n411, n412, n413, n414, n415, n416, n417, n418, n419, n420, n421,
         n422, n423, n424, n425, n426, n427, n428, n429, n430, n431, n432,
         n433, n434, n435, n436, n437, n438, n439, n440, n441, n442, n443,
         n444, n445;

  ALU_DW01_sub_0 r62 ( .A(in1), .B(in2), .CI(1'b0), .DIFF({N104, N103, N102, 
        N101, N100, N99, N98, N97, N96, N95, N94, N93, N92, N91, N90, N89}) );
  ALU_DW01_add_0 r61 ( .A(in1), .B(in2), .CI(1'b0), .SUM({N88, N87, N86, N85, 
        N84, N83, N82, N81, N80, N79, N78, N77, N76, N75, N74, N73}) );
  OA221X1 U278 ( .IN1(n408), .IN2(n411), .IN3(n405), .IN4(n355), .IN5(n356), 
        .Q(n354) );
  NAND2X2 U279 ( .IN1(n401), .IN2(OpControl[0]), .QN(n405) );
  NAND2X2 U280 ( .IN1(n400), .IN2(n445), .QN(n406) );
  AOI22X1 U281 ( .IN1(n289), .IN2(n427), .IN3(N104), .IN4(n290), .QN(n356) );
  ISOLANDX1 U282 ( .D(n399), .ISO(n445), .Q(n290) );
  ISOLANDX1 U283 ( .D(n400), .ISO(n445), .Q(n289) );
  OA221X1 U284 ( .IN1(n408), .IN2(n425), .IN3(n405), .IN4(n348), .IN5(n349), 
        .Q(n347) );
  AOI22X1 U285 ( .IN1(n289), .IN2(n441), .IN3(N90), .IN4(n290), .QN(n349) );
  OA221X1 U286 ( .IN1(n408), .IN2(n424), .IN3(n405), .IN4(n341), .IN5(n342), 
        .Q(n340) );
  AOI22X1 U287 ( .IN1(n289), .IN2(n440), .IN3(N91), .IN4(n290), .QN(n342) );
  OA221X1 U288 ( .IN1(n407), .IN2(n423), .IN3(n405), .IN4(n334), .IN5(n335), 
        .Q(n333) );
  AOI22X1 U289 ( .IN1(n289), .IN2(n439), .IN3(N92), .IN4(n290), .QN(n335) );
  OA221X1 U290 ( .IN1(n407), .IN2(n422), .IN3(n405), .IN4(n327), .IN5(n328), 
        .Q(n326) );
  AOI22X1 U291 ( .IN1(n289), .IN2(n438), .IN3(N93), .IN4(n290), .QN(n328) );
  OA221X1 U292 ( .IN1(n407), .IN2(n421), .IN3(n405), .IN4(n320), .IN5(n321), 
        .Q(n319) );
  AOI22X1 U293 ( .IN1(n289), .IN2(n437), .IN3(N94), .IN4(n290), .QN(n321) );
  OA221X1 U294 ( .IN1(n407), .IN2(n420), .IN3(n405), .IN4(n313), .IN5(n314), 
        .Q(n312) );
  AOI22X1 U295 ( .IN1(n289), .IN2(n436), .IN3(N95), .IN4(n290), .QN(n314) );
  OA221X1 U296 ( .IN1(n407), .IN2(n419), .IN3(n405), .IN4(n306), .IN5(n307), 
        .Q(n305) );
  AOI22X1 U297 ( .IN1(n289), .IN2(n435), .IN3(N96), .IN4(n290), .QN(n307) );
  OA221X1 U298 ( .IN1(n407), .IN2(n418), .IN3(n405), .IN4(n299), .IN5(n300), 
        .Q(n298) );
  AOI22X1 U299 ( .IN1(n289), .IN2(n434), .IN3(N97), .IN4(n290), .QN(n300) );
  OA221X1 U300 ( .IN1(n417), .IN2(n408), .IN3(n286), .IN4(n405), .IN5(n288), 
        .Q(n284) );
  AOI22X1 U301 ( .IN1(n289), .IN2(n433), .IN3(N98), .IN4(n290), .QN(n288) );
  OA221X1 U302 ( .IN1(n407), .IN2(n416), .IN3(n405), .IN4(n390), .IN5(n391), 
        .Q(n389) );
  AOI22X1 U303 ( .IN1(n289), .IN2(n432), .IN3(N99), .IN4(n290), .QN(n391) );
  OA221X1 U304 ( .IN1(n408), .IN2(n415), .IN3(n405), .IN4(n383), .IN5(n384), 
        .Q(n382) );
  AOI22X1 U305 ( .IN1(n289), .IN2(n431), .IN3(N100), .IN4(n290), .QN(n384) );
  OA221X1 U306 ( .IN1(n408), .IN2(n414), .IN3(n405), .IN4(n376), .IN5(n377), 
        .Q(n375) );
  AOI22X1 U307 ( .IN1(n289), .IN2(n430), .IN3(N101), .IN4(n290), .QN(n377) );
  OA221X1 U308 ( .IN1(n408), .IN2(n413), .IN3(n405), .IN4(n369), .IN5(n370), 
        .Q(n368) );
  AOI22X1 U309 ( .IN1(n289), .IN2(n429), .IN3(N102), .IN4(n290), .QN(n370) );
  OA221X1 U310 ( .IN1(n408), .IN2(n412), .IN3(n405), .IN4(n362), .IN5(n363), 
        .Q(n361) );
  AOI22X1 U311 ( .IN1(n289), .IN2(n428), .IN3(N103), .IN4(n290), .QN(n363) );
  INVX2 U312 ( .IN(n404), .QN(n443) );
  ISOLANDX1 U313 ( .D(n403), .ISO(n444), .Q(n401) );
  OA21X1 U314 ( .IN1(n443), .IN2(n424), .IN3(n410), .Q(n343) );
  OA21X1 U315 ( .IN1(n443), .IN2(n423), .IN3(n410), .Q(n336) );
  OA21X1 U316 ( .IN1(n443), .IN2(n422), .IN3(n410), .Q(n329) );
  OA21X1 U317 ( .IN1(n443), .IN2(n421), .IN3(n410), .Q(n322) );
  OA21X1 U318 ( .IN1(n443), .IN2(n420), .IN3(n410), .Q(n315) );
  OA21X1 U319 ( .IN1(n443), .IN2(n419), .IN3(n410), .Q(n308) );
  OA21X1 U320 ( .IN1(n443), .IN2(n418), .IN3(n410), .Q(n301) );
  OA21X1 U321 ( .IN1(n443), .IN2(n426), .IN3(n409), .Q(n402) );
  OA21X1 U322 ( .IN1(n443), .IN2(n425), .IN3(n409), .Q(n350) );
  OA21X1 U323 ( .IN1(n443), .IN2(n417), .IN3(n409), .Q(n291) );
  OA21X1 U324 ( .IN1(n443), .IN2(n416), .IN3(n409), .Q(n392) );
  OA21X1 U325 ( .IN1(n443), .IN2(n415), .IN3(n409), .Q(n385) );
  OA21X1 U326 ( .IN1(n443), .IN2(n414), .IN3(n409), .Q(n378) );
  OA21X1 U327 ( .IN1(n443), .IN2(n413), .IN3(n409), .Q(n371) );
  OA21X1 U328 ( .IN1(n443), .IN2(n412), .IN3(n409), .Q(n364) );
  OA21X1 U329 ( .IN1(n443), .IN2(n411), .IN3(n409), .Q(n357) );
  NBUFFX2 U330 ( .IN(n285), .Q(n409) );
  NBUFFX2 U331 ( .IN(n285), .Q(n407) );
  NBUFFX2 U332 ( .IN(n285), .Q(n408) );
  NBUFFX2 U333 ( .IN(n285), .Q(n410) );
  NOR3X0 U334 ( .IN1(OpControl[1]), .IN2(OpControl[3]), .IN3(n444), .QN(n404)
         );
  OA221X1 U335 ( .IN1(n407), .IN2(n426), .IN3(n405), .IN4(n397), .IN5(n398), 
        .Q(n396) );
  AOI22X1 U336 ( .IN1(n289), .IN2(n442), .IN3(N89), .IN4(n290), .QN(n398) );
  XOR2X1 U337 ( .IN1(in2[9]), .IN2(in1[9]), .Q(n286) );
  XOR2X1 U338 ( .IN1(in2[0]), .IN2(in1[0]), .Q(n397) );
  XOR2X1 U339 ( .IN1(in2[1]), .IN2(in1[1]), .Q(n348) );
  XOR2X1 U340 ( .IN1(in2[2]), .IN2(in1[2]), .Q(n341) );
  XOR2X1 U341 ( .IN1(in2[3]), .IN2(in1[3]), .Q(n334) );
  XOR2X1 U342 ( .IN1(in2[4]), .IN2(in1[4]), .Q(n327) );
  XOR2X1 U343 ( .IN1(in2[5]), .IN2(in1[5]), .Q(n320) );
  XOR2X1 U344 ( .IN1(in2[6]), .IN2(in1[6]), .Q(n313) );
  XOR2X1 U345 ( .IN1(in2[7]), .IN2(in1[7]), .Q(n306) );
  XOR2X1 U346 ( .IN1(in2[8]), .IN2(in1[8]), .Q(n299) );
  XOR2X1 U347 ( .IN1(in2[10]), .IN2(in1[10]), .Q(n390) );
  XOR2X1 U348 ( .IN1(in2[11]), .IN2(in1[11]), .Q(n383) );
  XOR2X1 U349 ( .IN1(in2[12]), .IN2(in1[12]), .Q(n376) );
  XOR2X1 U350 ( .IN1(in2[13]), .IN2(in1[13]), .Q(n369) );
  XOR2X1 U351 ( .IN1(in2[14]), .IN2(in1[14]), .Q(n362) );
  XOR2X1 U352 ( .IN1(in2[15]), .IN2(in1[15]), .Q(n355) );
  NAND2X0 U353 ( .IN1(OpControl[0]), .IN2(n404), .QN(n285) );
  ISOLANDX1 U354 ( .D(n403), .ISO(OpControl[2]), .Q(n400) );
  ISOLANDX1 U355 ( .D(OpControl[1]), .ISO(OpControl[3]), .Q(n403) );
  NOR2X0 U356 ( .IN1(OpControl[1]), .IN2(OpControl[2]), .QN(n399) );
  ISOLANDX1 U357 ( .D(n401), .ISO(OpControl[0]), .Q(n294) );
  ISOLANDX1 U358 ( .D(n399), .ISO(OpControl[0]), .Q(n293) );
  NAND4X0 U359 ( .IN1(n393), .IN2(n394), .IN3(n395), .IN4(n396), .QN(out[0])
         );
  NAND2X0 U360 ( .IN1(N73), .IN2(n293), .QN(n394) );
  NAND2X0 U361 ( .IN1(n294), .IN2(n397), .QN(n393) );
  OA22X1 U362 ( .IN1(n402), .IN2(n442), .IN3(in1[0]), .IN4(n406), .Q(n395) );
  NAND4X0 U363 ( .IN1(n344), .IN2(n345), .IN3(n346), .IN4(n347), .QN(out[1])
         );
  NAND2X0 U364 ( .IN1(N74), .IN2(n293), .QN(n345) );
  NAND2X0 U365 ( .IN1(n294), .IN2(n348), .QN(n344) );
  OA22X1 U366 ( .IN1(n350), .IN2(n441), .IN3(in1[1]), .IN4(n406), .Q(n346) );
  NAND4X0 U367 ( .IN1(n337), .IN2(n338), .IN3(n339), .IN4(n340), .QN(out[2])
         );
  NAND2X0 U368 ( .IN1(N75), .IN2(n293), .QN(n338) );
  NAND2X0 U369 ( .IN1(n294), .IN2(n341), .QN(n337) );
  OA22X1 U370 ( .IN1(n343), .IN2(n440), .IN3(in1[2]), .IN4(n406), .Q(n339) );
  NAND4X0 U371 ( .IN1(n330), .IN2(n331), .IN3(n332), .IN4(n333), .QN(out[3])
         );
  NAND2X0 U372 ( .IN1(N76), .IN2(n293), .QN(n331) );
  NAND2X0 U373 ( .IN1(n294), .IN2(n334), .QN(n330) );
  OA22X1 U374 ( .IN1(n336), .IN2(n439), .IN3(in1[3]), .IN4(n406), .Q(n332) );
  NAND4X0 U375 ( .IN1(n323), .IN2(n324), .IN3(n325), .IN4(n326), .QN(out[4])
         );
  NAND2X0 U376 ( .IN1(N77), .IN2(n293), .QN(n324) );
  NAND2X0 U377 ( .IN1(n294), .IN2(n327), .QN(n323) );
  OA22X1 U378 ( .IN1(n329), .IN2(n438), .IN3(in1[4]), .IN4(n406), .Q(n325) );
  NAND4X0 U379 ( .IN1(n316), .IN2(n317), .IN3(n318), .IN4(n319), .QN(out[5])
         );
  NAND2X0 U380 ( .IN1(N78), .IN2(n293), .QN(n317) );
  NAND2X0 U381 ( .IN1(n294), .IN2(n320), .QN(n316) );
  OA22X1 U382 ( .IN1(n322), .IN2(n437), .IN3(in1[5]), .IN4(n406), .Q(n318) );
  NAND4X0 U383 ( .IN1(n309), .IN2(n310), .IN3(n311), .IN4(n312), .QN(out[6])
         );
  NAND2X0 U384 ( .IN1(N79), .IN2(n293), .QN(n310) );
  NAND2X0 U385 ( .IN1(n294), .IN2(n313), .QN(n309) );
  OA22X1 U386 ( .IN1(n315), .IN2(n436), .IN3(in1[6]), .IN4(n406), .Q(n311) );
  NAND4X0 U387 ( .IN1(n302), .IN2(n303), .IN3(n304), .IN4(n305), .QN(out[7])
         );
  NAND2X0 U388 ( .IN1(N80), .IN2(n293), .QN(n303) );
  NAND2X0 U389 ( .IN1(n294), .IN2(n306), .QN(n302) );
  OA22X1 U390 ( .IN1(n308), .IN2(n435), .IN3(in1[7]), .IN4(n406), .Q(n304) );
  NAND4X0 U391 ( .IN1(n295), .IN2(n296), .IN3(n297), .IN4(n298), .QN(out[8])
         );
  NAND2X0 U392 ( .IN1(N81), .IN2(n293), .QN(n296) );
  NAND2X0 U393 ( .IN1(n294), .IN2(n299), .QN(n295) );
  OA22X1 U394 ( .IN1(n301), .IN2(n434), .IN3(in1[8]), .IN4(n406), .Q(n297) );
  NAND4X0 U395 ( .IN1(n281), .IN2(n282), .IN3(n283), .IN4(n284), .QN(out[9])
         );
  NAND2X0 U396 ( .IN1(N82), .IN2(n293), .QN(n282) );
  NAND2X0 U397 ( .IN1(n294), .IN2(n286), .QN(n281) );
  OA22X1 U398 ( .IN1(n291), .IN2(n433), .IN3(in1[9]), .IN4(n406), .Q(n283) );
  NAND4X0 U399 ( .IN1(n386), .IN2(n387), .IN3(n388), .IN4(n389), .QN(out[10])
         );
  NAND2X0 U400 ( .IN1(N83), .IN2(n293), .QN(n387) );
  NAND2X0 U401 ( .IN1(n294), .IN2(n390), .QN(n386) );
  OA22X1 U402 ( .IN1(n392), .IN2(n432), .IN3(in1[10]), .IN4(n406), .Q(n388) );
  NAND4X0 U403 ( .IN1(n379), .IN2(n380), .IN3(n381), .IN4(n382), .QN(out[11])
         );
  NAND2X0 U404 ( .IN1(N84), .IN2(n293), .QN(n380) );
  NAND2X0 U405 ( .IN1(n294), .IN2(n383), .QN(n379) );
  OA22X1 U406 ( .IN1(n385), .IN2(n431), .IN3(in1[11]), .IN4(n406), .Q(n381) );
  NAND4X0 U407 ( .IN1(n372), .IN2(n373), .IN3(n374), .IN4(n375), .QN(out[12])
         );
  NAND2X0 U408 ( .IN1(N85), .IN2(n293), .QN(n373) );
  NAND2X0 U409 ( .IN1(n294), .IN2(n376), .QN(n372) );
  OA22X1 U410 ( .IN1(n378), .IN2(n430), .IN3(in1[12]), .IN4(n406), .Q(n374) );
  NAND4X0 U411 ( .IN1(n365), .IN2(n366), .IN3(n367), .IN4(n368), .QN(out[13])
         );
  NAND2X0 U412 ( .IN1(N86), .IN2(n293), .QN(n366) );
  NAND2X0 U413 ( .IN1(n294), .IN2(n369), .QN(n365) );
  OA22X1 U414 ( .IN1(n371), .IN2(n429), .IN3(in1[13]), .IN4(n406), .Q(n367) );
  NAND4X0 U415 ( .IN1(n358), .IN2(n359), .IN3(n360), .IN4(n361), .QN(out[14])
         );
  NAND2X0 U416 ( .IN1(N87), .IN2(n293), .QN(n359) );
  NAND2X0 U417 ( .IN1(n294), .IN2(n362), .QN(n358) );
  OA22X1 U418 ( .IN1(n364), .IN2(n428), .IN3(in1[14]), .IN4(n406), .Q(n360) );
  NAND4X0 U419 ( .IN1(n351), .IN2(n352), .IN3(n353), .IN4(n354), .QN(out[15])
         );
  NAND2X0 U420 ( .IN1(N88), .IN2(n293), .QN(n352) );
  NAND2X0 U421 ( .IN1(n294), .IN2(n355), .QN(n351) );
  OA22X1 U422 ( .IN1(n357), .IN2(n427), .IN3(in1[15]), .IN4(n406), .Q(n353) );
  INVX0 U423 ( .IN(OpControl[0]), .QN(n445) );
  INVX0 U424 ( .IN(OpControl[2]), .QN(n444) );
  INVX0 U425 ( .IN(in1[9]), .QN(n417) );
  INVX0 U426 ( .IN(in1[0]), .QN(n426) );
  INVX0 U427 ( .IN(in1[1]), .QN(n425) );
  INVX0 U428 ( .IN(in1[2]), .QN(n424) );
  INVX0 U429 ( .IN(in1[3]), .QN(n423) );
  INVX0 U430 ( .IN(in1[4]), .QN(n422) );
  INVX0 U431 ( .IN(in1[5]), .QN(n421) );
  INVX0 U432 ( .IN(in1[6]), .QN(n420) );
  INVX0 U433 ( .IN(in1[7]), .QN(n419) );
  INVX0 U434 ( .IN(in1[8]), .QN(n418) );
  INVX0 U435 ( .IN(in1[10]), .QN(n416) );
  INVX0 U436 ( .IN(in1[11]), .QN(n415) );
  INVX0 U437 ( .IN(in1[12]), .QN(n414) );
  INVX0 U438 ( .IN(in1[13]), .QN(n413) );
  INVX0 U439 ( .IN(in1[14]), .QN(n412) );
  INVX0 U440 ( .IN(in1[15]), .QN(n411) );
  INVX0 U441 ( .IN(in2[0]), .QN(n442) );
  INVX0 U442 ( .IN(in2[1]), .QN(n441) );
  INVX0 U443 ( .IN(in2[2]), .QN(n440) );
  INVX0 U444 ( .IN(in2[3]), .QN(n439) );
  INVX0 U445 ( .IN(in2[4]), .QN(n438) );
  INVX0 U446 ( .IN(in2[5]), .QN(n437) );
  INVX0 U447 ( .IN(in2[6]), .QN(n436) );
  INVX0 U448 ( .IN(in2[7]), .QN(n435) );
  INVX0 U449 ( .IN(in2[8]), .QN(n434) );
  INVX0 U450 ( .IN(in2[9]), .QN(n433) );
  INVX0 U451 ( .IN(in2[10]), .QN(n432) );
  INVX0 U452 ( .IN(in2[11]), .QN(n431) );
  INVX0 U453 ( .IN(in2[12]), .QN(n430) );
  INVX0 U454 ( .IN(in2[13]), .QN(n429) );
  INVX0 U455 ( .IN(in2[14]), .QN(n428) );
  INVX0 U456 ( .IN(in2[15]), .QN(n427) );
endmodule

