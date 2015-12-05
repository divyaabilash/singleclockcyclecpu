module registerfile (Read1,Read2,WriteReg,WriteData,RegWrite,Data1,Data2,clock);
input [4:0] Read1,Read2,WriteReg;
input [31:0] WriteData;
input RegWrite,clock;
output wire [31:0] Data1,Data2;
//reg [31:0] Data1, Data2;
reg [31:0] RF [255:0];
assign Data1 = RF[Read1];
assign Data2 = RF[Read2]; 
initial begin 
 RF[5'b 00001]=3; //a1
 RF[5'b 00010]=5;//a2

 RF[5'b 01000]=3;
 RF[5'b 01001]=9;
 RF[5'b 01010]=10;
 RF[5'b 01011]=13;
 RF[5'b 01100]=35;
 RF[5'b 01101]=35;
end 
//always @(*) begin
always begin
@(posedge clock)
if (RegWrite) 
 RF[WriteReg] <= WriteData;
end
endmodule

/*
`timescale 10ns/1ns

module registerfile (Read1,Read2,WriteReg,WriteData,RegWrite,Data1,Data2,clock);
input [4:0] Read1,Read2,WriteReg;
input [31:0] WriteData;
input RegWrite,clock;
output wire [31:0] Data1,Data2;
//reg [31:0] Data1, Data2;
reg [31:0] RF [255:0];
assign Data1 = RF[Read1];
assign Data2 = RF[Read2]; 
initial begin 
#100 RF[5'b 00001]=3; //s1
#100 RF[5'b 00010]=5;//s2

#100 RF[5'b 01000]=3;
#100 RF[5'b 01001]=9;
#100 RF[5'b 01010]=10;
#100 RF[5'b 01011]=13;
#100 RF[5'b 01100]=35;
#100 RF[5'b 01101]=35;
end 
//always @(*) begin
always begin
@(posedge clock)
if (RegWrite) 
#100 RF[WriteReg] = WriteData;
end
endmodule
*/

