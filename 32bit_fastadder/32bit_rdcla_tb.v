`include "32bit_rdcla.v"

module top;

reg [31:0] a, b;
reg cin;
wire [31:0] sum;
wire cout;

cla32bit adder (a,b,cin,sum,cout);

initial
begin
	cin=1'b0; a=32'd25;b=32'd45;
	#5 a=32'd300;
	#5 cin = 1'b1; b=32'd650;
	#5 a=32'd1423;
	#5 cin =1'b0; b=32'd4986;

end
initial 
begin
	$monitor($time," a = %d, b = %d , cin = %d , sum = %d, cout = %d ",a,b,cin,sum,cout);
	$dumpfile("32bit_rdcl.vcd");
	$dumpvars;
end
endmodule

