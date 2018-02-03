library verilog;
use verilog.vl_types.all;
entity alt_vipvfr130_vfr_control_packet_encoder is
    generic(
        BITS_PER_SYMBOL : integer := 8;
        SYMBOLS_PER_BEAT: integer := 3
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        din_ready       : out    vl_logic;
        din_valid       : in     vl_logic;
        din_data        : in     vl_logic_vector;
        din_sop         : in     vl_logic;
        din_eop         : in     vl_logic;
        dout_ready      : in     vl_logic;
        dout_valid      : out    vl_logic;
        dout_sop        : out    vl_logic;
        dout_eop        : out    vl_logic;
        dout_data       : out    vl_logic_vector;
        do_control_packet: in     vl_logic;
        width           : in     vl_logic_vector(15 downto 0);
        height          : in     vl_logic_vector(15 downto 0);
        interlaced      : in     vl_logic_vector(3 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of BITS_PER_SYMBOL : constant is 1;
    attribute mti_svvh_generic_type of SYMBOLS_PER_BEAT : constant is 1;
end alt_vipvfr130_vfr_control_packet_encoder;
