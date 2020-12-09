module array_mult(a , b, p);
input [15:0] a,b;
output [31:0] p;

wire [15:0] a1,b1,c1,d1,e1,f1,g1,h1,i1,j1,k1,l1,m1,n1,o1,p1;
wire [15:0] ca_1,ca_2,ca_3,ca_4,ca_5,ca_6,ca_7,ca_8,ca_9,ca_10,ca_11,ca_12,ca_13,ca_14,ca_15,ca_16;
wire [15:0] sum_1,sum_2,sum_3,sum_4,sum_5,sum_6,sum_7,sum_8,sum_9,sum_10,sum_11,sum_12,sum_13,sum_14,sum_15,sum_16;

assign p[0] = a[0] & b[0];
genvar j;
generate
	for(j=1;j<16;j=j+1)begin
		assign a1[j]=a[0] & b[j];
	end
endgenerate
generate
	for(j=0;j<16;j=j+1)begin
		assign b1[j]=a[1] & b[j];
		assign c1[j]=a[2] & b[j];
		assign d1[j]=a[3] & b[j];
		assign e1[j]=a[4] & b[j];
		assign f1[j]=a[5] & b[j];
		assign g1[j]=a[6] & b[j];
		assign h1[j]=a[7] & b[j];
		assign i1[j]=a[8] & b[j];
		assign j1[j]=a[9] & b[j];
		assign k1[j]=a[10] & b[j];
		assign l1[j]=a[11] & b[j];
		assign m1[j]=a[12] & b[j];
		assign n1[j]=a[13] & b[j];
		assign o1[j]=a[14] & b[j];
		assign p1[j]=a[15] & b[j];
	end
endgenerate


//1st level
HA s1(a1[1],b1[0],p[1],ca_1[0]);
FA s2(a1[2],b1[1],ca_1[0],sum_1[0],ca_1[1]);
FA s3(a1[3],b1[2],ca_1[1],sum_1[1],ca_1[2]);
FA s4(a1[4],b1[3],ca_1[2],sum_1[2],ca_1[3]);
FA s5(a1[5],b1[4],ca_1[3],sum_1[3],ca_1[4]);
FA s6(a1[6],b1[5],ca_1[4],sum_1[4],ca_1[5]);
FA s7(a1[7],b1[6],ca_1[5],sum_1[5],ca_1[6]);
FA s8(a1[8],b1[7],ca_1[6],sum_1[6],ca_1[7]);
FA s9(a1[9],b1[8],ca_1[7],sum_1[7],ca_1[8]);
FA s10(a1[10],b1[9],ca_1[8],sum_1[8],ca_1[9]);
FA s11(a1[11],b1[10],ca_1[9],sum_1[9],ca_1[10]);
FA s12(a1[12],b1[11],ca_1[10],sum_1[10],ca_1[11]);
FA s13(a1[13],b1[12],ca_1[11],sum_1[11],ca_1[12]);
FA s14(a1[14],b1[13],ca_1[12],sum_1[12],ca_1[13]);
FA s15(a1[15],b1[14],ca_1[13],sum_1[13],ca_1[14]);
HA s16(b1[15],ca_1[14],sum_1[14],ca_1[15]);

//2nd level
HA x1(sum_1[0],c1[0],p[2],ca_2[0]);
FA x2(sum_1[1],c1[1],ca_2[0],sum_2[0],ca_2[1]);
FA x3(sum_1[2],c1[2],ca_2[1],sum_2[1],ca_2[2]);
FA x4(sum_1[3],c1[3],ca_2[2],sum_2[2],ca_2[3]);
FA x5(sum_1[4],c1[4],ca_2[3],sum_2[3],ca_2[4]);
FA x6(sum_1[5],c1[5],ca_2[4],sum_2[4],ca_2[5]);
FA x7(sum_1[6],c1[6],ca_2[5],sum_2[5],ca_2[6]);
FA x8(sum_1[7],c1[7],ca_2[6],sum_2[6],ca_2[7]);
FA x9(sum_1[8],c1[8],ca_2[7],sum_2[7],ca_2[8]);
FA x10(sum_1[9],c1[9],ca_2[8],sum_2[8],ca_2[9]);
FA x11(sum_1[10],c1[10],ca_2[9],sum_2[9],ca_2[10]);
FA x12(sum_1[11],c1[11],ca_2[10],sum_2[10],ca_2[11]);
FA x13(sum_1[12],c1[12],ca_2[11],sum_2[11],ca_2[12]);
FA x14(sum_1[13],c1[13],ca_2[12],sum_2[12],ca_2[13]);
FA x15(sum_1[14],c1[14],ca_2[13],sum_2[13],ca_2[14]);
FA x16(c1[15],ca_1[15],ca_2[14],sum_2[14],ca_2[15]);

//3rd level
HA t1(sum_2[0],d1[0],p[3],ca_3[0]);
FA t2(sum_2[1],d1[1],ca_3[0],sum_3[0],ca_3[1]);
FA t3(sum_2[2],d1[2],ca_3[1],sum_3[1],ca_3[2]);
FA t4(sum_2[3],d1[3],ca_3[2],sum_3[2],ca_3[3]);
FA t5(sum_2[4],d1[4],ca_3[3],sum_3[3],ca_3[4]);
FA t6(sum_2[5],d1[5],ca_3[4],sum_3[4],ca_3[5]);
FA t7(sum_2[6],d1[6],ca_3[5],sum_3[5],ca_3[6]);
FA t8(sum_2[7],d1[7],ca_3[6],sum_3[6],ca_3[7]);
FA t9(sum_2[8],d1[8],ca_3[7],sum_3[7],ca_3[8]);
FA t10(sum_2[9],d1[9],ca_3[8],sum_3[8],ca_3[9]);
FA t11(sum_2[10],d1[10],ca_3[9],sum_3[9],ca_3[10]);
FA t12(sum_2[11],d1[11],ca_3[10],sum_3[10],ca_3[11]);
FA t13(sum_2[12],d1[12],ca_3[11],sum_3[11],ca_3[12]);
FA t14(sum_2[13],d1[13],ca_3[12],sum_3[12],ca_3[13]);
FA t15(sum_2[14],d1[14],ca_3[13],sum_3[13],ca_3[14]);
FA t16(d1[15],ca_2[15],ca_3[14],sum_3[14],ca_3[15]);

//4th level
HA q1(sum_3[0],e1[0],p[4],ca_4[0]);
FA q2(sum_3[1],e1[1],ca_4[0],sum_4[0],ca_4[1]);
FA q3(sum_3[2],e1[2],ca_4[1],sum_4[1],ca_4[2]);
FA q4(sum_3[3],e1[3],ca_4[2],sum_4[2],ca_4[3]);
FA q5(sum_3[4],e1[4],ca_4[3],sum_4[3],ca_4[4]);
FA q6(sum_3[5],e1[5],ca_4[4],sum_4[4],ca_4[5]);
FA q7(sum_3[6],e1[6],ca_4[5],sum_4[5],ca_4[6]);
FA q8(sum_3[7],e1[7],ca_4[6],sum_4[6],ca_4[7]);
FA q9(sum_3[8],e1[8],ca_4[7],sum_4[7],ca_4[8]);
FA q10(sum_3[9],e1[9],ca_4[8],sum_4[8],ca_4[9]);
FA q11(sum_3[10],e1[10],ca_4[9],sum_4[9],ca_4[10]);
FA q12(sum_3[11],e1[11],ca_4[10],sum_4[10],ca_4[11]);
FA q13(sum_3[12],e1[12],ca_4[11],sum_4[11],ca_4[12]);
FA q14(sum_3[13],e1[13],ca_4[12],sum_4[12],ca_4[13]);
FA q15(sum_3[14],e1[14],ca_4[13],sum_4[13],ca_4[14]);
FA q16(e1[15],ca_3[15],ca_4[14],sum_4[14],ca_4[15]);

//5th level
HA r1(sum_4[0],f1[0],p[5],ca_5[0]);
FA r2(sum_4[1],f1[1],ca_5[0],sum_5[0],ca_5[1]);
FA r3(sum_4[2],f1[2],ca_5[1],sum_5[1],ca_5[2]);
FA r4(sum_4[3],f1[3],ca_5[2],sum_5[2],ca_5[3]);
FA r5(sum_4[4],f1[4],ca_5[3],sum_5[3],ca_5[4]);
FA r6(sum_4[5],f1[5],ca_5[4],sum_5[4],ca_5[5]);
FA r7(sum_4[6],f1[6],ca_5[5],sum_5[5],ca_5[6]);
FA r8(sum_4[7],f1[7],ca_5[6],sum_5[6],ca_5[7]);
FA r9(sum_4[8],f1[8],ca_5[7],sum_5[7],ca_5[8]);
FA r10(sum_4[9],f1[9],ca_5[8],sum_5[8],ca_5[9]);
FA r11(sum_4[10],f1[10],ca_5[9],sum_5[9],ca_5[10]);
FA r12(sum_4[11],f1[11],ca_5[10],sum_5[10],ca_5[11]);
FA r13(sum_4[12],f1[12],ca_5[11],sum_5[11],ca_5[12]);
FA r14(sum_4[13],f1[13],ca_5[12],sum_5[12],ca_5[13]);
FA r15(sum_4[14],f1[14],ca_5[13],sum_5[13],ca_5[14]);
FA r16(f1[15],ca_4[15],ca_5[14],sum_5[14],ca_5[15]);

//6th
HA u1(sum_5[0],g1[0],p[6],ca_6[0]);
FA u2(sum_5[1],g1[1],ca_6[0],sum_6[0],ca_6[1]);
FA u3(sum_5[2],g1[2],ca_6[1],sum_6[1],ca_6[2]);
FA u4(sum_5[3],g1[3],ca_6[2],sum_6[2],ca_6[3]);
FA u5(sum_5[4],g1[4],ca_6[3],sum_6[3],ca_6[4]);
FA u6(sum_5[5],g1[5],ca_6[4],sum_6[4],ca_6[5]);
FA u7(sum_5[6],g1[6],ca_6[5],sum_6[5],ca_6[6]);
FA u8(sum_5[7],g1[7],ca_6[6],sum_6[6],ca_6[7]);
FA u9(sum_5[8],g1[8],ca_6[7],sum_6[7],ca_6[8]);
FA u10(sum_5[9],g1[9],ca_6[8],sum_6[8],ca_6[9]);
FA u11(sum_5[10],g1[10],ca_6[9],sum_6[9],ca_6[10]);
FA u12(sum_5[11],g1[11],ca_6[10],sum_6[10],ca_6[11]);
FA u13(sum_5[12],g1[12],ca_6[11],sum_6[11],ca_6[12]);
FA u14(sum_5[13],g1[13],ca_6[12],sum_6[12],ca_6[13]);
FA u15(sum_5[14],g1[14],ca_6[13],sum_6[13],ca_6[14]);
FA u16(g1[15],ca_5[15],ca_6[14],sum_6[14],ca_6[15]);

//7th
HA v1(sum_6[0],h1[0],p[7],ca_7[0]);
FA v2(sum_6[1],h1[1],ca_7[0],sum_7[0],ca_7[1]);
FA v3(sum_6[2],h1[2],ca_7[1],sum_7[1],ca_7[2]);
FA v4(sum_6[3],h1[3],ca_7[2],sum_7[2],ca_7[3]);
FA v5(sum_6[4],h1[4],ca_7[3],sum_7[3],ca_7[4]);
FA v6(sum_6[5],h1[5],ca_7[4],sum_7[4],ca_7[5]);
FA v7(sum_6[6],h1[6],ca_7[5],sum_7[5],ca_7[6]);
FA v8(sum_6[7],h1[7],ca_7[6],sum_7[6],ca_7[7]);
FA v9(sum_6[8],h1[8],ca_7[7],sum_7[7],ca_7[8]);
FA v10(sum_6[9],h1[9],ca_7[8],sum_7[8],ca_7[9]);
FA v11(sum_6[10],h1[10],ca_7[9],sum_7[9],ca_7[10]);
FA v12(sum_6[11],h1[11],ca_7[10],sum_7[10],ca_7[11]);
FA v13(sum_6[12],h1[12],ca_7[11],sum_7[11],ca_7[12]);
FA v14(sum_6[13],h1[13],ca_7[12],sum_7[12],ca_7[13]);
FA v15(sum_6[14],h1[14],ca_7[13],sum_7[13],ca_7[14]);
FA v16(h1[15],ca_6[15],ca_7[14],sum_7[14],ca_7[15]);

//8th
HA w1(sum_7[0],i1[0],p[8],ca_8[0]);
FA w2(sum_7[1],i1[1],ca_8[0],sum_8[0],ca_8[1]);
FA w3(sum_7[2],i1[2],ca_8[1],sum_8[1],ca_8[2]);
FA w4(sum_7[3],i1[3],ca_8[2],sum_8[2],ca_8[3]);
FA w5(sum_7[4],i1[4],ca_8[3],sum_8[3],ca_8[4]);
FA w6(sum_7[5],i1[5],ca_8[4],sum_8[4],ca_8[5]);
FA w7(sum_7[6],i1[6],ca_8[5],sum_8[5],ca_8[6]);
FA w8(sum_7[7],i1[7],ca_8[6],sum_8[6],ca_8[7]);
FA w9(sum_7[8],i1[8],ca_8[7],sum_8[7],ca_8[8]);
FA w10(sum_7[9],i1[9],ca_8[8],sum_8[8],ca_8[9]);
FA w11(sum_7[10],i1[10],ca_8[9],sum_8[9],ca_8[10]);
FA w12(sum_7[11],i1[11],ca_8[10],sum_8[10],ca_8[11]);
FA w13(sum_7[12],i1[12],ca_8[11],sum_8[11],ca_8[12]);
FA w14(sum_7[13],i1[13],ca_8[12],sum_8[12],ca_8[13]);
FA w15(sum_7[14],i1[14],ca_8[13],sum_8[13],ca_8[14]);
FA w16(i1[15],ca_7[15],ca_8[14],sum_8[14],ca_8[15]);

//9th
HA uq1(sum_8[0],j1[0],p[9],ca_9[0]);
FA uq2(sum_8[1],j1[1],ca_9[0],sum_9[0],ca_9[1]);
FA uq3(sum_8[2],j1[2],ca_9[1],sum_9[1],ca_9[2]);
FA uq4(sum_8[3],j1[3],ca_9[2],sum_9[2],ca_9[3]);
FA uq5(sum_8[4],j1[4],ca_9[3],sum_9[3],ca_9[4]);
FA uq6(sum_8[5],j1[5],ca_9[4],sum_9[4],ca_9[5]);
FA uq7(sum_8[6],j1[6],ca_9[5],sum_9[5],ca_9[6]);
FA uq8(sum_8[7],j1[7],ca_9[6],sum_9[6],ca_9[7]);
FA uq9(sum_8[8],j1[8],ca_9[7],sum_9[7],ca_9[8]);
FA uq10(sum_8[9],j1[9],ca_9[8],sum_9[8],ca_9[9]);
FA uq11(sum_8[10],j1[10],ca_9[9],sum_9[9],ca_9[10]);
FA uq12(sum_8[11],j1[11],ca_9[10],sum_9[10],ca_9[11]);
FA uq13(sum_8[12],j1[12],ca_9[11],sum_9[11],ca_9[12]);
FA uq14(sum_8[13],j1[13],ca_9[12],sum_9[12],ca_9[13]);
FA uq15(sum_8[14],j1[14],ca_9[13],sum_9[13],ca_9[14]);
FA uq16(j1[15],ca_8[15],ca_9[14],sum_9[14],ca_9[15]);

//10th
HA uv1(sum_9[0],k1[0],p[10],ca_10[0]);
FA uv2(sum_9[1],k1[1],ca_10[0],sum_10[0],ca_10[1]);
FA uv3(sum_9[2],k1[2],ca_10[1],sum_10[1],ca_10[2]);
FA uv4(sum_9[3],k1[3],ca_10[2],sum_10[2],ca_10[3]);
FA uv5(sum_9[4],k1[4],ca_10[3],sum_10[3],ca_10[4]);
FA uv6(sum_9[5],k1[5],ca_10[4],sum_10[4],ca_10[5]);
FA uv7(sum_9[6],k1[6],ca_10[5],sum_10[5],ca_10[6]);
FA uv8(sum_9[7],k1[7],ca_10[6],sum_10[6],ca_10[7]);
FA uv9(sum_9[8],k1[8],ca_10[7],sum_10[7],ca_10[8]);
FA uv10(sum_9[9],k1[9],ca_10[8],sum_10[8],ca_10[9]);
FA uv11(sum_9[10],k1[10],ca_10[9],sum_10[9],ca_10[10]);
FA uv12(sum_9[11],k1[11],ca_10[10],sum_10[10],ca_10[11]);
FA uv13(sum_9[12],k1[12],ca_10[11],sum_10[11],ca_10[12]);
FA uv14(sum_9[13],k1[13],ca_10[12],sum_10[12],ca_10[13]);
FA uv15(sum_9[14],k1[14],ca_10[13],sum_10[13],ca_10[14]);
FA uv16(k1[15],ca_9[15],ca_10[14],sum_10[14],ca_10[15]);

//11th
HA ux1(sum_10[0],l1[0],p[11],ca_11[0]);
FA ux2(sum_10[1],l1[1],ca_11[0],sum_11[0],ca_11[1]);
FA ux3(sum_10[2],l1[2],ca_11[1],sum_11[1],ca_11[2]);
FA ux4(sum_10[3],l1[3],ca_11[2],sum_11[2],ca_11[3]);
FA ux5(sum_10[4],l1[4],ca_11[3],sum_11[3],ca_11[4]);
FA ux6(sum_10[5],l1[5],ca_11[4],sum_11[4],ca_11[5]);
FA ux7(sum_10[6],l1[6],ca_11[5],sum_11[5],ca_11[6]);
FA ux8(sum_10[7],l1[7],ca_11[6],sum_11[6],ca_11[7]);
FA ux9(sum_10[8],l1[8],ca_11[7],sum_11[7],ca_11[8]);
FA ux10(sum_10[9],l1[9],ca_11[8],sum_11[8],ca_11[9]);
FA ux11(sum_10[10],l1[10],ca_11[9],sum_11[9],ca_11[10]);
FA ux12(sum_10[11],l1[11],ca_11[10],sum_11[10],ca_11[11]);
FA ux13(sum_10[12],l1[12],ca_11[11],sum_11[11],ca_11[12]);
FA ux14(sum_10[13],l1[13],ca_11[12],sum_11[12],ca_11[13]);
FA ux15(sum_10[14],l1[14],ca_11[13],sum_11[13],ca_11[14]);
FA ux16(l1[15],ca_10[15],ca_11[14],sum_11[14],ca_11[15]);

//12th
HA uy1(sum_11[0],m1[0],p[12],ca_12[0]);
FA uy2(sum_11[1],m1[1],ca_12[0],sum_12[0],ca_12[1]);
FA uy3(sum_11[2],m1[2],ca_12[1],sum_12[1],ca_12[2]);
FA uy4(sum_11[3],m1[3],ca_12[2],sum_12[2],ca_12[3]);
FA uy5(sum_11[4],m1[4],ca_12[3],sum_12[3],ca_12[4]);
FA uy6(sum_11[5],m1[5],ca_12[4],sum_12[4],ca_12[5]);
FA uy7(sum_11[6],m1[6],ca_12[5],sum_12[5],ca_12[6]);
FA uy8(sum_11[7],m1[7],ca_12[6],sum_12[6],ca_12[7]);
FA uy9(sum_11[8],m1[8],ca_12[7],sum_12[7],ca_12[8]);
FA uy10(sum_11[9],m1[9],ca_12[8],sum_12[8],ca_12[9]);
FA uy11(sum_11[10],m1[10],ca_12[9],sum_12[9],ca_12[10]);
FA uy12(sum_11[11],m1[11],ca_12[10],sum_12[10],ca_12[11]);
FA uy13(sum_11[12],m1[12],ca_12[11],sum_12[11],ca_12[12]);
FA uy14(sum_11[13],m1[13],ca_12[12],sum_12[12],ca_12[13]);
FA uy15(sum_11[14],m1[14],ca_12[13],sum_12[13],ca_12[14]);
FA uy16(m1[15],ca_11[15],ca_12[14],sum_12[14],ca_12[15]);

//13th
HA uz1(sum_12[0],n1[0],p[13],ca_13[0]);
FA uz2(sum_12[1],n1[1],ca_13[0],sum_13[0],ca_13[1]);
FA uz3(sum_12[2],n1[2],ca_13[1],sum_13[1],ca_13[2]);
FA uz4(sum_12[3],n1[3],ca_13[2],sum_13[2],ca_13[3]);
FA uz5(sum_12[4],n1[4],ca_13[3],sum_13[3],ca_13[4]);
FA uz6(sum_12[5],n1[5],ca_13[4],sum_13[4],ca_13[5]);
FA uz7(sum_12[6],n1[6],ca_13[5],sum_13[5],ca_13[6]);
FA uz8(sum_12[7],n1[7],ca_13[6],sum_13[6],ca_13[7]);
FA uz9(sum_12[8],n1[8],ca_13[7],sum_13[7],ca_13[8]);
FA uz10(sum_12[9],n1[9],ca_13[8],sum_13[8],ca_13[9]);
FA uz11(sum_12[10],n1[10],ca_13[9],sum_13[9],ca_13[10]);
FA uz12(sum_12[11],n1[11],ca_13[10],sum_13[10],ca_13[11]);
FA uz13(sum_12[12],n1[12],ca_13[11],sum_13[11],ca_13[12]);
FA uz14(sum_12[13],n1[13],ca_13[12],sum_13[12],ca_13[13]);
FA uz15(sum_12[14],n1[14],ca_13[13],sum_13[13],ca_13[14]);
FA uz16(n1[15],ca_12[15],ca_13[14],sum_13[14],ca_13[15]);

//14th
HA uo1(sum_13[0],o1[0],p[14],ca_14[0]);
FA uo2(sum_13[1],o1[1],ca_14[0],sum_14[0],ca_14[1]);
FA uo3(sum_13[2],o1[2],ca_14[1],sum_14[1],ca_14[2]);
FA uo4(sum_13[3],o1[3],ca_14[2],sum_14[2],ca_14[3]);
FA uo5(sum_13[4],o1[4],ca_14[3],sum_14[3],ca_14[4]);
FA uo6(sum_13[5],o1[5],ca_14[4],sum_14[4],ca_14[5]);
FA uo7(sum_13[6],o1[6],ca_14[5],sum_14[5],ca_14[6]);
FA uo8(sum_13[7],o1[7],ca_14[6],sum_14[6],ca_14[7]);
FA uo9(sum_13[8],o1[8],ca_14[7],sum_14[7],ca_14[8]);
FA uo10(sum_13[9],o1[9],ca_14[8],sum_14[8],ca_14[9]);
FA uo11(sum_13[10],o1[10],ca_14[9],sum_14[9],ca_14[10]);
FA uo12(sum_13[11],o1[11],ca_14[10],sum_14[10],ca_14[11]);
FA uo13(sum_13[12],o1[12],ca_14[11],sum_14[11],ca_14[12]);
FA uo14(sum_13[13],o1[13],ca_14[12],sum_14[12],ca_14[13]);
FA uo15(sum_13[14],o1[14],ca_14[13],sum_14[13],ca_14[14]);
FA uo16(o1[15],ca_13[15],ca_14[14],sum_14[14],ca_14[15]);

//15th
HA up1(sum_14[0],p1[0],p[15],ca_15[0]);
FA up2(sum_14[1],p1[1],ca_15[0],p[16],ca_15[1]);
FA up3(sum_14[2],p1[2],ca_15[1],p[17],ca_15[2]);
FA up4(sum_14[3],p1[3],ca_15[2],p[18],ca_15[3]);
FA up5(sum_14[4],p1[4],ca_15[3],p[19],ca_15[4]);
FA up6(sum_14[5],p1[5],ca_15[4],p[20],ca_15[5]);
FA up7(sum_14[6],p1[6],ca_15[5],p[21],ca_15[6]);
FA up8(sum_14[7],p1[7],ca_15[6],p[22],ca_15[7]);
FA up9(sum_14[8],p1[8],ca_15[7],p[23],ca_15[8]);
FA up10(sum_14[9],p1[9],ca_15[8],p[24],ca_15[9]);
FA up11(sum_14[10],p1[10],ca_15[9],p[25],ca_15[10]);
FA up12(sum_14[11],p1[11],ca_15[10],p[26],ca_15[11]);
FA up13(sum_14[12],p1[12],ca_15[11],p[27],ca_15[12]);
FA up14(sum_14[13],p1[13],ca_15[12],p[28],ca_15[13]);
FA up15(sum_14[14],p1[14],ca_15[13],p[29],ca_15[14]);
FA up16(p1[15],ca_14[15],ca_15[14],p[30],p[31]);

endmodule

module HA(x,y,s,carry);
input x ,y;
output s,carry;
assign s = x^y;
assign carry = x&y;
endmodule 

module FA(a,b,cin, sum , cout);
input a, b, cin;
output sum , cout;
assign sum = a^b^cin;
assign cout = a&b | (a^b)&cin;
endmodule
