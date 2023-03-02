
module TSB ( in, out_en, out );
  input [15:0] in;
  output [15:0] out;
  input out_en;

  tri   [15:0] out;

  TNBUFFHX4 \out_tri[0]  ( .IN(in[0]), .ENB(out_en), .Q(out[0]) );
  TNBUFFHX4 \out_tri[1]  ( .IN(in[1]), .ENB(out_en), .Q(out[1]) );
  TNBUFFHX4 \out_tri[2]  ( .IN(in[2]), .ENB(out_en), .Q(out[2]) );
  TNBUFFHX4 \out_tri[3]  ( .IN(in[3]), .ENB(out_en), .Q(out[3]) );
  TNBUFFHX4 \out_tri[4]  ( .IN(in[4]), .ENB(out_en), .Q(out[4]) );
  TNBUFFHX4 \out_tri[5]  ( .IN(in[5]), .ENB(out_en), .Q(out[5]) );
  TNBUFFHX4 \out_tri[6]  ( .IN(in[6]), .ENB(out_en), .Q(out[6]) );
  TNBUFFHX4 \out_tri[7]  ( .IN(in[7]), .ENB(out_en), .Q(out[7]) );
  TNBUFFHX4 \out_tri[8]  ( .IN(in[8]), .ENB(out_en), .Q(out[8]) );
  TNBUFFHX4 \out_tri[9]  ( .IN(in[9]), .ENB(out_en), .Q(out[9]) );
  TNBUFFHX4 \out_tri[10]  ( .IN(in[10]), .ENB(out_en), .Q(out[10]) );
  TNBUFFHX4 \out_tri[11]  ( .IN(in[11]), .ENB(out_en), .Q(out[11]) );
  TNBUFFHX4 \out_tri[12]  ( .IN(in[12]), .ENB(out_en), .Q(out[12]) );
  TNBUFFHX4 \out_tri[13]  ( .IN(in[13]), .ENB(out_en), .Q(out[13]) );
  TNBUFFHX4 \out_tri[14]  ( .IN(in[14]), .ENB(out_en), .Q(out[14]) );
  TNBUFFHX4 \out_tri[15]  ( .IN(in[15]), .ENB(out_en), .Q(out[15]) );
endmodule

