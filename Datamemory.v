`timescale 10ns/1ns
module Datamemory(Address, clk, writeenable, readenable, writedata, outdata);
input [31:0] Address;
input [31:0] writedata;
input clk, writeenable,readenable;
output reg [31:0] outdata;
reg [31:0] data_memory [255:0];
initial begin
//#100 data_memory[0] = 0;
 data_memory[0] = 0;
end
always @(negedge clk) begin
if(readenable && !writeenable)
//#100 outdata <= data_memory[Address];
outdata <= data_memory[Address];
end
always @(posedge clk) begin
if(writeenable && !readenable)
//#100 data_memory[Address] <= writedata;
data_memory[Address] <= writedata;
end 
endmodule
