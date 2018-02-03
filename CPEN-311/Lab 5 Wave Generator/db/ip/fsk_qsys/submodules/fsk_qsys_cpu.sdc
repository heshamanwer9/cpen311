# Legal Notice: (C)2017 Altera Corporation. All rights reserved.  Your
# use of Altera Corporation's design tools, logic functions and other
# software and tools, and its AMPP partner logic functions, and any
# output files any of the foregoing (including device programming or
# simulation files), and any associated documentation or information are
# expressly subject to the terms and conditions of the Altera Program
# License Subscription Agreement or other applicable license agreement,
# including, without limitation, that your use is for the sole purpose
# of programming logic devices manufactured by Altera and sold by Altera
# or its authorized distributors.  Please refer to the applicable
# agreement for further details.

#**************************************************************
# Timequest JTAG clock definition
#   Uncommenting the following lines will define the JTAG
#   clock in TimeQuest Timing Analyzer
#**************************************************************

#create_clock -period 10MHz {altera_internal_jtag|tckutap}
#set_clock_groups -asynchronous -group {altera_internal_jtag|tckutap}

#**************************************************************
# Set TCL Path Variables 
#**************************************************************

set 	fsk_qsys_cpu 	fsk_qsys_cpu:*
set 	fsk_qsys_cpu_oci 	fsk_qsys_cpu_nios2_oci:the_fsk_qsys_cpu_nios2_oci
set 	fsk_qsys_cpu_oci_break 	fsk_qsys_cpu_nios2_oci_break:the_fsk_qsys_cpu_nios2_oci_break
set 	fsk_qsys_cpu_ocimem 	fsk_qsys_cpu_nios2_ocimem:the_fsk_qsys_cpu_nios2_ocimem
set 	fsk_qsys_cpu_oci_debug 	fsk_qsys_cpu_nios2_oci_debug:the_fsk_qsys_cpu_nios2_oci_debug
set 	fsk_qsys_cpu_wrapper 	fsk_qsys_cpu_jtag_debug_module_wrapper:the_fsk_qsys_cpu_jtag_debug_module_wrapper
set 	fsk_qsys_cpu_jtag_tck 	fsk_qsys_cpu_jtag_debug_module_tck:the_fsk_qsys_cpu_jtag_debug_module_tck
set 	fsk_qsys_cpu_jtag_sysclk 	fsk_qsys_cpu_jtag_debug_module_sysclk:the_fsk_qsys_cpu_jtag_debug_module_sysclk
set 	fsk_qsys_cpu_oci_path 	 [format "%s|%s" $fsk_qsys_cpu $fsk_qsys_cpu_oci]
set 	fsk_qsys_cpu_oci_break_path 	 [format "%s|%s" $fsk_qsys_cpu_oci_path $fsk_qsys_cpu_oci_break]
set 	fsk_qsys_cpu_ocimem_path 	 [format "%s|%s" $fsk_qsys_cpu_oci_path $fsk_qsys_cpu_ocimem]
set 	fsk_qsys_cpu_oci_debug_path 	 [format "%s|%s" $fsk_qsys_cpu_oci_path $fsk_qsys_cpu_oci_debug]
set 	fsk_qsys_cpu_jtag_tck_path 	 [format "%s|%s|%s" $fsk_qsys_cpu_oci_path $fsk_qsys_cpu_wrapper $fsk_qsys_cpu_jtag_tck]
set 	fsk_qsys_cpu_jtag_sysclk_path 	 [format "%s|%s|%s" $fsk_qsys_cpu_oci_path $fsk_qsys_cpu_wrapper $fsk_qsys_cpu_jtag_sysclk]
set 	fsk_qsys_cpu_jtag_sr 	 [format "%s|*sr" $fsk_qsys_cpu_jtag_tck_path]

#**************************************************************
# Set False Paths
#**************************************************************

set_false_path -from [get_keepers *$fsk_qsys_cpu_oci_break_path|break_readreg*] -to [get_keepers *$fsk_qsys_cpu_jtag_sr*]
set_false_path -from [get_keepers *$fsk_qsys_cpu_oci_debug_path|*resetlatch]     -to [get_keepers *$fsk_qsys_cpu_jtag_sr[33]]
set_false_path -from [get_keepers *$fsk_qsys_cpu_oci_debug_path|monitor_ready]  -to [get_keepers *$fsk_qsys_cpu_jtag_sr[0]]
set_false_path -from [get_keepers *$fsk_qsys_cpu_oci_debug_path|monitor_error]  -to [get_keepers *$fsk_qsys_cpu_jtag_sr[34]]
set_false_path -from [get_keepers *$fsk_qsys_cpu_ocimem_path|*MonDReg*] -to [get_keepers *$fsk_qsys_cpu_jtag_sr*]
set_false_path -from *$fsk_qsys_cpu_jtag_sr*    -to *$fsk_qsys_cpu_jtag_sysclk_path|*jdo*
set_false_path -from sld_hub:*|irf_reg* -to *$fsk_qsys_cpu_jtag_sysclk_path|ir*
set_false_path -from sld_hub:*|sld_shadow_jsm:shadow_jsm|state[1] -to *$fsk_qsys_cpu_oci_debug_path|monitor_go
