`include "16bit_am.v"

module top;

reg [15:0] a,b;
wire [31:0] p;

array_mult six(a,b,p);
initial 
begin 
         a = 16'd12;b=16'd5;
         #5 a = 16'd35; b= 16'd50;
         #5 a= 16'd100; b= 16'd345;
         #5 a= 16'd2001; b= 16'd4;

end 

initial 
begin 
         $monitor($time," a= %d, b = %d, p = %d",a,b,p);
         
end 
endmodule 
