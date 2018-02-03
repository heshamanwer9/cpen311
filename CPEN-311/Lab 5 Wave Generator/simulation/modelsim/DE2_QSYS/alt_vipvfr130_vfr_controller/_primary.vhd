library verilog;
use verilog.vl_types.all;
entity alt_vipvfr130_vfr_controller is
    generic(
        CONTROL_PACKET_RESOLUTION_REQUIREDWIDTH: integer := 16;
        CONTROL_PACKET_INTERLACED_REQUIREDWIDTH: integer := 4;
        PACKET_ADDRESS_WIDTH: integer := 32;
        PACKET_SAMPLES_WIDTH: integer := 32;
        PACKET_WORDS_WIDTH: integer := 32
    );
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        master_address  : out    vl_logic_vector(31 downto 0);
        master_write    : out    vl_logic;
        master_writedata: out    vl_logic_vector(31 downto 0);
        master_interrupt_recieve: in     vl_logic;
        go_bit          : in     vl_logic;
        running         : out    vl_logic;
        frame_complete  : out    vl_logic;
        next_bank       : in     vl_logic;
        ctrl_packet_width_bank0: in     vl_logic_vector;
        ctrl_packet_height_bank0: in     vl_logic_vector;
        ctrl_packet_interlaced_bank0: in     vl_logic_vector;
        vid_packet_base_address_bank0: in     vl_logic_vector;
        vid_packet_samples_bank0: in     vl_logic_vector;
        vid_packet_words_bank0: in     vl_logic_vector;
        ctrl_packet_width_bank1: in     vl_logic_vector;
        ctrl_packet_height_bank1: in     vl_logic_vector;
        ctrl_packet_interlaced_bank1: in     vl_logic_vector;
        vid_packet_base_address_bank1: in     vl_logic_vector;
        vid_packet_samples_bank1: in     vl_logic_vector;
        vid_packet_words_bank1: in     vl_logic_vector;
        width_of_next_vid_packet: out    vl_logic_vector;
        height_of_next_vid_packet: out    vl_logic_vector;
        interlaced_of_next_vid_packet: out    vl_logic_vector;
        do_control_packet: out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CONTROL_PACKET_RESOLUTION_REQUIREDWIDTH : constant is 1;
    attribute mti_svvh_generic_type of CONTROL_PACKET_INTERLACED_REQUIREDWIDTH : constant is 1;
    attribute mti_svvh_generic_type of PACKET_ADDRESS_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of PACKET_SAMPLES_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of PACKET_WORDS_WIDTH : constant is 1;
end alt_vipvfr130_vfr_controller;
