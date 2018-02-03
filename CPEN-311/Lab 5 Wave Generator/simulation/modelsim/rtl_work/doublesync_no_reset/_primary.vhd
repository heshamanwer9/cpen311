library verilog;
use verilog.vl_types.all;
entity doublesync_no_reset is
    port(
        indata          : in     vl_logic;
        outdata         : out    vl_logic;
        clk             : in     vl_logic
    );
end doublesync_no_reset;
