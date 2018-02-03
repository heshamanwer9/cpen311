library verilog;
use verilog.vl_types.all;
entity SevenSegmentDisplayDecoder is
    port(
        ssOut           : out    vl_logic_vector(6 downto 0);
        nIn             : in     vl_logic_vector(3 downto 0)
    );
end SevenSegmentDisplayDecoder;
