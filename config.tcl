# User config
set script_dir [file dirname [file normalize [info script]]]

# Project's name / Top level name
set ::env(DESIGN_NAME) wb_hyperram

# Change if needed
set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/*.v]

# set ::env(FP_PDN_VOFFSET) 0
# set ::env(FP_PDN_VPITCH) 5

# OpenROAD reports unconnected nodes as a warning.
# OpenLane typically treats unconnected node warnings 
# as a critical issue, and simply quits.
#
# We'll be leaving it up to the designer's discretion to
# enable/disable this: if LVS passes you're probably fine
# with this option being turned off.
##set ::env(FP_PDN_CHECK_NODES) 0

# Fill this
set ::env(CLOCK_PORT) "wb_clk_i"

# macro needs to work inside Caravel, so can't be core and can't use metal 5
set ::env(DESIGN_IS_CORE) 0
set ::env(GLB_RT_MAXLAYER) 5

# define power straps so the macro works inside Caravel's PDN
set ::env(VDD_NETS) [list {vccd1}]
set ::env(GND_NETS) [list {vssd1}]

# macro placement
# set ::env(MACRO_PLACEMENT_CFG) $::env(DESIGN_DIR)/macro_placement.cfg

# regular pin order seems to help with aggregating all the macros for the group project
set ::env(FP_PIN_ORDER_CFG) $script_dir/pin_order.cfg

# turn off CVC as we have multiple power domains
set ::env(RUN_CVC) 0

set ::env(CELL_PAD) 4

set filename $::env(DESIGN_DIR)/$::env(PDK)_$::env(STD_CELL_LIBRARY)_config.tcl
if { [file exists $filename] == 1} {
	source $filename
}

