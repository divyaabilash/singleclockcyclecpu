`timescale 10ns/1ns

module mux(Muxsel,in0,in1,Muxout);
input [4:0] in0, in1;
input Muxsel;
output reg [4:0] Muxout;
//always @(*)
always @(Muxsel,in0,in1)
/*begin
case(Muxsel)
0:Muxout <= in0;
1:Muxout <= in1;
endcase
*/
//always
begin
 Muxout = Muxsel? in1 : in0;
end
endmodule

