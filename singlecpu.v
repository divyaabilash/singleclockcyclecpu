`timescale 10ns/1ns

module singlecpu(clock,pcreset,outdata,pcin,pcout,instruction,writedata,muxoutput,zero,aludata1,regdata2,outdata1,aluselect,aluop,alusrcdata2mux);
input clock,pcreset;
/* pc wires :pcin, pcout
   instruction memory wire: pcout,instruction
	register memory wire: writedata,data1,data2,regwrite
	signextender wire: seout
	mux for selecting source of alu : input:data2,signextenderoutput;selecting:alusrc;out:alusrcdata2
	alucontroller in:aluop, out:aluctl
	alu unit: in:data1,alusrcdata2,aluctl out:zero,aluout
	data memory : in: aluout,reg2-data2,memwrite,memread out:readdata*/
inout [31:0] pcin,pcout,instruction,writedata,aludata1,regdata2,alusrcdata2mux;
//wire for mux to choose reg: muxregout,regdst
wire [31:0]jumpaddress,seout,alusrcdata2,aluout,readdata,pc_data1,pc_data2,pc_select1;
wire [4:0] muxregout;
inout [1:0] aluop;
wire [27:0] slout;
wire regdst,regwrite,alusrc,memwrite,memread,memtoreg,jump,branch,andout;
wire [3:0] aluctl;
output [31:0] outdata,outdata1;
output aluselect,zero,muxoutput;



//PC(rst, clk, PCin, PCout);
PC pc_1(
.rst(pcreset),
.clk(clock),
.PCin(pcin),
.PCout(pcout)
);

// adder for pc :adder(data1,data2,outdata)
adder pc_adder(
.data1(pcout),
.data2(32'b1),
.outdata(pc_select1)
);
//Instructionmemory (clk, InstructionAddress, Instructions )
Instructionmemory instructionmemory_1(
.clk(clock),
//.InstructionAddress(pcout),
.InstructionAddress(pcout),
.Instructions(instruction)
);


//shiftleftmodule (input_shiftleftmodule, output_shiftleftmodule);
shiftleftmodule se(
.input_shiftleftmodule(instruction[25:0]),
.output_shiftleftmodule(slout)
);

pc_adder jump_adder(
.indata(slout),
.pcdata(pcout),
.outdata(jumpaddress)
);

//mainControlUnit(Opcode, ALUOp, regdst,jump,memtoreg,branch,alusrc,RegWrite, DataMemRead, DataMemWrite)
//mainControlUnit(Opcode, ALUOp, regdst,jump,memtoreg,branch,alusrc,RegWrite, DataMemRead, DataMemWrite)
mainControlUnit cpu_1(
.Opcode(instruction[31:26]),
.branch(branch),
.ALUOp(aluop),
.regdst(regdst),
.jump(jump),
.memtoreg(memtoreg),
.alusrc(alusrc),
.RegWrite(regwrite),
.DataMemRead(memread),
.DataMemWrite(memwrite)
);
// signextender (input_data,output_data);
signextender se_1(
.input_data(instruction[15:0]),
.output_data(seout)
);

adder pc_3(
.data1(seout),
.data2(pcout),
.outdata(pc_data1)
);

// mux for selecting the registers: mux(Muxsel,in0,in1,Muxout)
mux mux_1(
.Muxsel(regdst),
.in0(instruction[20:16]),
.in1(instruction[15-11]),
.Muxout(muxregout)
);

// registerfile (Read1,Read2,WriteReg,WriteData,RegWrite,Data1,Data2,clock);
registerfile registerfile_1(
.Read1(instruction[25:21]),
.Read2(instruction[20:16]),
.WriteReg(muxregout),
.WriteData(writedata),
.RegWrite(regwrite),
.Data1(aludata1),
.Data2(regdata2),
.clock(clock)
);
//multiplexer(Muxsel,in0,in1,Muxout)
multiplexer mux_2(
.Muxsel(alusrc),
.in0(regdata2),
.in1(seout),
.Muxout(alusrcdata2)
);

//ALUControl (ALUOp, FuncCode, ALUCtl)
ALUControl alucontroller(
.ALUOp(instruction[5:0]),
.FuncCode(aluop),
.ALUCtl(aluctl)
);


//MIPSALU(ALUCtl,A,B,ALUOut,Zero);
MIPSALU alu_1(
.ALUCtl(aluctl),
.A(aludata1),
.B(alusrcdata2),
.ALUOut(aluout),
.Zero(zero)
);


AndOp(
.a(zero),
.b(branch),
.AndOut(andout)
);

multiplexer mux_pc_1(
.Muxsel(andout),
.in0(pc_select1),
.in1(pc_data1),
.Muxout(pc_data2)
);

multiplexer mux_pc_2(
.Muxsel(jump),
.in0(pc_data2),
.in1(jumpaddress),
.Muxout(pcin)
);

//Datamemory(Address, clk, writeenable, readenable, writedata, outdata)
Datamemory dm_1(
.Address(aluout),
.clk(clock),
.writeenable(memwrite),
.readenable(memread),
.writedata(data2),
.outdata(readdata)
);

//multiplexer(Muxsel,in0,in1,Muxout)
multiplexer mux_3(
.Muxsel(memtoreg),
.in0(aluout),
.in1(readdata),
.Muxout(writedata)
);

assign outdata = writedata;
assign outdata1 = aluout;
assign aluselect = aluctl;
assign alusrcdata2mux=alusrcdata2;
assign muxoutput = andout;
/*
 always 
#1000  clock <=  ! clock; 
*/
//end
endmodule 
 