library verilog;
use verilog.vl_types.all;
entity PS2_ScanCodeReader is
    port(
        iPS2_CLK        : in     vl_logic;
        iPS2_DAT        : in     vl_logic;
        iCLK            : in     vl_logic;
        iRESET          : in     vl_logic;
        iRead           : in     vl_logic;
        oScanReady      : out    vl_logic;
        oScanByte       : out    vl_logic_vector(7 downto 0)
    );
end PS2_ScanCodeReader;
