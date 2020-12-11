module adder_16(a,b,s);
input [15:0] a,b;
output [15:0] s;
wire [15:0] p,g,c;
pre_process pp0(a[0],b[0],p[0],g[0]);
pre_process pp1(a[1],b[1],p[1],g[1]);
pre_process pp2(a[2],b[2],p[2],g[2]);
pre_process pp3(a[3],b[3],p[3],g[3]);
pre_process pp4(a[4],b[4],p[4],g[4]);
pre_process pp5(a[5],b[5],p[5],g[5]);
pre_process pp6(a[6],b[6],p[6],g[6]);
pre_process pp7(a[7],b[7],p[7],g[7]);
pre_process pp8(a[8],b[8],p[8],g[8]);
pre_process pp9(a[9],b[9],p[9],g[9]);
pre_process pp10(a[10],b[10],p[10],g[10]);
pre_process pp11(a[11],b[11],p[11],g[11]);
pre_process pp12(a[12],b[12],p[12],g[12]);
pre_process pp13(a[13],b[13],p[13],g[13]);
pre_process pp14(a[14],b[14],p[14],g[14]);
pre_process pp15(a[15],b[15],p[15],g[15]);
han_carlson c_gen(p,g,c);
buf (s[0],p[0]);
xor (s[1],p[1],c[0]);
xor (s[2],p[2],c[1]);
xor (s[3],p[3],c[2]);
xor (s[4],p[4],c[3]);
xor (s[5],p[5],c[4]);
xor (s[6],p[6],c[5]);
xor (s[7],p[7],c[6]);
xor (s[8],p[8],c[7]);
xor (s[9],p[9],c[8]);
xor (s[10],p[10],c[9]);
xor (s[11],p[11],c[10]);
xor (s[12],p[12],c[11]);
xor (s[13],p[13],c[12]);
xor (s[14],p[14],c[13]);
xor (s[15],p[15],c[14]);
endmodule

module han_carlson(p,g,c);
input [15:0] p,g;
output [15:0] c;
//step bk begin
black b11(p[15],g[15],p[14],g[14],p15_14,g15_14);
black b12(p[13],g[13],p[12],g[12],p13_12,g13_12);
black b13(p[11],g[11],p[10],g[10],p11_10,g11_10);
black b14(p[9],g[9],p[8],g[8],p9_8,g9_8);
black b15(p[7],g[7],p[6],g[6],p7_6,g7_6);
black b16(p[5],g[5],p[4],g[4],p5_4,g5_4);
black b17(p[3],g[3],p[2],g[2],p3_2,g3_2);
grey g11(p[1],g[1],g[0],g1_0);
buf(c[1],g1_0);
buf(p0_0,p[0]);
buf(g0_0,g[0]);
buf(p2_2,p[2]);
buf(g2_2,g[2]);
buf(p4_4,p[4]);
buf(g4_4,g[4]);
buf(p6_6,p[6]);
buf(g6_6,g[6]);
buf(p8_8,p[8]);
buf(g8_8,g[8]);
buf(p10_10,p[10]);
buf(g10_10,g[10]);
buf(p12_12,p[12]);
buf(g12_12,g[12]);
buf(p14_14,p[14]);
buf(g14_14,g[14]);
//step 2
black b21(p15_14,g15_14,p13_12,g13_12,p15_12,g15_12);
black b22(p13_12,g13_12,p11_10,g11_10,p13_10,g13_10);
black b23(p11_10,g11_10,p9_8,g9_8,p11_8,g11_8);
black b24(p9_8,g9_8,p7_6,g7_6,p9_6,g9_6);
black b25(p7_6,g7_6,p5_4,g5_4,p7_4,g7_4);
black b26(p5_4,g5_4,p3_2,g3_2,p5_2,g5_2);
grey g21(p3_2,g3_2,g1_0,g3_0);
buf(c[3],g3_0);
//step 3
black b31(p15_12,g15_12,p11_8,g11_8,p15_8,g15_8);
black b32(p13_10,g13_10,p9_6,g9_6,p13_6,g13_6);
black b33(p11_8,g11_8,p7_4,g7_4,p11_4,g11_4);
black b34(p9_6,g9_6,p5_2,g5_2,p9_2,g9_2);
grey g31(p7_4,g7_4,g3_0,g7_0);
buf(c[7],g7_0);
grey g32(p5_2,g5_2,g1_0,g5_0);
buf(c[5],g5_0);
//step 4
grey g41(p15_8,g15_8,g7_0,g15_0);
buf(c[15],g15_0);
grey g42(p13_6,g13_6,g5_0,g13_0);
buf(c[13],g13_0);
grey g43(p11_4,g11_4,g3_0,g11_0);
buf(c[11],g11_0);
grey g44(p9_2,g9_2,g1_0,g9_0);
buf(c[9],g9_0);
//step5 for even
grey g51(p2_2,g2_2,g1_0,c[2]);
grey g52(p4_4,g4_4,g3_0,c[4]);
grey g53(p6_6,g6_6,g5_0,c[6]);
grey g54(p8_8,g8_8,g7_0,c[8]);
grey g55(p10_10,g10_10,g9_0,c[10]);
grey g56(p12_12,g12_12,g11_0,c[12]);
grey g57(p14_14,g14_14,g13_0,c[14]);
buf(c[0],g0_0);
endmodule

module pre_process(a,b,p,g);
input a,b;
output p,g;
xor (p,a,b);
and (g,a,b);
endmodule

module grey(p1,g1,g2,g);
input p1,g1,g2;
output g;
wire w;
and (w,p1,g2);
or (g,g1,w);
endmodule

module black(p1,g1,p2,g2,p,g);
input p1,g1,p2,g2;
output p,g;
wire w;
and (p,p1,p2);
and (w,p1,g2);
or (g,w,g1);
endmodule
