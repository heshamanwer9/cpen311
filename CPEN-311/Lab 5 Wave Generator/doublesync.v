module doublesync( clk, in_async, out_sync );

input clk, in_async;
output out_sync;

reg FF1_reg, FF1_next, FF2_reg, FF2_next, out_sync;

always@(posedge clk) begin
		//at clock_50 edge flip flop transfers data bit
	FF1_reg <= FF1_next;
	FF2_reg <= FF2_next;

end

always@(*) begin
	//always hold in-data
	FF1_next <= in_async;
	FF2_next <= FF1_reg;
	
	//output 
	out_sync <= FF2_reg;
end

endmodule
