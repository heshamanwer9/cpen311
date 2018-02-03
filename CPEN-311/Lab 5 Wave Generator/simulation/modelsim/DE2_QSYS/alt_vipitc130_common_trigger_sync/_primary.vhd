library verilog;
use verilog.vl_types.all;
entity alt_vipitc130_common_trigger_sync is
    generic(
        CLOCKS_ARE_SAME : integer := 0
    );
    port(
        input_rst       : in     vl_logic;
        input_clock     : in     vl_logic;
        rst             : in     vl_logic;
        sync_clock      : in     vl_logic;
        trigger_in      : in     vl_logic;
        ack_in          : in     vl_logic;
        trigger_out     : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CLOCKS_ARE_SAME : constant is 1;
end alt_vipitc130_common_trigger_sync;
