library verilog;
use verilog.vl_types.all;
entity alt_vipvfr130_common_avalon_mm_slave is
    generic(
        AV_ADDRESS_WIDTH: integer := 5;
        AV_DATA_WIDTH   : integer := 16;
        NO_OUTPUTS      : integer := 1;
        NO_INTERRUPTS   : integer := 1;
        NO_REGISTERS    : integer := 4;
        ALLOW_INTERNAL_WRITE: integer := 0
    );
    port(
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        av_address      : in     vl_logic_vector;
        av_read         : in     vl_logic;
        av_readdata     : out    vl_logic_vector;
        av_write        : in     vl_logic;
        av_writedata    : in     vl_logic_vector;
        av_irq          : out    vl_logic;
        enable          : out    vl_logic;
        clear_enable    : in     vl_logic;
        triggers        : out    vl_logic_vector;
        registers       : out    vl_logic_vector;
        registers_in    : in     vl_logic_vector;
        registers_write : in     vl_logic_vector;
        interrupts      : in     vl_logic_vector;
        stopped         : in     vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of AV_ADDRESS_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of AV_DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of NO_OUTPUTS : constant is 1;
    attribute mti_svvh_generic_type of NO_INTERRUPTS : constant is 1;
    attribute mti_svvh_generic_type of NO_REGISTERS : constant is 1;
    attribute mti_svvh_generic_type of ALLOW_INTERNAL_WRITE : constant is 1;
end alt_vipvfr130_common_avalon_mm_slave;
