module DDS( clk, mod_bit, phase_incr, ask_out, bpsk_out, sin_out, cos_out, squ_out, saw_out );

input clk, mod_bit;
input [31:0] phase_incr;
output [11:0] ask_out, bpsk_out, sin_out, cos_out, squ_out, saw_out;

wire [31:0] phase_incr;
reg [11:0] ask_out, bpsk_out;
wire [11:0] sin_out, cos_out, squ_out, saw_out;

//Power up reset regs
reg pup_rst;
reg [24:0] pup_count = 25'd0;

wire rst = pup_rst;

//Waveform_gen instantiation
waveform_gen waveform(
	.clk(clk),
	.reset(rst), //async
	.en(1'b1),
	.phase_inc(phase_incr),
	.sin_out(sin_out),
	.cos_out(cos_out),
	.squ_out(squ_out),
	.saw_out(saw_out)
);

always@(posedge clk) begin //?
	//Power up reset logic
	pup_count <= pup_count + 1'd1;
	if(pup_count == 25'd25000000) pup_rst <= 1'b1;
	
	//modulation
	if(mod_bit == 1'b0) begin
		ask_out <= 12'b0;
		bpsk_out <= (~sin_out[11:0] + 12'b1); //2's complement for phase shift keying
	end	
	else begin
		ask_out <= sin_out;
		bpsk_out <= sin_out;
	end
	
end
endmodule

	