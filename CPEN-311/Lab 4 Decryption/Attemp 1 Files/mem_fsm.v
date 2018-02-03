module mem_fsm ( clk, fill_addr, fill_data, fill_wren, fill_q, swap_addr, swap_data, swap_wren, swap_q, address, data, wren, q, fsm_start_flag, fill_start_flag, 
							mem_filled_flag, swapped_flag );

input clk;
input [7:0] fill_addr;
input [7:0] fill_data;
input fill_wren;
output [7:0] fill_q;
input [7:0] swap_addr;
input [7:0] swap_data;
input swap_wren;
output [7:0] swap_q;
output [7:0] address;
output [7:0] data;
output wren;
input [7:0] q;
input fsm_start_flag;
output fill_start_flag;
input mem_filled_flag;
input swapped_flag;

wire [7:0] fill_addr;
wire [7:0] fill_data;
wire fill_wren;
reg [7:0] fill_q;
wire [7:0] swap_addr;
wire [7:0] swap_data;
wire swap_wren;
reg [7:0] swap_q;
reg [7:0] address;
reg [7:0] data;
reg wren;
wire [7:0] q;
reg fill_start_flag;
wire mem_filled_flag;
wire swapped_flag;

reg [2:0] state;

parameter [1:0] init = 2'b00;
parameter [1:0] fill = 2'b01;
parameter [1:0] swap = 2'b10;
parameter [1:0] next = 2'b11;

always @ (posedge clk)
begin
	case(state)
		init: begin
			if(fsm_start_flag == 1'b1) begin
				fill_start_flag <= 1'b1;
			end
			
			state <= fill;
		end //init
		
		fill: begin
			fill_start_flag <= 1'b0; //??????
			address <= fill_addr;
			data <= fill_data;
			wren <= fill_wren;
			fill_q <= q;
			
			if(mem_filled_flag == 1'b0) begin
				state <= fill;
			end 
			else if(mem_filled_flag == 1'b1 && swapped_flag == 1'b0) begin
				state <= swap;
			end 		
		end //fill
		
		swap: begin
			fill_start_flag <= 1'b0;
			address <= swap_addr;
			data <= swap_data;
			wren <= swap_wren;
			swap_q <= q;
			
			if(swapped_flag == 1'b0) begin
				state <= swap;
			end 
			else begin
				state <= next;
			end
		end //swap
		
		next: begin
			fill_start_flag <= 1'b0;
		end //next
	
		default: state <= init;
	endcase
end

endmodule

		
		
	