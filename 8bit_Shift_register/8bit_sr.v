`include "4bit_sr.v"

module eightbitsr(clk,s0,s1,parallel_in,shift_left_input,shift_right_input,out);
input [7:0] parallel_in;
input clk,s0,s1,shift_left_input,shift_right_input;
output [7:0] out;

fourbitsr zero_to_three (clk,s0,s1,parallel_in[3:0],shift_left_input,out[4],out[3:0]);
fourbitsr four_to_seven (clk,s0,s1,parallel_in[7:4],out[3],shift_right_input,out[7:4]);

endmodule


