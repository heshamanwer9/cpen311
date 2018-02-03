library verilog;
use verilog.vl_types.all;
entity Cursor is
    port(
        iLeft           : in     vl_logic;
        iUp             : in     vl_logic;
        iDown           : in     vl_logic;
        iRight          : in     vl_logic;
        iVGA_X          : in     vl_logic_vector(10 downto 0);
        iVGA_Y          : in     vl_logic_vector(10 downto 0);
        oRGB            : out    vl_logic_vector(11 downto 0);
        iRST            : in     vl_logic;
        iCLK            : in     vl_logic;
        slow            : in     vl_logic;
        ichangeC        : in     vl_logic;
        arrow_on        : out    vl_logic;
        pointer_x       : out    vl_logic_vector(9 downto 0);
        pointer_y       : out    vl_logic_vector(9 downto 0)
    );
end Cursor;
