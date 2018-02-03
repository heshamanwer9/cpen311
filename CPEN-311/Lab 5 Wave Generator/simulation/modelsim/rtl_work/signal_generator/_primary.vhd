library verilog;
use verilog.vl_types.all;
entity signal_generator is
    port(
        inclk           : in     vl_logic;
        reset           : in     vl_logic;
        div_clk_count   : in     vl_logic_vector(31 downto 0);
        outclk          : out    vl_logic
    );
end signal_generator;
