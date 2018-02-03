library verilog;
use verilog.vl_types.all;
entity generate_controlled_length_pulse is
    generic(
        default_count   : integer := 100;
        initial_count   : vl_notype;
        num_bits_counter: integer := 16;
        pulse_out_initial_value: integer := 1
    );
    port(
        async_reset     : in     vl_logic;
        pulse_out       : out    vl_logic;
        clk             : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of default_count : constant is 1;
    attribute mti_svvh_generic_type of initial_count : constant is 3;
    attribute mti_svvh_generic_type of num_bits_counter : constant is 1;
    attribute mti_svvh_generic_type of pulse_out_initial_value : constant is 1;
end generate_controlled_length_pulse;
