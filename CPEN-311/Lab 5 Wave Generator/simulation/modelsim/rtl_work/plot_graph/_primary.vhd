library verilog;
use verilog.vl_types.all;
entity plot_graph is
    generic(
        Xcount          : integer := 11;
        Ycount          : integer := 11;
        size_data       : integer := 8;
        numberRGB       : integer := 24;
        width_grp       : integer := 11;
        height_grp      : integer := 3
    );
    port(
        CountX_in       : in     vl_logic_vector;
        CountY_in       : in     vl_logic_vector;
        data_graph      : in     vl_logic_vector;
        data_graph_rdy  : in     vl_logic;
        display_clk     : in     vl_logic;
        color_graph     : in     vl_logic_vector;
        scroll_en       : in     vl_logic;
        Pos_X           : in     vl_logic_vector;
        Pos_Y           : in     vl_logic_vector;
        Witdh           : in     vl_logic_vector;
        Height          : in     vl_logic_vector;
        line_width      : in     vl_logic_vector(2 downto 0);
        Graph_en        : in     vl_logic;
        Graph_on        : out    vl_logic;
        R               : out    vl_logic_vector;
        G               : out    vl_logic_vector;
        B               : out    vl_logic_vector;
        reset_n         : in     vl_logic;
        pause_graph     : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Xcount : constant is 1;
    attribute mti_svvh_generic_type of Ycount : constant is 1;
    attribute mti_svvh_generic_type of size_data : constant is 1;
    attribute mti_svvh_generic_type of numberRGB : constant is 1;
    attribute mti_svvh_generic_type of width_grp : constant is 1;
    attribute mti_svvh_generic_type of height_grp : constant is 1;
end plot_graph;
