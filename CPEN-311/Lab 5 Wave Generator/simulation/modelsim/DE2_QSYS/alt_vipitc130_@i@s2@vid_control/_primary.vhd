library verilog;
use verilog.vl_types.all;
entity alt_vipitc130_IS2Vid_control is
    generic(
        USE_CONTROL     : integer := 1;
        NO_OF_MODES_INT : integer := 1;
        USED_WORDS_WIDTH: integer := 15
    );
    port(
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        av_write_ack    : in     vl_logic;
        mode_change     : in     vl_logic;
        mode_match      : in     vl_logic_vector;
        usedw           : in     vl_logic_vector;
        underflow_sticky: in     vl_logic;
        enable_resync   : in     vl_logic;
        genlocked       : in     vl_logic;
        enable          : out    vl_logic;
        clear_underflow_sticky: out    vl_logic;
        write_trigger   : out    vl_logic;
        write_trigger_ack: out    vl_logic;
        genlock_enable  : out    vl_logic_vector(1 downto 0);
        av_address      : in     vl_logic_vector(7 downto 0);
        av_read         : in     vl_logic;
        av_readdata     : out    vl_logic_vector(15 downto 0);
        av_write        : in     vl_logic;
        av_writedata    : in     vl_logic_vector(15 downto 0);
        av_waitrequest  : out    vl_logic;
        status_update_int: out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of USE_CONTROL : constant is 1;
    attribute mti_svvh_generic_type of NO_OF_MODES_INT : constant is 1;
    attribute mti_svvh_generic_type of USED_WORDS_WIDTH : constant is 1;
end alt_vipitc130_IS2Vid_control;
