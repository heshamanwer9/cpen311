module lfsr( clk, rst, out ); //Do we need reset?

input clk, rst;
output reg[4:0] out = 5'b00001;

wire feedback;

assign feedback = (out[0] ^ out[2]); //XOR taps[0,2]

always@(posedge clk) begin

if(rst) 
	out = 5'b00001;

else 
	out = {feedback, out[4:1]};

end
endmodule
