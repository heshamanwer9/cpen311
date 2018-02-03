library verilog;
use verilog.vl_types.all;
entity ScanCodeToEvent is
    port(
        iScanCode       : in     vl_logic_vector(63 downto 0);
        oEventReady     : out    vl_logic;
        oEventType      : out    vl_logic_vector(7 downto 0)
    );
end ScanCodeToEvent;
