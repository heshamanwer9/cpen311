library verilog;
use verilog.vl_types.all;
entity alt_vipitc130_common_generic_count is
    generic(
        WORD_LENGTH     : integer := 12;
        \MAX_COUNT\     : integer := 1280;
        \RESET_VALUE\   : integer := 0;
        TICKS_WORD_LENGTH: integer := 1;
        TICKS_PER_COUNT : integer := 1
    );
    port(
        clk             : in     vl_logic;
        reset_n         : in     vl_logic;
        enable          : in     vl_logic;
        enable_ticks    : in     vl_logic;
        max_count       : in     vl_logic_vector;
        count           : out    vl_logic_vector;
        restart_count   : in     vl_logic;
        reset_value     : in     vl_logic_vector;
        enable_count    : out    vl_logic;
        start_count     : out    vl_logic;
        cp_ticks        : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WORD_LENGTH : constant is 1;
    attribute mti_svvh_generic_type of \MAX_COUNT\ : constant is 1;
    attribute mti_svvh_generic_type of \RESET_VALUE\ : constant is 1;
    attribute mti_svvh_generic_type of TICKS_WORD_LENGTH : constant is 1;
    attribute mti_svvh_generic_type of TICKS_PER_COUNT : constant is 1;
end alt_vipitc130_common_generic_count;
