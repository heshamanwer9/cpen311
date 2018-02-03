library verilog;
use verilog.vl_types.all;
entity alt_vipitc130_common_sync is
    generic(
        CLOCKS_ARE_SAME : integer := 0;
        WIDTH           : integer := 1
    );
    port(
        rst             : in     vl_logic;
        sync_clock      : in     vl_logic;
        data_in         : in     vl_logic_vector;
        data_out        : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CLOCKS_ARE_SAME : constant is 1;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end alt_vipitc130_common_sync;
