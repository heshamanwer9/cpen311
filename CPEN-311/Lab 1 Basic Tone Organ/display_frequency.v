//Uppercase Letters
parameter character_A =8'h41;
parameter character_B =8'h42;
parameter character_C =8'h43;
parameter character_D =8'h44;
parameter character_E =8'h45;
parameter character_F =8'h46;
parameter character_G =8'h47;
parameter character_H =8'h48;
parameter character_I =8'h49;
parameter character_J =8'h4A;
parameter character_K =8'h4B;
parameter character_L =8'h4C;
parameter character_M =8'h4D;
parameter character_N =8'h4E;
parameter character_O =8'h4F;
parameter character_P =8'h50;
parameter character_Q =8'h51;
parameter character_R =8'h52;
parameter character_S =8'h53;
parameter character_T =8'h54;
parameter character_U =8'h55;
parameter character_V =8'h56;
parameter character_W =8'h57;
parameter character_X =8'h58;
parameter character_Y =8'h59;
parameter character_Z =8'h5A;

//Lowercase Letters
parameter character_lowercase_a= 8'h61;
parameter character_lowercase_b= 8'h62;
parameter character_lowercase_c= 8'h63;
parameter character_lowercase_d= 8'h64;
parameter character_lowercase_e= 8'h65;
parameter character_lowercase_f= 8'h66;
parameter character_lowercase_g= 8'h67;
parameter character_lowercase_h= 8'h68;
parameter character_lowercase_i= 8'h69;
parameter character_lowercase_j= 8'h6A;
parameter character_lowercase_k= 8'h6B;
parameter character_lowercase_l= 8'h6C;
parameter character_lowercase_m= 8'h6D;
parameter character_lowercase_n= 8'h6E;
parameter character_lowercase_o= 8'h6F;
parameter character_lowercase_p= 8'h70;
parameter character_lowercase_q= 8'h71;
parameter character_lowercase_r= 8'h72;
parameter character_lowercase_s= 8'h73;
parameter character_lowercase_t= 8'h74;
parameter character_lowercase_u= 8'h75;
parameter character_lowercase_v= 8'h76;
parameter character_lowercase_w= 8'h77;
parameter character_lowercase_x= 8'h78;
parameter character_lowercase_y= 8'h79;
parameter character_lowercase_z= 8'h7A;

module display_frequency(switch_data,frequency,note_first_ltr,note_second_ltr);

input  reg [3:1] switch_data;
output reg [3:0] frequency; 
output reg [8:0] note_first_ltr;
output reg [8:0] note_second_ltr;

always @ *

begin
	case(switch_data)
		3'b000:
			begin 
				frequency = 4'h0587;
				note_first_ltr = character_D;
				note_second_ltr = character_lowercase_o;
			end
		3'b001:
			begin
				frequency = 4'h0523;
				note_first_ltr = character_R;
				note_second_ltr = character_lowercase_e;
			end
		3'b010:
			begin	
				frequency = 4'h0659;
				note_first_ltr = character_M;
				note_second_ltr = character_lowercase_i;
			end
		3'b011:
			begin
				frequency = 4'h0698;
				note_first_ltr = character_F;
				note_second_ltr = character_lowercase_a;
			end
		3'b100:
			begin
				frequency = 4'h0783;
				note_first_ltr = character_S;
				note_second_ltr = character_lowercase_o;
			end
		3'b101:
			begin
				frequency = 4'h0987;
				note_first_ltr = character_L;
				note_second_ltr = character_lowercase_a;
			end
		3'b110:
			begin
				frequency = 4'h0880;
				note_first_ltr = character_S;
				note_second_ltr = character_lowercase_i;
			end
		3'b111:
			begin
				frequency = 4'h1046;
				note_first_ltr = character_D;
				note_second_ltr = character_lowercase_o;
			end
	endcase
end

endmodule