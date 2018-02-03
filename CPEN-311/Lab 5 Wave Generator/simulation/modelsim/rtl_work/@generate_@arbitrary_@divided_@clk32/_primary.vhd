library verilog;
use verilog.vl_types.all;
entity Generate_Arbitrary_Divided_Clk32 is
    port(
        inclk           : in     vl_logic;
        outclk          : out    vl_logic;
        outclk_Not      : out    vl_logic;
        div_clk_count   : in     vl_logic_vector(31 downto 0);
        Reset           : in     vl_logic
    );
end Generate_Arbitrary_Divided_Clk32;
