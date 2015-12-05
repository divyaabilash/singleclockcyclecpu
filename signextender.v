`timescale 10ns/1ns
module signextender (input_data,output_data);
input [15:0] input_data;
output reg [31:0] output_data;

always  begin 
//output_data[15:0] = input_data[15:0];
//output_data[31:16] = {16 {input_data[15]}};
//output_data[31:0] = {{16{input_data[15]}},input_data[15:0] };
//output_data <= $signed(input_data);
 output_data = input_data;
//output_data[31] = input_data[15];
end 
endmodule
