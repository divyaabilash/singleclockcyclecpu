//`timescale 10ns/1ns
module PC(rst, clk, PCin, PCout); 
input clk, rst;
input [31:0] PCin;
output reg [31:0] PCout;

initial begin
PCout = 32'b00000000000000000000000000000000;
end

always @(negedge clk) begin 
//always @(*) begin
if (rst)
begin 
PCout <= 32'b00000000000000000000000000000000;
end
else 
begin
PCout <= PCin; 
end
end 
endmodule
