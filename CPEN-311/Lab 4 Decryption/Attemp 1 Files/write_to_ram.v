module write_mem( address, clk, fill_start_flag, data, wren, q, mem_filled_flag );

output [7:0] address;
input clk;
input fill_start_flag;
output [7:0] data; 
output wren;
input [7:0] q;
output mem_filled_flag;

reg [7:0] address;
wire fill_start_flag;
wire [7:0] data;
reg wren;
wire [7:0] q;
reg mem_filled_flag;

v
reg [3:0] state; //state register

//State definitions
parameter [2:0] init_write = 3'b001;
parameter [2:0] write_data	= 3'b010;
parameter [2:0] increment 	= 3'b011;

//output logic
assign data = address;

always@(posedge clk)
begin
	case(state)
		init_write: begin
				address <= 8'b0;
				wren <= 1'b0;
				mem_filled_flag <= 1'b0;
				
				state <= write_data;
		end //init_write
		
		write_data: begin
				wren <= 1'b1;
				mem_filled_flag <= 1'b0;
				
				state <= increment;
		end //write_data
		
		increment: begin
				wren <= 1'b0;
				if(address <= 8'b11111110) begin
					address <= address + 1;
					
					state <= write_data;
				end
				else begin 
					mem_filled_flag <= 1'b1;
				end
		end //increment
		
		default: state <= init_write;
	endcase
end

endmodule
