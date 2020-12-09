`include "8bit_sr.v"

module top;
reg [7:0] parallel_in;
reg clk,s0,s1,shift_left_input,shift_right_input;
wire [7:0]out;

initial clk = 1'b1;
always #5 clk = ~clk;

eightbitsr shift_register (clk,s0,s1,parallel_in,shift_left_input,shift_right_input,out);

initial
begin
    parallel_in = 8'b11111111;
    shift_right_input=0;
    shift_left_input=0;
    //left shift
    #5 s0=1;s1=1;//for right shift =  #5 s0=1;s1=1; #5 s0=0; #5 s0=1;s1=0; #25 s0=0;s1=0; #5 s0=1;s1=0;
    #5 s0=1;
    #5 s0=0;s1=1;
    #25 s0=0;s1=0;
    #5 s0=0;s1=1;
end

initial

begin
    $monitor($time,"  out = %b",out);
    // $monitor($time,"  s1=%b s0=%b out = %b",s1,s0,out);
    $dumpfile("8bit_sr.vcd");
    $dumpvars;
    #200 $finish;
end

endmodule
