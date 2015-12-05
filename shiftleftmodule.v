`timescale 10ns/1ns
module shiftleftmodule (input_shiftleftmodule, output_shiftleftmodule);
input [25:0] input_shiftleftmodule;
output reg  [27:0] output_shiftleftmodule;

//always @(*) begin
always begin
 output_shiftleftmodule = input_shiftleftmodule << 2;
end
endmodule
