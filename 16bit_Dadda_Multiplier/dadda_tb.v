`include "dadda.v"

module top;

	reg [15:0] a,b;
	wire [31:0]product;
	reg [31:0]pd;

	dadda mult (a,b,product);

	always @*
		pd=a*b;

	initial
	begin
		$dumpfile("dadda.vcd");
		$dumpvars;
		$monitor("%t a=%d  b=%d  Dadda output: %d    Multiplication: %d",$time,a,b,product,pd);
		a=16'd2;b=16'd8;
		#5 a=16'd164;b=16'd165;
		#5 a=16'hff;b=16'haa;
		#5 a=16'd200;b=16'd1250;
		#5 a=16'd0;b=16'd25;
	end

endmodule
