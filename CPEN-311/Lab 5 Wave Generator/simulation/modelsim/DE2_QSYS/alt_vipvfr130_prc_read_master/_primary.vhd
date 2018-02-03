library verilog;
use verilog.vl_types.all;
entity alt_vipvfr130_prc_read_master is
    generic(
        ADDR_WIDTH      : integer := 16;
        DATA_WIDTH      : integer := 16;
        MAX_BURST_LENGTH_REQUIREDWIDTH: integer := 11;
        READ_USED       : integer := 1;
        READ_FIFO_DEPTH : integer := 8;
        COMMAND_FIFO_DEPTH: integer := 8;
        READ_TARGET_BURST_SIZE: integer := 5;
        CLOCKS_ARE_SAME : integer := 1;
        BURST_WIDTH     : integer := 6;
        UNPACKED_WIDTH  : integer := 16
    );
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        ena             : in     vl_logic;
        stall           : out    vl_logic;
        cmd_addr        : in     vl_logic_vector;
        cmd_write_instead_of_read: in     vl_logic;
        cmd_burst_instead_of_single_op: in     vl_logic;
        cmd_length_of_burst: in     vl_logic_vector;
        cmd             : in     vl_logic;
        read_data       : out    vl_logic_vector;
        read            : in     vl_logic;
        discard_remaining_data_of_read_word: in     vl_logic;
        av_address      : out    vl_logic_vector;
        av_burstcount   : out    vl_logic_vector;
        av_writedata    : out    vl_logic_vector;
        av_write        : out    vl_logic;
        av_read         : out    vl_logic;
        av_clock        : in     vl_logic;
        av_reset        : in     vl_logic;
        av_readdata     : in     vl_logic_vector;
        av_readdatavalid: in     vl_logic;
        av_waitrequest  : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ADDR_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of MAX_BURST_LENGTH_REQUIREDWIDTH : constant is 1;
    attribute mti_svvh_generic_type of READ_USED : constant is 1;
    attribute mti_svvh_generic_type of READ_FIFO_DEPTH : constant is 1;
    attribute mti_svvh_generic_type of COMMAND_FIFO_DEPTH : constant is 1;
    attribute mti_svvh_generic_type of READ_TARGET_BURST_SIZE : constant is 1;
    attribute mti_svvh_generic_type of CLOCKS_ARE_SAME : constant is 1;
    attribute mti_svvh_generic_type of BURST_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of UNPACKED_WIDTH : constant is 1;
end alt_vipvfr130_prc_read_master;
