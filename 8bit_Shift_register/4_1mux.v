module mux(s0,s1,i0,i1,i2,i3,out);
input s0,s1,i0,i1,i2,i3;
output out;

wire w0,w1,w2,w3;

and select_0(w0,~s0,~s1,i0);
and select_1(w1,s0,~s1,i1);
and select_2(w2,~s0,s1,i2);
and select_3(w3,s0,s1,i3);

or output_(out,w0,w1,w2,w3);

endmodule
