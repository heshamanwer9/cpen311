library verilog;
use verilog.vl_types.all;
entity alt_vipvfr130_common_stream_output is
    generic(
        DATA_WIDTH      : integer := 10
    );
    port(
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        dout_ready      : in     vl_logic;
        dout_valid      : out    vl_logic;
        dout_data       : out    vl_logic_vector;
        dout_sop        : out    vl_logic;
        dout_eop        : out    vl_logic;
        int_ready       : out    vl_logic;
        int_valid       : in     vl_logic;
        int_data        : in     vl_logic_vector;
        int_sop         : in     vl_logic;
        int_eop         : in     vl_logic;
        enable          : in     vl_logic;
        synced          : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
end alt_vipvfr130_common_stream_output;
