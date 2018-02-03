library verilog;
use verilog.vl_types.all;
entity Keyboard_Controller is
    port(
        iPS2_CLK        : in     vl_logic;
        iPS2_DAT        : in     vl_logic;
        iCLK            : in     vl_logic;
        iRESET          : in     vl_logic;
        oEventReady     : out    vl_logic;
        oEventType      : out    vl_logic_vector(7 downto 0)
    );
end Keyboard_Controller;
