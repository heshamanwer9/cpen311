library verilog;
use verilog.vl_types.all;
entity DE2_QSYS_sysid_qsys is
    port(
        address         : in     vl_logic;
        clock           : in     vl_logic;
        reset_n         : in     vl_logic;
        readdata        : out    vl_logic_vector(31 downto 0)
    );
end DE2_QSYS_sysid_qsys;
