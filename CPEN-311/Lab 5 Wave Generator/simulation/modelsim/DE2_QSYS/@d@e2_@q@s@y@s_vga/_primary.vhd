library verilog;
use verilog.vl_types.all;
entity DE2_QSYS_vga is
    port(
        alt_vip_itc_0_clocked_video_vid_clk: in     vl_logic;
        alt_vip_itc_0_clocked_video_vid_data: out    vl_logic_vector(23 downto 0);
        alt_vip_itc_0_clocked_video_underflow: out    vl_logic;
        alt_vip_itc_0_clocked_video_vid_datavalid: out    vl_logic;
        alt_vip_itc_0_clocked_video_vid_v_sync: out    vl_logic;
        alt_vip_itc_0_clocked_video_vid_h_sync: out    vl_logic;
        alt_vip_itc_0_clocked_video_vid_f: out    vl_logic;
        alt_vip_itc_0_clocked_video_vid_h: out    vl_logic;
        alt_vip_itc_0_clocked_video_vid_v: out    vl_logic;
        alt_vip_vfr_0_interrupt_sender_irq: out    vl_logic;
        nios_clk_clk    : in     vl_logic;
        nios_clk_reset_reset_n: in     vl_logic;
        to_nios_2_datamaster_address: in     vl_logic_vector(4 downto 0);
        to_nios_2_datamaster_write: in     vl_logic;
        to_nios_2_datamaster_writedata: in     vl_logic_vector(31 downto 0);
        to_nios_2_datamaster_read: in     vl_logic;
        to_nios_2_datamaster_readdata: out    vl_logic_vector(31 downto 0);
        to_sdram_address: out    vl_logic_vector(31 downto 0);
        to_sdram_burstcount: out    vl_logic_vector(5 downto 0);
        to_sdram_readdata: in     vl_logic_vector(31 downto 0);
        to_sdram_read   : out    vl_logic;
        to_sdram_readdatavalid: in     vl_logic;
        to_sdram_waitrequest: in     vl_logic
    );
end DE2_QSYS_vga;
