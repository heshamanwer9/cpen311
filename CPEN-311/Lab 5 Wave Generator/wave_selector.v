module wave_selector( clk, mod_select, sig_select, ask, bpsk, lfsr, sin, cos, saw, squ, mod_out, sig_out, fsk_flag );

input clk, lfsr;
input [1:0] mod_select, sig_select;
input [11:0] ask, bpsk, sin, cos, saw, squ;
output [11:0] mod_out, sig_out;
output reg fsk_flag = 1'b0;

always@(posedge clk) begin
	case(mod_select) 
		2'b00: begin
			mod_out <= ask;
			fsk_flag <= 1'b0;
		end
		2'b01: begin
			mod_out <= sin;
			fsk_flag <= 1'b1;
		end
		2'b10: begin 
			mod_out <= bpsk;
			fsk_flag <= 1'b0;
		end
		2'b11: begin
			if(lfsr == 1'b0) mod_out <= 12'b100000000000;
			else mod_out <= 12'b0;
			fsk_flag <= 1'b0;
		end
		default: mod_out <= 12'b0;
	endcase
	
	case(sig_select) 
		2'b00: sig_out <= sin;
		2'b01: sig_out <= cos;
		2'b10: sig_out <= saw;
		2'b11: sig_out <= squ;
		default: sig_out <= 12'b0;
	endcase
end

endmodule
