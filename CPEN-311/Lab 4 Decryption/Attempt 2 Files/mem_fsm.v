module fsm( clk, KEY, SW, LEDG, LEDR );

// Input/Outputs
input clk;
input[3:0] KEY;
input[17:0] SW;
output[7:0] LEDG;
output[17:0] LEDR;

// Data to memory modules
reg[7:0] address, data;
reg[7:0] q_i, q_j;
byte secret[3];
reg[7:0] i, j, k; 
reg wren, filled_flag, swapped_flag; //state flags
wire[7:0] q;

// Memory modules
s_memory s_mem( .address(address), .clock(clk), .data(data), .wren(wren), .q(q) );

// State declarations
reg[3:0] state;

parameter[3:0] init 			= 4'b1111;
parameter[3:0] init_write  = 4'b0000;
parameter[3:0] write			= 4'b1100;
parameter[3:0] wait1			= 4'b0001;
parameter[3:0] init_swap	= 4'b0010;
parameter[3:0] store_i 		= 4'b1100;
parameter[3:0] calc_j		= 4'b0011;
parameter[3:0] wait2			= 4'b0100;
parameter[3:0] read_j 		= 4'b0101;
parameter[3:0] write_at_j 	= 4'b0110;
parameter[3:0] wait3			= 4'b0111;
parameter[3:0] write_at_i 	= 4'b1000;
parameter[3:0] wait4			= 4'b1001;
parameter[3:0] incr 			= 4'b1010;
parameter[3:0] done 			= 4'b1011; 

// Output states to LEDs
assign LEDR[7:0] = state;
assign LEDR[15:8] = q;
assign LEDG[0] = filled_flag;
assign LEDG[1] = swapped_flag;

assign secret[0] = 8'b0;
assign secret[1] = SW[15:8];
assign secret[2] = SW[7:0];

always_ff @(posedge clk)
begin
	if(!KEY[0]) begin
		/* INITIALIZE VARIABLES */
		i <= 8'b0;
		j <= 8'b0;
		k <= 8'b0;
		address <= 8'b0;
		data <= 8'b0;
		filled_flag <= 1'b0;
		swapped_flag <= 1'b0; 
		wren <= 1'b0;
	end 
	else begin
	
		case(state) 
			
		/* INITIAL FILL MEMORY ARRAY */
		init_write: begin
			address <= i;
			data <= i;
			
			wren <= 1'b1;
			state <= write;
		end
		
		write: begin
			if(i > 8'b11111110) begin
				filled_flag <= 1'b1;
				state <= wait1;
			end
			else begin
				i <= i + 1'b1;
				state <= init_write;
			end
		end
		
		/* DELAY */
		wait1: begin
			wren <= 1'b0;
			
			if(filled_flag == 1'b1) state <= init_swap;
			else state <= wait1;
		end
		
		/* INITIALIZE VARIABLES AGAIN FOR SWAP */
		init_swap: begin
			i <= 8'b0;
			address <= i;
			
			state <= store_i;
		end
		
		store_i: begin
			q_i <= q;
			state <= calc_j;
		end
		
		/* GET ADDRESS J */
		calc_j: begin
			j <= j + q_i + secret[i % 3];
			address <= j;
			
			state <= wait2;
		end
		
		/* DELAY */
		wait2: begin
			state <= read_j;
		end
		
		/* READ AT J */
		read_j: begin
			q_j <= q;
			
			state <= write_at_j;
		end
		
		/* WRITE I TO J */
		write_at_j: begin
			data <= q_i;
			wren <= 1'b1;
			
			state <= wait3;
		end
		
		/* DELAY */
		wait3: begin
			wren <= 1'b0;
			state <= write_at_i;
		end
		
		/* WRITE J TO I */
		write_at_i: begin
			address <= i;
			data <= q_j;
			
			wren <= 1'b1;
			state <= wait4;
		end
		
		/* DELAY */
		wait4: begin
			wren <= 1'b0;
			state <= incr;
		end
		
		/* INCREMENT ADDRESS IF NOT DONE SWAPPING */
		incr: begin
			if(i <= 8'b11111110) begin
				i <= i + 1'b1;
				address <= i;
				state <= store_i;
			end
			else begin
				swapped_flag <= 1'b1;
				state <= done;
			end
		end
		
		/* DONE SWAP AND WAIT */
		done: begin
			state <= done;
		end
		
		default: state <= init_write;
		endcase
	end
end

endmodule
			