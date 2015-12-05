`timescale 10ns/1ns
module mainControlUnit(Opcode, ALUOp, regdst,jump,memtoreg,branch,alusrc,RegWrite, DataMemRead, DataMemWrite);
	input [5:0] Opcode;
	output reg [1:0] ALUOp;
	output reg regdst,jump,memtoreg,branch,alusrc, RegWrite, DataMemRead, DataMemWrite;
	always begin
	//always @(*) begin
	// R type instructions
	if (Opcode == 6'b000000) begin
	regdst			<= 1'b1;
	jump				<= 1'b0;
	memtoreg			<= 1'b0;
	branch			<= 1'b0;
	alusrc			<= 1'b0;
	ALUOp			<= 2'b10;	// depends on the function code, therefore irrelevant
	RegWrite 	<= 1'b1;
	DataMemRead 	<= 1'b0;
	DataMemWrite 	<= 1'b0;
	end
	//Load instruction
	else if (Opcode == 6'b100011) begin
	regdst			<= 1'b0;
	jump				<= 1'b0;
	memtoreg			<= 1'b1;
	branch			<= 1'b0;
	alusrc			<= 1'b1;
	ALUOp			<= 2'b00;		//addition operation, therefore ALUOp = 0
	RegWrite 	<= 1'b1;
	DataMemRead 	<= 1'b1;
	DataMemWrite 	<= 1'b0;	
	end
	//Store Instruction
	else if (Opcode == 6'b101011) begin
	regdst			<= 1'bx;
	jump				<= 1'b0;
	memtoreg			<= 1'bx;
	branch			<= 1'b0;
	alusrc			<= 1'b1;
	ALUOp			<= 2'b00;		//addition operation, therefore ALUOp = 0
	RegWrite 	<= 1'b0;
	DataMemRead 	<= 1'b0;
	DataMemWrite 	<= 1'b1;	
	end
	//beq - Branch on equal Instruction
	else if (Opcode == 6'b000100) begin
	regdst			<= 1'b0;
	jump				<= 1'b0;
	memtoreg			<= 1'b0;
	branch			<= 1'b1;
	alusrc			<= 1'b0;
	ALUOp			<= 2'b01;		//subtraction operation, therefore ALUOp = 1
	RegWrite 	<= 1'b0 ;
	DataMemRead 	<= 1'b0;
	DataMemWrite	<= 1'b0;	
	end
	//j - jump instruction
	else if (Opcode == 6'b000010) begin
	regdst			<= 1'b0;
	jump				<= 1'b1;
	memtoreg			<= 1'b0;
	branch			<= 1'b0;
	alusrc			<= 1'b0;
	ALUOp			<= 2'b00;	
	RegWrite 	<= 1'b0;
	DataMemRead 	<= 1'b0;
	DataMemWrite 	<= 1'b0;	
	end
	// addi - add immediate operations
	else if (Opcode == 6'b001000) begin
	regdst			<= 1'b0;
	jump				<= 1'b0;
	memtoreg			<= 1'b0;
	branch			<= 1'b0;
	alusrc			<= 1'b1;
	ALUOp			<= 2'b00;		//addition operation, therefore ALUOp = 0	
	RegWrite 	<= 1'b1;
	DataMemRead 	<= 1'b0;
	DataMemWrite	<= 1'b0;	
	end
	/*else begin
	regdst			<= 1'bx;
	jump				<= 1'bx;
	memtoreg			<= 1'bx;
	branch			<= 1'bx;
	alusrc			<= 1'bx;
	ALUOp			<= 2'bxx;		//addition operation, therefore ALUOp = 0	
	RegWrite 	<= 1'bx;
	DataMemRead 	<= 1'bx;
	DataMemWrite	<= 1'bx;	
	end */
end	
endmodule
 /*
 `timescale 10ns/1ns
module mainControlUnit(Opcode, ALUOp, regdst,jump,memtoreg,branch,alusrc,RegWrite, DataMemRead, DataMemWrite);
	input [5:0] Opcode;
	output reg [1:0] ALUOp;
	output reg regdst,jump,memtoreg,branch,alusrc, RegWrite, DataMemRead, DataMemWrite;
	
	always @(*) begin
	// R type instructions
	if (Opcode == 6'b000000) begin
#100	regdst			<= 1'b1;
#100	jump				<= 1'b0;
#100	memtoreg			<= 1'b0;
#100	branch			<= 1'b0;
#100	alusrc			<= 1'b0;
#100	ALUOp			<= 2'b10;	// depends on the function code, therefore irrelevant
#100	RegWrite 	<= 1'b1;
#100	DataMemRead 	<= 1'b0;
#100	DataMemWrite 	<= 1'b0;
	end
	//Load instruction
	else if (Opcode == 6'b100011) begin
#100	regdst			<= 1'b0;
#100	jump				<= 1'b0;
#100	memtoreg			<= 1'b1;
#100	branch			<= 1'b0;
#100	alusrc			<= 1'b1;
#100	ALUOp			<= 2'b00;		//addition operation, therefore ALUOp = 0
#100	RegWrite 	<= 1'b1;
#100	DataMemRead 	<= 1'b1;
#100	DataMemWrite 	<= 1'b0;	
	end
	//Store Instruction
	else if (Opcode == 6'b101011) begin
#100	regdst			<= 1'bx;
#100	jump				<= 1'b0;
#100	memtoreg			<= 1'bx;
#100	branch			<= 1'b0;
#100	alusrc			<= 1'b1;
#100	ALUOp			<= 2'b00;		//addition operation, therefore ALUOp = 0
#100	RegWrite 	<= 1'b0;
#100	DataMemRead 	<= 1'b0;
#100	DataMemWrite 	<= 1'b1;	
	end
	//beq - Branch on equal Instruction
	else if (Opcode == 6'b000100) begin
#100	regdst			<= 1'b0;
#100	jump				<= 1'b0;
#100	memtoreg			<= 1'b0;
#100	branch			<= 1'b1;
#100	alusrc			<= 1'b0;
#100	ALUOp			<= 2'b01;		//subtraction operation, therefore ALUOp = 1
#100	RegWrite 	<= 1'b0 ;
#100	DataMemRead 	<= 1'b0;
#100	DataMemWrite	<= 1'b0;	
	end
	//j - jump instruction
	else if (Opcode == 6'b000010) begin
#100	regdst			<= 1'b0;
#100	jump				<= 1'b1;
#100	memtoreg			<= 1'b0;
#100	branch			<= 1'b0;
#100	alusrc			<= 1'b0;
#100	ALUOp			<= 2'b00;	
#100	RegWrite 	<= 1'b0;
#100	DataMemRead 	<= 1'b0;
#100	DataMemWrite 	<= 1'b0;	
	end
	// addi - add immediate operations
	else if (Opcode == 6'b001000) begin
#100	regdst			<= 1'b0;
#100	jump				<= 1'b0;
#100	memtoreg			<= 1'b0;
#100	branch			<= 1'b0;
#100	alusrc			<= 1'b1;
#100	ALUOp			<= 2'b00;		//addition operation, therefore ALUOp = 0	
#100	RegWrite 	<= 1'b1;
#100	DataMemRead 	<= 1'b0;
#100	DataMemWrite	<= 1'b0;	
	end
	/*else begin
	regdst			<= 1'bx;
	jump				<= 1'bx;
	memtoreg			<= 1'bx;
	branch			<= 1'bx;
	alusrc			<= 1'bx;
	ALUOp			<= 2'bxx;		//addition operation, therefore ALUOp = 0	
	RegWrite 	<= 1'bx;
	DataMemRead 	<= 1'bx;
	DataMemWrite	<= 1'bx;	
	end 
end	
endmodule
 */