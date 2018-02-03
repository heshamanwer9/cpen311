library verilog;
use verilog.vl_types.all;
entity generate_one_shot_pulse is
    generic(
        num_clks_to_wait: integer := 10
    );
    port(
        clk             : in     vl_logic;
        oneshot_pulse   : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of num_clks_to_wait : constant is 1;
end generate_one_shot_pulse;
