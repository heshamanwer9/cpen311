module swap_mem( clk, switches, address, data, wren, q, mem_filled_flag, swapped_flag, secret, data_i );

input clk;
input [17:0] switches;
output [7:0] address;
output [7:0] data;
output wren;
input [7:0] q;
input mem_filled_flag;
output swapped_flag;
output secret;
output data_i;

reg [7:0] address;
reg [7:0] data;
reg wren;
wire [7:0] q;
wire mem_filled_flag;
reg swapped_flag;
wire [23:0] secret_key;
reg [7:0] secret; 
reg [7:0] addr_i;
reg [7:0] addr_j;
reg [7:0] data_i;
reg [7:0] data_j;
reg [7:0] temp;

reg [3:0] state; 

parameter [3:0] init			 		= 4'b0000;
parameter [3:0] set_key				= 4'b0001;
parameter [3:0] calc_j 				= 4'b0010;
parameter [3:0] wait1				= 4'b0011;
parameter [3:0] read_at_j			= 4'b0100;
parameter [3:0] swap_i_j			= 4'b0101;
parameter [3:0] write_j				= 4'b0110;
parameter [3:0] wait2				= 4'b0111;
parameter [3:0] write_i 			= 4'b1000;
parameter [3:0] wait3				= 4'b1001;
parameter [3:0] incr_addr 			= 4'b1010;
parameter [3:0] compare 			= 4'b1011;
parameter [3:0] done					= 4'b1100;

assign secret_key = {14'b0, switches[9:0]};

always@(posedge clk) begin
	case(state)
		init: begin
			addr_i = 8'b0;
			addr_j = 8'b0;
			address = addr_i;
			
			wren <= 1'b0;
			swapped_flag <= 1'b0;
			
			if(mem_filled_flag == 1'b0)
				state <= init;
			else 
				state <= set_key;
		end
		
		set_key: begin
			data_i = q;
			
			case(addr_i % 8'd3)
				0: secret <= secret_key[23:16];
				1: secret <= secret_key[15:8];
				2: secret <= secret_key[7:0];
			endcase
			
			wren <= 1'b0;
			swapped_flag <= 1'b0;
			state <= calc_j;
		end
		
		calc_j: begin
			addr_j <= addr_j + data_i + secret;
			
			wren <= 1'b0;
			swapped_flag <= 1'b0;
			state <= wait1;
		end
		
		wait1: begin
			address <= addr_j;
			
			wren <= 1'b0;
			swapped_flag <= 1'b0;
			state <= read_at_j;
		end
		
		read_at_j: begin
			data_j <= q;
		
			wren <= 1'b0;
			swapped_flag <= 1'b0;
			state <= write_j;
		end
		
		/**
		swap_i_j: begin
			temp = data_j;
			data_j = data_i;
			data_i = temp;
		
			wren <= 1'b0;
			swapped_flag <= 1'b0;
		end*/
		
		write_j: begin
			data <= data_i;
			
			wren <= 1'b1;
			swapped_flag <= 1'b0;
			state <= wait2;
		end
		
		wait2: begin
			wren <= 1'b1;
			swapped_flag <= 1'b0;
			state <= write_i;
		end
		
		write_i: begin
			wren <= 1'b0;
			address <= addr_i;
			data <= data_j;
			
			swapped_flag <= 1'b0;
			state <= wait3;
		end
		
		wait3: begin
			wren <= 1'b1;
			swapped_flag <= 1'b0;
			state <= incr_addr;
		end
		
		incr_addr: begin
			addr_i <= addr_i + 8'd1;
			
			wren <= 1'b0;
			swapped_flag <= 1'b0;
			
			if(addr_i <= 8'b00000100)
				state <= compare;
			else
				state <= done;
		end
		
		compare: begin
			address <= addr_i;
			data_i <= q;
			
			wren <= 1'b0;
			swapped_flag <= 1'b0;
			state <= set_key;
		end
		
		done: begin
			wren <= 1'b0;
			swapped_flag <= 1'b1;
			state <= done;
		end
		
		default: state <= init;
	endcase
end

endmodule