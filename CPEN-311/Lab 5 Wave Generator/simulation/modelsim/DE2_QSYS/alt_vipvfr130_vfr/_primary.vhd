library verilog;
use verilog.vl_types.all;
entity alt_vipvfr130_vfr is
    generic(
        BITS_PER_PIXEL_PER_COLOR_PLANE: integer := 8;
        NUMBER_OF_CHANNELS_IN_PARALLEL: integer := 3;
        NUMBER_OF_CHANNELS_IN_SEQUENCE: integer := 1;
        MAX_IMAGE_WIDTH : integer := 1920;
        MAX_IMAGE_HEIGHT: integer := 1080;
        MEM_PORT_WIDTH  : integer := 256;
        RMASTER_FIFO_DEPTH: integer := 128;
        RMASTER_BURST_TARGET: integer := 64;
        CLOCKS_ARE_SEPARATE: integer := 1
    );
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        master_clock    : in     vl_logic;
        master_reset    : in     vl_logic;
        master_address  : out    vl_logic_vector(31 downto 0);
        master_burstcount: out    vl_logic_vector;
        master_readdata : in     vl_logic_vector;
        master_read     : out    vl_logic;
        master_readdatavalid: in     vl_logic;
        master_waitrequest: in     vl_logic;
        slave_address   : in     vl_logic_vector(4 downto 0);
        slave_write     : in     vl_logic;
        slave_writedata : in     vl_logic_vector(31 downto 0);
        slave_read      : in     vl_logic;
        slave_readdata  : out    vl_logic_vector(31 downto 0);
        slave_irq       : out    vl_logic;
        dout_ready      : in     vl_logic;
        dout_valid      : out    vl_logic;
        dout_data       : out    vl_logic_vector;
        dout_startofpacket: out    vl_logic;
        dout_endofpacket: out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of BITS_PER_PIXEL_PER_COLOR_PLANE : constant is 1;
    attribute mti_svvh_generic_type of NUMBER_OF_CHANNELS_IN_PARALLEL : constant is 1;
    attribute mti_svvh_generic_type of NUMBER_OF_CHANNELS_IN_SEQUENCE : constant is 1;
    attribute mti_svvh_generic_type of MAX_IMAGE_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of MAX_IMAGE_HEIGHT : constant is 1;
    attribute mti_svvh_generic_type of MEM_PORT_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of RMASTER_FIFO_DEPTH : constant is 1;
    attribute mti_svvh_generic_type of RMASTER_BURST_TARGET : constant is 1;
    attribute mti_svvh_generic_type of CLOCKS_ARE_SEPARATE : constant is 1;
end alt_vipvfr130_vfr;
