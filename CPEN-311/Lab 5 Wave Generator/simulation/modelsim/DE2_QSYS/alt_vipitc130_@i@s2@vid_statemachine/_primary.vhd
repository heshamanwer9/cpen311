library verilog;
use verilog.vl_types.all;
entity alt_vipitc130_IS2Vid_statemachine is
    generic(
        USE_EMBEDDED_SYNCS: integer := 0;
        NUMBER_OF_COLOUR_PLANES_IN_PARALLEL: integer := 0;
        IDLE            : vl_logic_vector(3 downto 0) := (Hi0, Hi0, Hi0, Hi0);
        FIND_SOP        : vl_logic_vector(3 downto 0) := (Hi0, Hi0, Hi0, Hi1);
        WIDTH_3         : vl_logic_vector(3 downto 0) := (Hi0, Hi0, Hi1, Hi0);
        WIDTH_2         : vl_logic_vector(3 downto 0) := (Hi0, Hi0, Hi1, Hi1);
        WIDTH_1         : vl_logic_vector(3 downto 0) := (Hi0, Hi1, Hi0, Hi0);
        WIDTH_0         : vl_logic_vector(3 downto 0) := (Hi0, Hi1, Hi0, Hi1);
        HEIGHT_3        : vl_logic_vector(3 downto 0) := (Hi0, Hi1, Hi1, Hi0);
        HEIGHT_2        : vl_logic_vector(3 downto 0) := (Hi0, Hi1, Hi1, Hi1);
        HEIGHT_1        : vl_logic_vector(3 downto 0) := (Hi1, Hi0, Hi0, Hi0);
        HEIGHT_0        : vl_logic_vector(3 downto 0) := (Hi1, Hi0, Hi0, Hi1);
        INTERLACING     : vl_logic_vector(3 downto 0) := (Hi1, Hi0, Hi1, Hi0);
        FIND_MODE       : vl_logic_vector(3 downto 0) := (Hi1, Hi0, Hi1, Hi1);
        SYNCHED         : vl_logic_vector(3 downto 0) := (Hi1, Hi1, Hi0, Hi0);
        WAIT_FOR_SYNCH  : vl_logic_vector(3 downto 0) := (Hi1, Hi1, Hi0, Hi1);
        WAIT_FOR_ANC    : vl_logic_vector(3 downto 0) := (Hi1, Hi1, Hi1, Hi0);
        INSERT_ANC      : vl_logic_vector(3 downto 0) := (Hi1, Hi1, Hi1, Hi1)
    );
    port(
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        request_data_valid: in     vl_logic;
        sop             : in     vl_logic;
        vid_v_nxt       : in     vl_logic;
        anc_datavalid_nxt: in     vl_logic;
        q_data          : in     vl_logic_vector(3 downto 0);
        sync_lost       : in     vl_logic;
        anc_underflow_nxt: in     vl_logic;
        ap_synched      : in     vl_logic;
        enable_synced_nxt: in     vl_logic;
        state_next      : out    vl_logic_vector(3 downto 0);
        state           : out    vl_logic_vector(3 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of USE_EMBEDDED_SYNCS : constant is 1;
    attribute mti_svvh_generic_type of NUMBER_OF_COLOUR_PLANES_IN_PARALLEL : constant is 1;
    attribute mti_svvh_generic_type of IDLE : constant is 2;
    attribute mti_svvh_generic_type of FIND_SOP : constant is 2;
    attribute mti_svvh_generic_type of WIDTH_3 : constant is 2;
    attribute mti_svvh_generic_type of WIDTH_2 : constant is 2;
    attribute mti_svvh_generic_type of WIDTH_1 : constant is 2;
    attribute mti_svvh_generic_type of WIDTH_0 : constant is 2;
    attribute mti_svvh_generic_type of HEIGHT_3 : constant is 2;
    attribute mti_svvh_generic_type of HEIGHT_2 : constant is 2;
    attribute mti_svvh_generic_type of HEIGHT_1 : constant is 2;
    attribute mti_svvh_generic_type of HEIGHT_0 : constant is 2;
    attribute mti_svvh_generic_type of INTERLACING : constant is 2;
    attribute mti_svvh_generic_type of FIND_MODE : constant is 2;
    attribute mti_svvh_generic_type of SYNCHED : constant is 2;
    attribute mti_svvh_generic_type of WAIT_FOR_SYNCH : constant is 2;
    attribute mti_svvh_generic_type of WAIT_FOR_ANC : constant is 2;
    attribute mti_svvh_generic_type of INSERT_ANC : constant is 2;
end alt_vipitc130_IS2Vid_statemachine;
