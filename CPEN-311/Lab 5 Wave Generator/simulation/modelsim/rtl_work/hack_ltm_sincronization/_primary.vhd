library verilog;
use verilog.vl_types.all;
entity hack_ltm_sincronization is
    generic(
        WIDTH           : vl_logic_vector(0 to 10) := (Hi0, Hi1, Hi1, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0);
        HEIGHT          : vl_logic_vector(0 to 10) := (Hi0, Hi1, Hi0, Hi0, Hi1, Hi0, Hi1, Hi0, Hi1, Hi1, Hi1)
    );
    port(
        clk_lcd         : in     vl_logic;
        den_lcd         : in     vl_logic;
        count_x         : out    vl_logic_vector(10 downto 0);
        count_y         : out    vl_logic_vector(10 downto 0);
        reset           : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
    attribute mti_svvh_generic_type of HEIGHT : constant is 1;
end hack_ltm_sincronization;
