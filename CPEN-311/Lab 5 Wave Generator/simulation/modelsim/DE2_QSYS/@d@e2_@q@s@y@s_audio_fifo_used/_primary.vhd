library verilog;
use verilog.vl_types.all;
entity DE2_QSYS_audio_fifo_used is
    port(
        address         : in     vl_logic_vector(1 downto 0);
        clk             : in     vl_logic;
        in_port         : in     vl_logic_vector(11 downto 0);
        reset_n         : in     vl_logic;
        readdata        : out    vl_logic_vector(31 downto 0)
    );
end DE2_QSYS_audio_fifo_used;
