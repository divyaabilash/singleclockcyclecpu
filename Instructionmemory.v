`timescale 10ns/1ns

module Instructionmemory (clk, InstructionAddress, Instructions );
input [31:0] InstructionAddress;
input clk;
output reg [31:0] Instructions;
reg [31:0] Instruction_memory[4095:0];
/*
initial begin 
//add $t0,$t1,t2
Instruction_memory[0]=32'b00000001001010100100000000100000;
//add $t1,$s1,$s2
Instruction_memory[1]=32'b00000000001000100100000000100000;
//lw $8,0x60($10)
Instruction_memory[2]=32'b100011 01010 01000 0000000001100000;
////sw $t3,8($t0)
Instruction_memory[3]=32'b101011 01000 01011 0000000000001111;

//beq beq $t4, $t5, NEXT

Instruction_memory[4]=32'b000100 01100 01101 0000000000001000;

/*
Instruction_memory[0] = 32'b00000000001000000001000000100000; // loading the add instruction
Instruction_memory[1] = 32'b00000000001000100000000000100101; 
Instruction_memory[2] = 32'b00000000000000100000100000100000;
Instruction_memory[3] = 32'b00000000001000000001000000100000; 
//Instruction_memory[1] = 32'b00000010011101011000000000100111; // loading the nor instruction
//Instruction_memory[2] = 32'b00000010011101011000000000100010; // loading the sub instruction
*/
initial begin
 Instruction_memory[0] = 32'h00221820; //000000 00001 00010 00011 00000 100000 = add $a3,$a1,$a2
 Instruction_memory[1] = 32'hAC010000; //101011 00000 00001 0000000000000000 = sw $a1,0($ao)
 Instruction_memory[2] = 32'h8C240000; //100011 00001 00100 0000000000000000 = lw $a4,0($a1)
 Instruction_memory[3]= 32'h10210003; // 000100 00001 00001 0000000000000011 = beq $a1,$a1,1
 Instruction_memory[4]= 32'h00001820; //000000 00000 00000 00011 00000 100000 = add $a3,$a0,$a0
 Instruction_memory[5]= 32'h00411822; //000000 00010 00001 00011 00000 100010 = sub $a3,$a2,$a1
 Instruction_memory[6]= 32'h00001820; //000000 00000 00000 00011 00000 100000 = add $a3,$a0,$a0
 Instruction_memory[7]= 32'h00411822; //000000 00010 00001 00011 00000 100010 = sub $a3,$a2,$a1
 Instruction_memory[8]= 32'h00001820; //000000 00000 00000 00011 00000 100000 = add $a3,$a0,$a0
 Instruction_memory[9]= 32'h00411822; //000000 00010 00001 00011 00000 100010 = sub $a3,$a2,$a1
 Instruction_memory[10] = 32'h08000000;			//00001000000000000000000000000000 = j 0

//1000 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
end


always @(posedge clk) begin
//always @(*) begin
// Instructions <= Instruction_memory[InstructionAddress];
#500 Instructions <= Instruction_memory[InstructionAddress];
end
endmodule
