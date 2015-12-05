`timescale 10ns/1ns
module adder(data1,data2,outdata);
input [31:0] data1,data2;
output reg [31:0] outdata;
/*
always @(*) begin 
#100 outdata <= data1+data2;
end 
*/
always begin 
outdata <= data1+data2;
end
endmodule 