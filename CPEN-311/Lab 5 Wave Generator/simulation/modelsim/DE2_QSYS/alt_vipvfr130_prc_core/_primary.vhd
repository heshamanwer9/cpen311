library verilog;
use verilog.vl_types.all;
entity alt_vipvfr130_prc_core is
    generic(
        BITS_PER_SYMBOL : integer := 8;
        SYMBOLS_PER_BEAT: integer := 3;
        BURST_LENGTH_REQUIREDWIDTH: integer := 7;
        PACKET_SAMPLES_REQUIREDWIDTH: integer := 32
    );
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        stall           : out    vl_logic;
        ena             : in     vl_logic;
        read            : out    vl_logic;
        data            : in     vl_logic_vector;
        discard_remaining_data_of_read_word: out    vl_logic;
        cmd_length_of_burst: out    vl_logic_vector;
        cmd             : out    vl_logic;
        cmd_addr        : out    vl_logic_vector(31 downto 0);
        ready_out       : in     vl_logic;
        valid_out       : out    vl_logic;
        data_out        : out    vl_logic_vector;
        sop_out         : out    vl_logic;
        eop_out         : out    vl_logic;
        enable          : in     vl_logic;
        clear_enable    : out    vl_logic;
        stopped         : out    vl_logic;
        complete        : out    vl_logic;
        packet_addr     : in     vl_logic_vector(31 downto 0);
        packet_type     : in     vl_logic_vector(3 downto 0);
        packet_samples  : in     vl_logic_vector;
        packet_words    : in     vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of BITS_PER_SYMBOL : constant is 1;
    attribute mti_svvh_generic_type of SYMBOLS_PER_BEAT : constant is 1;
    attribute mti_svvh_generic_type of BURST_LENGTH_REQUIREDWIDTH : constant is 1;
    attribute mti_svvh_generic_type of PACKET_SAMPLES_REQUIREDWIDTH : constant is 1;
end alt_vipvfr130_prc_core;
