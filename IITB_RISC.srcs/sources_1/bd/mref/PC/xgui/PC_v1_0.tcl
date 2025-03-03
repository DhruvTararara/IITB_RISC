# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "BOOT_ADDRESS" -parent ${Page_0}


}

proc update_PARAM_VALUE.BOOT_ADDRESS { PARAM_VALUE.BOOT_ADDRESS } {
	# Procedure called to update BOOT_ADDRESS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BOOT_ADDRESS { PARAM_VALUE.BOOT_ADDRESS } {
	# Procedure called to validate BOOT_ADDRESS
	return true
}


proc update_MODELPARAM_VALUE.BOOT_ADDRESS { MODELPARAM_VALUE.BOOT_ADDRESS PARAM_VALUE.BOOT_ADDRESS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BOOT_ADDRESS}] ${MODELPARAM_VALUE.BOOT_ADDRESS}
}

