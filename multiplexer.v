`timescale 10ns/1ns
module multiplexer(Muxsel,in0,in1,Muxout);
input [31:0] in0, in1;
input Muxsel;
output reg [31:0] Muxout;
always @(Muxsel,in0,in1)
//always @(*) 
begin
 Muxout <= Muxsel? in1 : in0;
/*
case(Muxsel)
0:Muxout <= in0;
1:Muxout <= in1;
endcase
*/
end
endmodule

