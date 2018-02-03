module signal_generator(inclk,reset,div_clk_count,outclk);

input inclk;
input reset;
input [31:0] div_clk_count;
output outclk;
reg outclk;
reg [31:0] counter;
wire [31:0] clk_count;

assign clk_count[31:0] = (div_clk_count -1)/2;

always@(posedge inclk) begin

if (reset == 1'b1) begin

if (counter == clk_count) begin
outclk <= ~outclk;
counter <= 32'h00000000;
end

else begin
counter <= counter + 32'h00000001;
end
end
else begin
outclk <= 1'b0;
counter <= 32'h00000000;
end
end
endmodule 