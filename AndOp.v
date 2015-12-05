`timescale 10ns/1ns

module AndOp(a , b , AndOut);
input a,b;
output reg AndOut;
always @(a,b) begin
  AndOut <= a & b;
  end
endmodule
