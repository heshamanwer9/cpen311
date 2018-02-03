library verilog;
use verilog.vl_types.all;
entity alt_vipvfr130_prc is
    generic(
        BPS             : integer := 8;
        CHANNELS_IN_PAR : integer := 3;
        CHANNELS_IN_SEQ : integer := 1;
        MAX_WIDTH       : integer := 1920;
        MAX_HEIGHT      : integer := 1080;
        MEM_PORT_WIDTH  : integer := 256;
        RMASTER_FIFO_DEPTH: integer := 128;
        RMASTER_BURST_TARGET: integer := 64;
        CLOCKS_ARE_SEPARATE: integer := 1;
        READY_LATENCY   : integer := 1
    );
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        master_av_clock : in     vl_logic;
        master_av_reset : in     vl_logic;
        master_av_address: out    vl_logic_vector(31 downto 0);
        master_av_burstcount: out    vl_logic_vector;
        master_av_readdata: in     vl_logic_vector;
        master_av_read  : out    vl_logic;
        master_av_readdatavalid: in     vl_logic;
        master_av_waitrequest: in     vl_logic;
        control_av_address: in     vl_logic_vector(2 downto 0);
        control_av_write: in     vl_logic;
        control_av_writedata: in     vl_logic_vector(31 downto 0);
        control_av_read : in     vl_logic;
        control_av_readdata: out    vl_logic_vector(31 downto 0);
        control_av_irq  : out    vl_logic;
        dout_ready      : in     vl_logic;
        dout_valid      : out    vl_logic;
        dout_data       : out    vl_logic_vector;
        dout_startofpacket: out    vl_logic;
        dout_endofpacket: out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of BPS : constant is 1;
    attribute mti_svvh_generic_type of CHANNELS_IN_PAR : constant is 1;
    attribute mti_svvh_generic_type of CHANNELS_IN_SEQ : constant is 1;
    attribute mti_svvh_generic_type of MAX_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of MAX_HEIGHT : constant is 1;
    attribute mti_svvh_generic_type of MEM_PORT_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of RMASTER_FIFO_DEPTH : constant is 1;
    attribute mti_svvh_generic_type of RMASTER_BURST_TARGET : constant is 1;
    attribute mti_svvh_generic_type of CLOCKS_ARE_SEPARATE : constant is 1;
    attribute mti_svvh_generic_type of READY_LATENCY : constant is 1;
end alt_vipvfr130_prc;
