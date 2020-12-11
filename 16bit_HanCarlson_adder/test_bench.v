`include "han_carlson.v"

module top;

reg [15:0] a,b;
wire [15:0] sum;

adder_16 add(a,b,sum);
initial 
begin 
         a = 16'd12;b=16'd5;
         #5 a = 16'd35; b= 16'd50;
         #5 a= 16'd100; b= 16'd345;
         #5 a= 16'd2001; b= 16'd4;

end 

initial 
begin 
         $monitor($time," a= %d, b = %d, sum = %d",a,b,sum);
         
end 
endmodule 
