module fsm_4( clk, stop, LEDG, LEDR, secret_key, cracked ); //secret_key = 300000 -> 3FFFFF

// Input/Outputs
input clk;
input stop;
output [7:0] LEDG;
output [17:0] LEDR;
output [23:0] secret_key;
output cracked;

// Data to memory modules
reg[23:0] secret_key = 24'h300000;
reg[7:0] address, data, address_m, address_d, data_d;
reg[7:0] q_i, q_j;
logic[7:0] secret[3];
reg[7:0] i, j, k; 
reg wren, wren_d, filled_flag, swapped_flag, swapped_flag2, cracked, start, tmp; //state flags
wire[7:0] q, q_m, q_d;

// Memory modules
s_memory s_mem( .address(address), .clock(clk), .data(data), .wren(wren), .q(q) );
e_memory e_mem( .address(address_m), .clock(clk), .q(q_m) );
d_memory d_mem( .address(address_d), .clock(clk), .data(data_d), .wren(wren_d), .q(q_d) );

typedef enum { init, init_write, write, wait1, set_secret, init_loop1, init_swap, wait2, store_i, calc_j, wait3, read_j,
					write_at_j, wait4, write_at_i, wait5, incr, wait6, init_loop2, init_swap2, wait7, store_i2,
					calc_j2, wait8, read_j2, write_at_j2, wait9, write_at_i2, wait10, get_f, wait11, write_k,
					wait12, check_k, incr_secret, incr2, done } state_type;
	
// State declarations
state_type state;

// Output states to LEDs -- LEDG0(fill array), LEDG1(swap1), LEDG2(swap2), LEDG7(cracked), LEDR0(failed)
assign LEDG[0] = filled_flag;
assign LEDG[1] = swapped_flag;
assign LEDG[2] = swapped_flag2;
assign LEDG[7] = cracked;
assign LEDR[0] = ~cracked;

// Assign secret bits - counter to cycle through keys
assign secret[0] = secret_key[23:16]; 
assign secret[1] = secret_key[15:8];
assign secret[2] = secret_key[7:0];

always_ff @(posedge clk)
begin
			if(stop == 1) begin
				state <= done;
			end
			
			case(state) 
			 
			//=======================================================
			// INITIALIZE VARIABLES 
			//=======================================================
				init: begin
					i <= 8'b0;
					j <= 8'b0;
					k <= 8'b0;
					address <= 8'b0;
					address_m <= 8'b0;
					address_d <= 8'b0;
					data <= 8'b0;
					data_d <= 8'b0;
					filled_flag <= 1'b0;
					swapped_flag <= 1'b0; 
					swapped_flag2 <= 1'b0;
					cracked <= 1'b0;
					wren <= 1'b0;
					wren_d <= 1'b0;
					state <= init_write;
				end
				
			//=======================================================
			// FILL MEMORY ARRAY
			//=======================================================
				init_write: begin
					address <= i;
					data <= i;
					
					wren <= 1'b1;
					state <= write;
				end
				
				write: begin
					if(i > 8'b11111110) begin //done filling array
						filled_flag <= 1'b1;
						state <= wait1;
					end
					else begin //keep filling
						i <= i + 1'b1;
						state <= init_write;
					end
				end
				
				// DELAY
				wait1: begin
					wren <= 1'b0;
					
					if(filled_flag == 1'b1) state <= init_loop1;
					else state <= wait1;
				end
				
			//=======================================================
			// FIRST SWAP  
			//=======================================================
				// INITIALIZE
				init_loop1: begin
					i <= 8'b0;
					j <= 8'b0;
					q_i <= 8'b0;
					state <= init_swap;
				end
				
				// Go to address i
				init_swap: begin
					address <= i;
					
					state <= wait2;
				end
				
				// DELAY
				wait2: begin
					state <= store_i;
				end
				
				// GET s[i]
				store_i: begin
					q_i <= q;
					
					state <= calc_j;
				end
				
				// GET j
				calc_j: begin
					address <= j + q_i + secret[i % 3]; //don't change
					j <= j + q_i + secret[i % 3];
				
					state <= wait3;
				end
				
				// DELAY
				wait3: begin
					state <= read_j;
				end
				
				// GET s[j]
				read_j: begin
					q_j <= q;
					
					state <= write_at_j;
				end
				
				// WRITE s[i] at j
				write_at_j: begin
					data <= q_i;
					wren <= 1'b1;
					
					state <= wait4;
				end
				
				// DELAY
				wait4: begin
					wren <= 1'b0;
					state <= write_at_i;
				end
				
				// WRITE s[j] at i
				write_at_i: begin
					address <= i;
					data <= q_j;
					
					wren <= 1'b1;
					state <= wait5;
				end
				
				// DELAY
				wait5: begin
					wren <= 1'b0;
					state <= incr;
				end
				
				// INCREMENT i 
				incr: begin
					if(i <= 8'b11111110) begin
						i <= i + 1'b1;
						state <= init_swap;
					end
					else begin
						swapped_flag <= 1'b1;
						state <= wait6;
					end
				end
				
				// DONE SWAP LOOP 1 AND WAIT
				wait6: begin
					wren <= 1'b0;
					
					if(swapped_flag == 1'b1) state <= init_loop2;
					else state <= wait6;
				end
				
			//=======================================================
			// SECOND SWAP 
			//=======================================================
				// INITIALIZE
				init_loop2: begin
					i <= 8'b0;
					j <= 8'b0;
					k <= 8'b0;
					q_i <= 8'b0;
					q_j <= 8'b0;
					state <= init_swap2;
				end
				
				// SET e_mem d_mem ADDRESS TO K, s_mem ADDRESS TO i + 1
				init_swap2: begin
					address <= i + 1;
					address_m <= k;
					address_d <= k;
					i <= i + 1;
					
					state <= wait7;
				end
				
				// DELAY
				wait7: begin
					state <= store_i2;
				end
				
				// GET s[i+1]
				store_i2: begin
					q_i <= q;

					state <= calc_j2;
				end
				
				// CALC j
				calc_j2: begin
					address <= j + q_i; //don't change
					j <= j + q_i;
					
					state <= wait8;
				end
				
				// DELAY
				wait8: begin
					state <= read_j2;
				end
				
				// GET s[j]
				read_j2: begin
					q_j <= q;
					
					state <= write_at_j2;
				end
				
				// WRITE s[i+1] at j
				write_at_j2: begin
					data <= q_i;
					wren <= 1'b1;
					
					state <= wait9;
				end
				
				// DELAY
				wait9: begin
					wren <= 1'b0;
					state <= write_at_i2;
				end
				
				// WRITE s[j] at i
				write_at_i2: begin
					address <= i;
					data <= q_j;
					
					wren <= 1'b1;
					state <= wait10;
				end
				
				// DELAY
				wait10: begin
					wren <= 1'b0;
					state <= get_f;
				end
				
				// GO TO ADDRESS s[i] + s[j]
				get_f: begin
					address <= q_i + q_j;
					state <= wait11;
				end
				
				// DELAY
				wait11: begin
					state <= write_k;
				end
				
				// CALC decrpted_output[k]
				write_k: begin
					data_d <= q ^ q_m;
					wren_d <= 1'b1;
					state <= wait12;
				end
				
				// DELAY
				wait12: begin
					wren_d <= 1'b0;
					state <= check_k;
				end
				
				// CHECK IF DECRYPTED OUTPUT K BETWEEN 97-122 OR IS 32 
				check_k: begin
					if( data_d == 8'd32 || (data_d >= 8'd97 && data_d <= 8'd122) )
						state <= incr2; //is within range, get next swap value
					else
						state <= incr_secret; //is out of range, try next secret_key
				end
				
				// INCREMENT SECRET_KEY
				incr_secret: begin
					if(secret_key > 24'h3FFFFF) begin //if all secret keys iterated through, crack failed
						cracked <= 1'b0;
						state <= done;
					end
					else begin //try next secret_key
						secret_key <= secret_key + 1;
						state <= init;
					end
				end					
						
				// INCREMENT K IF NOT DONE SWAPPING
				incr2: begin
					if(k < 8'b00011111) begin //keep swapping
						k <= k + 1'b1;
						state <= init_swap2;
					end
					else begin //done swapping, crack attempt over, all k within range 
						swapped_flag2 <= 1'b1;
						cracked <= 1'b1;
						state <= done;
					end
				end
				
				// DONE SWAP AND WAIT 
				done: begin
					state <= done; //loop 
				end
				
				default: state <= init;
				endcase

end

endmodule
			