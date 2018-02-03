library verilog;
use verilog.vl_types.all;
entity control_fsm is
    port(
        LEDG1           : in     vl_logic_vector(7 downto 0);
        LEDG2           : in     vl_logic_vector(7 downto 0);
        LEDG3           : in     vl_logic_vector(7 downto 0);
        LEDG4           : in     vl_logic_vector(7 downto 0);
        LEDR1           : in     vl_logic_vector(17 downto 0);
        LEDR2           : in     vl_logic_vector(17 downto 0);
        LEDR3           : in     vl_logic_vector(17 downto 0);
        LEDR4           : in     vl_logic_vector(17 downto 0);
        secret_key1     : in     vl_logic_vector(23 downto 0);
        secret_key2     : in     vl_logic_vector(23 downto 0);
        secret_key3     : in     vl_logic_vector(23 downto 0);
        secret_key4     : in     vl_logic_vector(23 downto 0);
        cracked1        : in     vl_logic;
        cracked2        : in     vl_logic;
        cracked3        : in     vl_logic;
        cracked4        : in     vl_logic;
        LEDG            : out    vl_logic_vector(7 downto 0);
        LEDR            : out    vl_logic_vector(17 downto 0);
        secret_key      : out    vl_logic_vector(23 downto 0);
        cracked         : out    vl_logic;
        stop            : out    vl_logic
    );
end control_fsm;
