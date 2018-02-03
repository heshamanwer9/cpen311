library verilog;
use verilog.vl_types.all;
entity alt_vipitc130_common_fifo is
    generic(
        DATA_WIDTH      : integer := 20;
        FIFO_DEPTH      : integer := 1920;
        CLOCKS_ARE_SAME : integer := 0;
        DATA_WIDTHU     : vl_notype
    );
    port(
        wrclk           : in     vl_logic;
        rdreq           : in     vl_logic;
        aclr            : in     vl_logic;
        rdclk           : in     vl_logic;
        wrreq           : in     vl_logic;
        data            : in     vl_logic_vector;
        rdusedw         : out    vl_logic_vector;
        rdempty         : out    vl_logic;
        wrusedw         : out    vl_logic_vector;
        wrfull          : out    vl_logic;
        q               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of FIFO_DEPTH : constant is 1;
    attribute mti_svvh_generic_type of CLOCKS_ARE_SAME : constant is 1;
    attribute mti_svvh_generic_type of DATA_WIDTHU : constant is 3;
end alt_vipitc130_common_fifo;
