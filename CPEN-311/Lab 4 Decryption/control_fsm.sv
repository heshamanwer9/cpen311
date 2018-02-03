module control_fsm ( LEDG1, LEDG2, LEDG3, LEDG4, LEDR1, LEDR2, LEDR3, LEDR4, secret_key1, secret_key2, secret_key3, secret_key4, 
					cracked1, cracked2, cracked3, cracked4, LEDG, LEDR, secret_key, cracked, stop );
					
input cracked1, cracked2, cracked3, cracked4;
input[7:0] LEDG1, LEDG2, LEDG3, LEDG4;
input[17:0] LEDR1, LEDR2, LEDR3, LEDR4;
input[23:0] secret_key1, secret_key2, secret_key3, secret_key4;
output logic [7:0] LEDG;
output logic [17:0] LEDR;
output logic [23:0] secret_key;
output logic cracked;
output logic stop;

always@(*) begin
	if(cracked1 == 1'b1) begin
		cracked <= 1'b1;
		stop <= 1'b1;
		LEDG <= LEDG1;
		LEDR[17] <= 1'b1; 
		LEDR[0] <= 1'b0;
		secret_key <= secret_key1;
	end
	
	else if(cracked2 == 1'b1) begin
		cracked <= 1'b1;
		stop <= 1'b1;
		LEDG <= LEDG2;
		LEDR[17:16] <= 2'b11; 
		LEDR[0] <= 1'b0;
		secret_key <= secret_key2;
	end
	
	else if(cracked3 == 1'b1) begin
		cracked <= 1'b1;
		stop <= 1'b1;
		LEDG <= LEDG3;
		LEDR[17:15] <= 3'b111; 
		LEDR[0] <= 1'b0;
		secret_key <= secret_key3;
	end
	
	else if(cracked4 == 1'b1) begin
		cracked <= 1'b1;
		stop <= 1'b1;
		LEDG <= LEDG4;
		LEDR[17:14] <= 4'b1111; 
		LEDR[0] <= 1'b0;
		secret_key <= secret_key4;
	end
	
	else if(LEDR1[0] == 1'b1 && LEDR2[0] == 1'b1 && LEDR3[0] == 1'b1 && LEDR4[0] == 1'b1) begin //fail flags
		cracked <= 1'b0;
		LEDR[0] <= 1'b1;
		LEDR[17:14] <= 4'b0;
	end
end

endmodule
