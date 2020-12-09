`include "df_f.v"
`include "4_1mux.v"

module fourbitsr(clk,s0,s1,parallel_in,shift_left_input,shift_right_input,out);
input [3:0] parallel_in;
input clk,s0,s1,shift_left_input,shift_right_input;
output [3:0] out;

wire d[3:0];
wire negout[3:0];

mux mux0 (s0,s1,out[0],out[1],shift_left_input,parallel_in[0],d[0]);
mux mux1 (s0,s1,out[1],out[2],out[0],parallel_in[1],d[1]);
mux mux2 (s0,s1,out[2],out[3],out[1],parallel_in[2],d[2]);
mux mux3 (s0,s1,out[3],shift_right_input,out[2],parallel_in[3],d[3]);

dff dff0 (d[0],clk,out[0],negout[0]);
dff dff1 (d[1],clk,out[1],negout[1]);
dff dff2 (d[2],clk,out[2],negout[2]);
dff dff3 (d[3],clk,out[3],negout[3]);

endmodule


