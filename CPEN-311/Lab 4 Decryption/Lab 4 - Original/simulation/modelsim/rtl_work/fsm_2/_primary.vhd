library verilog;
use verilog.vl_types.all;
entity fsm_2 is
    port(
        clk             : in     vl_logic;
        stop            : in     vl_logic;
        LEDG            : out    vl_logic_vector(7 downto 0);
        LEDR            : out    vl_logic_vector(17 downto 0);
        secret_key      : out    vl_logic_vector(23 downto 0);
        cracked         : out    vl_logic
    );
end fsm_2;
