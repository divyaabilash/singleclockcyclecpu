module ALUControl (ALUOp,FuncCode,ALUCtl);
input [1:0] ALUOp;
input [5:0] FuncCode;
output reg [3:0] ALUCtl;
always @(ALUOp or FuncCode)
//always @(*)
if(ALUOp==0)
ALUCtl <= 2;
else if(ALUOp==1)
ALUCtl <= 6;
else
case(FuncCode)
 32: ALUCtl =2; //add
 34: ALUCtl =6; //subtract
 36: ALUCtl =0; //and
 37: ALUCtl =1; //or
 39: ALUCtl =12; //nor
 default: ALUCtl =15; //should not happen
endcase
endmodule
