`timescale 10ns/1ns

module pc_adder(indata,pcdata,outdata);
input [27:0] indata;
input [31:0] pcdata;
output wire [31:0] outdata;

 
assign outdata [31:28] = pcdata [31:28];
assign outdata [27:0] = indata [27:0];

endmodule 
