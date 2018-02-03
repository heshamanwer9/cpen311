`default_nettype none
module ksa(

	//// CLOCK ////
   CLOCK_50,
	
	//// KEY ////
   KEY,    
	
	//// SWITCH ////
   SW,
	
	//// LED ////
   LEDR,
	LEDG,
	
	//// SEG7 ////
   HEX0,
   HEX1,
   HEX2,
   HEX3,
   HEX4,
   HEX5
	
);

//=======================================================
//  PORT declarations
//=======================================================

//////////// CLOCK //////////
input                       CLOCK_50;

//////////// LED //////////
output           [17:0]      LEDR;
output 			  [7:0]		  LEDG;

//////////// KEY //////////
input            [3:0]      KEY;

//////////// SW //////////
input           [17:0]      SW;

//////////// SEG7 //////////
output           [6:0]      HEX0;
output           [6:0]      HEX1;
output           [6:0]      HEX2;
output           [6:0]      HEX3;
output           [6:0]      HEX4;
output           [6:0]      HEX5;

//=======================================================
//  REG/WIRE declarations
//=======================================================
// Input and output declarations
logic CLK_50M;
logic [17:0] LEDR;
assign CLK_50M = CLOCK_50;

logic [7:0] address;
logic [7:0] data;
logic wren;
logic [7:0] q;
logic [7:0] fill_addr;
logic [7:0] fill_data;
logic fill_wren;
logic [7:0] fill_q;
logic [7:0] swap_addr;
logic [7:0] swap_data;
logic swap_wren;
logic [7:0] swap_q;
logic fsm_start_flag;
logic fill_start_flag;
logic mem_filled_flag;
logic swapped_flag;
logic [23:0] secret_key;
logic [7:0] secret;
logic [7:0] data_i;

s_memory memory_inst(
	.address(address),
	.clock(CLK_50M),
	.data(data),
	.wren(wren),
	.q(q)
);

//Control fsm
mem_fsm control(
	.clk(CLK_50M),
	.fill_addr(fill_addr),
	.fill_data(fill_data),
	.fill_wren(fill_wren),
	.fill_q(fill_q),
	.swap_addr(swap_addr),
	.swap_data(swap_data),
	.swap_wren(swap_wren),
	.swap_q(swap_q),
	.address(address),
	.data(data),
	.wren(wren),
	.q(q),
	.fsm_start_flag(1'b1),
	.fill_start_flag(fill_start_flag),
	.mem_filled_flag(mem_filled_flag),
	.swapped_flag(swapped_flag),
);

//Initial memory fill
write_mem write_to_ram(
.address(fill_addr),
.clk(CLK_50M),
.fill_start_flag(fill_start_flag),
.data(fill_data),
.wren(fill_wren),
.q(fill_q),
.mem_filled_flag(mem_filled_flag)
);

//Shuffle memory
swap_mem swap_ram(
.clk(CLK_50M),
.switches(SW),
.address(swap_addr),
.data(swap_data),
.wren(swap_wren),
.q(swap_q),
.mem_filled_flag(mem_filled_flag),
.swapped_flag(swapped_flag),
.secret(secret),
.data_i(data_i)
);

//Output secret key to LEDR
assign LEDR[7:0] = secret[7:0];
assign LEDR[15:8] = data_i;
assign LEDG[0] = mem_filled_flag;
assign LEDG[1] = swapped_flag;

//Seven Seg Display Decoder
logic [7:0] Seven_Seg_Val[7:0];
logic [3:0] Seven_Seg_Data[7:0];
    
SevenSegmentDisplayDecoder SevenSegmentDisplayDecoder_inst0(.ssOut(Seven_Seg_Val[0]), .nIn(Seven_Seg_Data[0]));
SevenSegmentDisplayDecoder SevenSegmentDisplayDecoder_inst1(.ssOut(Seven_Seg_Val[1]), .nIn(Seven_Seg_Data[1]));
SevenSegmentDisplayDecoder SevenSegmentDisplayDecoder_inst2(.ssOut(Seven_Seg_Val[2]), .nIn(Seven_Seg_Data[2]));
SevenSegmentDisplayDecoder SevenSegmentDisplayDecoder_inst3(.ssOut(Seven_Seg_Val[3]), .nIn(Seven_Seg_Data[3]));
SevenSegmentDisplayDecoder SevenSegmentDisplayDecoder_inst4(.ssOut(Seven_Seg_Val[4]), .nIn(Seven_Seg_Data[4]));
SevenSegmentDisplayDecoder SevenSegmentDisplayDecoder_inst5(.ssOut(Seven_Seg_Val[5]), .nIn(Seven_Seg_Data[5]));
SevenSegmentDisplayDecoder SevenSegmentDisplayDecoder_inst6(.ssOut(Seven_Seg_Val[6]), .nIn(Seven_Seg_Data[6]));
SevenSegmentDisplayDecoder SevenSegmentDisplayDecoder_inst7(.ssOut(Seven_Seg_Val[7]), .nIn(Seven_Seg_Data[7]));

endmodule
