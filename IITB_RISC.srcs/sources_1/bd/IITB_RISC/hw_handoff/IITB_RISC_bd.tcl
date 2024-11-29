
################################################################
# This is a generated script based on design: IITB_RISC
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2019.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source IITB_RISC_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# ALU, ALU_Control_unit, ALU_inputs, Branch_PC, CZ_Control_Unit, Carry_and_Zero_flag, Comparator, Data_memory, Destination_reg_select, EX_MEM_PR, Forwarding_unit, Hazard_Detection_Unit, ID_RR_PR, IF_ID_PR, Instruction_Decoder, Instruction_Memory, LM_and_SM_unit, MEM_WB_PR, PC, RB_select, RR_Control, RR_EX_PR, RR_Forwarding_Unit, Reg_Write_Control, Registers, Sign_Extension, Special_2_Control, Special_Control, WB_mux, Write_Data_Select

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7k70tfbv676-1
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name IITB_RISC

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set Load_address [ create_bd_port -dir O -from 2 -to 0 Load_address ]
  set Load_data [ create_bd_port -dir O -from 15 -to 0 Load_data ]
  set PC_out_0 [ create_bd_port -dir O -from 15 -to 0 PC_out_0 ]
  set R0_0 [ create_bd_port -dir O -from 15 -to 0 R0_0 ]
  set R1_0 [ create_bd_port -dir O -from 15 -to 0 R1_0 ]
  set R2_0 [ create_bd_port -dir O -from 15 -to 0 R2_0 ]
  set R3_0 [ create_bd_port -dir O -from 15 -to 0 R3_0 ]
  set R4_0 [ create_bd_port -dir O -from 15 -to 0 R4_0 ]
  set R5_0 [ create_bd_port -dir O -from 15 -to 0 R5_0 ]
  set R6_0 [ create_bd_port -dir O -from 15 -to 0 R6_0 ]
  set R7_0 [ create_bd_port -dir O -from 15 -to 0 R7_0 ]
  set Store_address [ create_bd_port -dir O -from 15 -to 0 Store_address ]
  set Store_data [ create_bd_port -dir O -from 15 -to 0 Store_data ]
  set c_0 [ create_bd_port -dir O c_0 ]
  set clk_0 [ create_bd_port -dir I -type clk clk_0 ]
  set rst_0 [ create_bd_port -dir I -type rst rst_0 ]
  set z_0 [ create_bd_port -dir O z_0 ]

  # Create instance: ALU_0, and set properties
  set block_name ALU
  set block_cell_name ALU_0
  if { [catch {set ALU_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ALU_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: ALU_Control_unit_0, and set properties
  set block_name ALU_Control_unit
  set block_cell_name ALU_Control_unit_0
  if { [catch {set ALU_Control_unit_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ALU_Control_unit_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: ALU_inputs_0, and set properties
  set block_name ALU_inputs
  set block_cell_name ALU_inputs_0
  if { [catch {set ALU_inputs_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ALU_inputs_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Branch_PC_0, and set properties
  set block_name Branch_PC
  set block_cell_name Branch_PC_0
  if { [catch {set Branch_PC_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Branch_PC_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: CZ_Control_Unit_0, and set properties
  set block_name CZ_Control_Unit
  set block_cell_name CZ_Control_Unit_0
  if { [catch {set CZ_Control_Unit_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $CZ_Control_Unit_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Carry_and_Zero_flag_0, and set properties
  set block_name Carry_and_Zero_flag
  set block_cell_name Carry_and_Zero_flag_0
  if { [catch {set Carry_and_Zero_flag_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Carry_and_Zero_flag_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Comparator_0, and set properties
  set block_name Comparator
  set block_cell_name Comparator_0
  if { [catch {set Comparator_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Comparator_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Data_memory_0, and set properties
  set block_name Data_memory
  set block_cell_name Data_memory_0
  if { [catch {set Data_memory_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Data_memory_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Destination_reg_sele_0, and set properties
  set block_name Destination_reg_select
  set block_cell_name Destination_reg_sele_0
  if { [catch {set Destination_reg_sele_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Destination_reg_sele_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: EX_MEM_PR_0, and set properties
  set block_name EX_MEM_PR
  set block_cell_name EX_MEM_PR_0
  if { [catch {set EX_MEM_PR_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $EX_MEM_PR_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Forwarding_unit_0, and set properties
  set block_name Forwarding_unit
  set block_cell_name Forwarding_unit_0
  if { [catch {set Forwarding_unit_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Forwarding_unit_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Hazard_Detection_Unit_0, and set properties
  set block_name Hazard_Detection_Unit
  set block_cell_name Hazard_Detection_Unit_0
  if { [catch {set Hazard_Detection_Unit_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Hazard_Detection_Unit_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: ID_RR_PR_0, and set properties
  set block_name ID_RR_PR
  set block_cell_name ID_RR_PR_0
  if { [catch {set ID_RR_PR_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ID_RR_PR_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: IF_ID_PR_0, and set properties
  set block_name IF_ID_PR
  set block_cell_name IF_ID_PR_0
  if { [catch {set IF_ID_PR_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $IF_ID_PR_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Instruction_Decoder_0, and set properties
  set block_name Instruction_Decoder
  set block_cell_name Instruction_Decoder_0
  if { [catch {set Instruction_Decoder_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Instruction_Decoder_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Instruction_Memory_0, and set properties
  set block_name Instruction_Memory
  set block_cell_name Instruction_Memory_0
  if { [catch {set Instruction_Memory_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Instruction_Memory_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: LM_and_SM_unit_0, and set properties
  set block_name LM_and_SM_unit
  set block_cell_name LM_and_SM_unit_0
  if { [catch {set LM_and_SM_unit_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $LM_and_SM_unit_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: MEM_WB_PR_0, and set properties
  set block_name MEM_WB_PR
  set block_cell_name MEM_WB_PR_0
  if { [catch {set MEM_WB_PR_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $MEM_WB_PR_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: PC_0, and set properties
  set block_name PC
  set block_cell_name PC_0
  if { [catch {set PC_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $PC_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: RB_select_0, and set properties
  set block_name RB_select
  set block_cell_name RB_select_0
  if { [catch {set RB_select_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $RB_select_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: RR_Control_0, and set properties
  set block_name RR_Control
  set block_cell_name RR_Control_0
  if { [catch {set RR_Control_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $RR_Control_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: RR_EX_PR_0, and set properties
  set block_name RR_EX_PR
  set block_cell_name RR_EX_PR_0
  if { [catch {set RR_EX_PR_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $RR_EX_PR_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: RR_Forwarding_Unit_0, and set properties
  set block_name RR_Forwarding_Unit
  set block_cell_name RR_Forwarding_Unit_0
  if { [catch {set RR_Forwarding_Unit_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $RR_Forwarding_Unit_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Reg_Write_Control_0, and set properties
  set block_name Reg_Write_Control
  set block_cell_name Reg_Write_Control_0
  if { [catch {set Reg_Write_Control_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Reg_Write_Control_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Registers_0, and set properties
  set block_name Registers
  set block_cell_name Registers_0
  if { [catch {set Registers_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Registers_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Sign_Extension_0, and set properties
  set block_name Sign_Extension
  set block_cell_name Sign_Extension_0
  if { [catch {set Sign_Extension_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Sign_Extension_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Special_2_Control_0, and set properties
  set block_name Special_2_Control
  set block_cell_name Special_2_Control_0
  if { [catch {set Special_2_Control_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Special_2_Control_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Special_Control_0, and set properties
  set block_name Special_Control
  set block_cell_name Special_Control_0
  if { [catch {set Special_Control_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Special_Control_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: WB_mux_0, and set properties
  set block_name WB_mux
  set block_cell_name WB_mux_0
  if { [catch {set WB_mux_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $WB_mux_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Write_Data_Select_0, and set properties
  set block_name Write_Data_Select
  set block_cell_name Write_Data_Select_0
  if { [catch {set Write_Data_Select_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Write_Data_Select_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]

  # Create instance: xlconstant_2, and set properties
  set xlconstant_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_2 ]

  # Create port connections
  connect_bd_net -net ALU_0_alu_out [get_bd_pins ALU_0/alu_out] [get_bd_pins EX_MEM_PR_0/alu_out_in]
  connect_bd_net -net ALU_0_carry_out [get_bd_pins ALU_0/carry_out] [get_bd_pins EX_MEM_PR_0/carry_in]
  connect_bd_net -net ALU_Control_unit_0_ALU_CB [get_bd_pins ALU_0/ALU_CB] [get_bd_pins ALU_Control_unit_0/ALU_CB]
  connect_bd_net -net ALU_inputs_0_op_1 [get_bd_pins ALU_0/op_1] [get_bd_pins ALU_inputs_0/op_1]
  connect_bd_net -net ALU_inputs_0_op_2 [get_bd_pins ALU_0/op_2] [get_bd_pins ALU_inputs_0/op_2]
  connect_bd_net -net ALU_inputs_0_ra_final [get_bd_pins ALU_inputs_0/ra_final] [get_bd_pins EX_MEM_PR_0/ra_in]
  connect_bd_net -net ALU_inputs_0_rb_final [get_bd_pins ALU_inputs_0/rb_final] [get_bd_pins EX_MEM_PR_0/rb_in]
  connect_bd_net -net Branch_PC_0_branch_pc [get_bd_pins Branch_PC_0/branch_pc] [get_bd_pins PC_0/branch_pc]
  connect_bd_net -net CZ_Control_Unit_0_Z_final [get_bd_pins CZ_Control_Unit_0/Z_final] [get_bd_pins Reg_Write_Control_0/z]
  connect_bd_net -net Carry_and_Zero_flag_0_c [get_bd_pins ALU_0/c] [get_bd_pins CZ_Control_Unit_0/C_final] [get_bd_pins Reg_Write_Control_0/c]
  connect_bd_net -net Carry_and_Zero_flag_0_c1 [get_bd_ports c_0] [get_bd_pins CZ_Control_Unit_0/C] [get_bd_pins Carry_and_Zero_flag_0/c]
  connect_bd_net -net Carry_and_Zero_flag_0_z [get_bd_ports z_0] [get_bd_pins CZ_Control_Unit_0/Z] [get_bd_pins Carry_and_Zero_flag_0/z]
  connect_bd_net -net Comparator_0_ET [get_bd_pins Comparator_0/ET] [get_bd_pins RR_Control_0/ET]
  connect_bd_net -net Comparator_0_LT [get_bd_pins Comparator_0/LT] [get_bd_pins RR_Control_0/LT]
  connect_bd_net -net Data_memory_0_dm_data [get_bd_pins CZ_Control_Unit_0/dm_data_mem] [get_bd_pins Data_memory_0/dm_data] [get_bd_pins MEM_WB_PR_0/dm_data_in]
  connect_bd_net -net Destination_reg_sele_0_RD [get_bd_pins Destination_reg_sele_0/RD] [get_bd_pins EX_MEM_PR_0/RD_in] [get_bd_pins Hazard_Detection_Unit_0/RD_ex]
  connect_bd_net -net EX_MEM_PR_0_CWrite_out [get_bd_pins CZ_Control_Unit_0/CWrite_mem] [get_bd_pins EX_MEM_PR_0/CWrite_out] [get_bd_pins MEM_WB_PR_0/CWrite_in]
  connect_bd_net -net EX_MEM_PR_0_Imm2_out [get_bd_pins ALU_inputs_0/Imm2_mem] [get_bd_pins EX_MEM_PR_0/Imm2_out] [get_bd_pins MEM_WB_PR_0/Imm2_in]
  connect_bd_net -net EX_MEM_PR_0_L_out [get_bd_pins ALU_inputs_0/L_mem] [get_bd_pins EX_MEM_PR_0/L_out] [get_bd_pins Hazard_Detection_Unit_0/L_mem] [get_bd_pins MEM_WB_PR_0/L_in]
  connect_bd_net -net EX_MEM_PR_0_MemRead_out [get_bd_pins Data_memory_0/MemRead] [get_bd_pins EX_MEM_PR_0/MemRead_out]
  connect_bd_net -net EX_MEM_PR_0_MemWrite_out [get_bd_pins Data_memory_0/MemWrite] [get_bd_pins EX_MEM_PR_0/MemWrite_out]
  connect_bd_net -net EX_MEM_PR_0_MemtoReg_out [get_bd_pins EX_MEM_PR_0/MemtoReg_out] [get_bd_pins Forwarding_unit_0/MemtoReg_mem] [get_bd_pins MEM_WB_PR_0/MemtoReg_in]
  connect_bd_net -net EX_MEM_PR_0_PC_out [get_bd_pins EX_MEM_PR_0/PC_out] [get_bd_pins MEM_WB_PR_0/PC_in]
  connect_bd_net -net EX_MEM_PR_0_PC_plus_2_out [get_bd_pins EX_MEM_PR_0/PC_plus_2_out] [get_bd_pins MEM_WB_PR_0/PC_plus_2_in]
  connect_bd_net -net EX_MEM_PR_0_RD_out [get_bd_pins EX_MEM_PR_0/RD_out] [get_bd_pins Forwarding_unit_0/RD_mem] [get_bd_pins Hazard_Detection_Unit_0/RD_mem] [get_bd_pins MEM_WB_PR_0/RD_in]
  connect_bd_net -net EX_MEM_PR_0_RegWrite_out [get_bd_pins EX_MEM_PR_0/RegWrite_out] [get_bd_pins Forwarding_unit_0/RegWrite_mem] [get_bd_pins Hazard_Detection_Unit_0/RegWrite_mem] [get_bd_pins MEM_WB_PR_0/RegWrite_in]
  connect_bd_net -net EX_MEM_PR_0_S_out [get_bd_pins ALU_inputs_0/S_mem] [get_bd_pins EX_MEM_PR_0/S_out] [get_bd_pins MEM_WB_PR_0/S_in] [get_bd_pins Write_Data_Select_0/S]
  connect_bd_net -net EX_MEM_PR_0_ZWrite_out [get_bd_pins CZ_Control_Unit_0/ZWrite_mem] [get_bd_pins EX_MEM_PR_0/ZWrite_out] [get_bd_pins MEM_WB_PR_0/ZWrite_in]
  connect_bd_net -net EX_MEM_PR_0_alu_out_out [get_bd_pins ALU_inputs_0/alu_out_mem] [get_bd_pins CZ_Control_Unit_0/alu_out_mem] [get_bd_pins Data_memory_0/addr] [get_bd_pins EX_MEM_PR_0/alu_out_out] [get_bd_pins MEM_WB_PR_0/alu_out_in] [get_bd_pins MEM_WB_PR_0/mem_addr_in]
  connect_bd_net -net EX_MEM_PR_0_carry_out [get_bd_pins CZ_Control_Unit_0/carry_out_mem] [get_bd_pins EX_MEM_PR_0/carry_out] [get_bd_pins MEM_WB_PR_0/carry_in]
  connect_bd_net -net EX_MEM_PR_0_invalid1_out [get_bd_pins CZ_Control_Unit_0/invalid1_mem] [get_bd_pins EX_MEM_PR_0/invalid1_out] [get_bd_pins Forwarding_unit_0/invalid1_mem] [get_bd_pins MEM_WB_PR_0/invalid1_in]
  connect_bd_net -net EX_MEM_PR_0_op_out [get_bd_pins ALU_inputs_0/op_mem] [get_bd_pins EX_MEM_PR_0/op_out]
  connect_bd_net -net EX_MEM_PR_0_ra_out [get_bd_pins EX_MEM_PR_0/ra_out] [get_bd_pins Write_Data_Select_0/ra]
  connect_bd_net -net EX_MEM_PR_0_rb_out [get_bd_pins EX_MEM_PR_0/rb_out] [get_bd_pins Write_Data_Select_0/rb]
  connect_bd_net -net Forwarding_unit_0_forwardA [get_bd_pins ALU_inputs_0/forwardA] [get_bd_pins Forwarding_unit_0/forwardA]
  connect_bd_net -net Forwarding_unit_0_forwardB [get_bd_pins ALU_inputs_0/forwardB] [get_bd_pins Forwarding_unit_0/forwardB]
  connect_bd_net -net Hazard_Detection_Unit_0_EX_FLUSH [get_bd_pins EX_MEM_PR_0/EX_FLUSH] [get_bd_pins Hazard_Detection_Unit_0/EX_FLUSH]
  connect_bd_net -net Hazard_Detection_Unit_0_ID_FLUSH [get_bd_pins Hazard_Detection_Unit_0/ID_FLUSH] [get_bd_pins ID_RR_PR_0/ID_FLUSH] [get_bd_pins Instruction_Decoder_0/ID_FLUSH]
  connect_bd_net -net Hazard_Detection_Unit_0_ID_Write [get_bd_pins Hazard_Detection_Unit_0/ID_Write] [get_bd_pins ID_RR_PR_0/ID_RR_write]
  connect_bd_net -net Hazard_Detection_Unit_0_IF_FLUSH [get_bd_pins Hazard_Detection_Unit_0/IF_FLUSH] [get_bd_pins IF_ID_PR_0/IF_FLUSH]
  connect_bd_net -net Hazard_Detection_Unit_0_IF_Write [get_bd_pins Hazard_Detection_Unit_0/IF_Write] [get_bd_pins IF_ID_PR_0/IF_ID_write]
  connect_bd_net -net Hazard_Detection_Unit_0_MEM_FLUSH [get_bd_pins Hazard_Detection_Unit_0/MEM_FLUSH] [get_bd_pins MEM_WB_PR_0/MEM_FLUSH]
  connect_bd_net -net Hazard_Detection_Unit_0_PC_Write [get_bd_pins Hazard_Detection_Unit_0/PC_Write] [get_bd_pins PC_0/PC_Write]
  connect_bd_net -net Hazard_Detection_Unit_0_RR_FLUSH [get_bd_pins Hazard_Detection_Unit_0/RR_FLUSH] [get_bd_pins RR_EX_PR_0/RR_FLUSH]
  connect_bd_net -net Hazard_Detection_Unit_0_stall [get_bd_pins Hazard_Detection_Unit_0/stall] [get_bd_pins RR_Control_0/stall] [get_bd_pins RR_EX_PR_0/stall_in]
  connect_bd_net -net ID_RR_PR_0_Imm2_out [get_bd_pins ID_RR_PR_0/Imm2_out] [get_bd_pins LM_and_SM_unit_0/Imm2] [get_bd_pins RR_EX_PR_0/Imm2_in]
  connect_bd_net -net ID_RR_PR_0_PC_out [get_bd_pins Branch_PC_0/PC] [get_bd_pins ID_RR_PR_0/PC_out] [get_bd_pins RR_EX_PR_0/PC_in] [get_bd_pins Registers_0/PC_in]
  connect_bd_net -net ID_RR_PR_0_PC_plus_2_out [get_bd_pins ID_RR_PR_0/PC_plus_2_out] [get_bd_pins RR_EX_PR_0/PC_plus_2_in]
  connect_bd_net -net ID_RR_PR_0_RA_out [get_bd_pins Hazard_Detection_Unit_0/RA_RR] [get_bd_pins ID_RR_PR_0/RA_out] [get_bd_pins RR_EX_PR_0/RA_final_in] [get_bd_pins RR_Forwarding_Unit_0/RA_in] [get_bd_pins Registers_0/RA_in]
  connect_bd_net -net ID_RR_PR_0_RB_out [get_bd_pins ID_RR_PR_0/RB_out] [get_bd_pins RB_select_0/RB]
  connect_bd_net -net ID_RR_PR_0_RC_out1 [get_bd_pins ID_RR_PR_0/RC_out] [get_bd_pins RR_EX_PR_0/RC_in]
  connect_bd_net -net ID_RR_PR_0_SE_Imm1_out [get_bd_pins Branch_PC_0/SE_Imm1] [get_bd_pins ID_RR_PR_0/SE_Imm1_out] [get_bd_pins RR_EX_PR_0/SE_Imm1_in]
  connect_bd_net -net ID_RR_PR_0_SE_Imm2_out [get_bd_pins Branch_PC_0/SE_Imm2] [get_bd_pins ID_RR_PR_0/SE_Imm2_out]
  connect_bd_net -net ID_RR_PR_0_comp_out [get_bd_pins ID_RR_PR_0/comp_out] [get_bd_pins RR_EX_PR_0/comp_in]
  connect_bd_net -net ID_RR_PR_0_cz_out [get_bd_pins ID_RR_PR_0/cz_out] [get_bd_pins RR_EX_PR_0/cz_in]
  connect_bd_net -net ID_RR_PR_0_invalid1_out [get_bd_pins ID_RR_PR_0/invalid1_out] [get_bd_pins RR_Control_0/invalid1] [get_bd_pins RR_EX_PR_0/invalid1_in]
  connect_bd_net -net ID_RR_PR_0_op_out [get_bd_pins Hazard_Detection_Unit_0/op_rr] [get_bd_pins ID_RR_PR_0/op_out] [get_bd_pins RB_select_0/op] [get_bd_pins RR_Control_0/op] [get_bd_pins RR_EX_PR_0/op_in]
  connect_bd_net -net IF_ID_PR_0_PC_out [get_bd_pins ID_RR_PR_0/PC_in] [get_bd_pins IF_ID_PR_0/PC_out]
  connect_bd_net -net IF_ID_PR_0_PC_plus_2_out [get_bd_pins ID_RR_PR_0/PC_plus_2_in] [get_bd_pins IF_ID_PR_0/PC_plus_2_out]
  connect_bd_net -net IF_ID_PR_0_instr_out [get_bd_pins IF_ID_PR_0/instr_out] [get_bd_pins Instruction_Decoder_0/instr_in]
  connect_bd_net -net IF_ID_PR_0_invalid1 [get_bd_pins ID_RR_PR_0/invalid1_in] [get_bd_pins IF_ID_PR_0/invalid1]
  connect_bd_net -net Instruction_Decoder_0_Imm1 [get_bd_pins Instruction_Decoder_0/Imm1] [get_bd_pins Sign_Extension_0/Imm1]
  connect_bd_net -net Instruction_Decoder_0_Imm2 [get_bd_pins ID_RR_PR_0/Imm2_in] [get_bd_pins Instruction_Decoder_0/Imm2] [get_bd_pins Sign_Extension_0/Imm2]
  connect_bd_net -net Instruction_Decoder_0_RA [get_bd_pins ID_RR_PR_0/RA_in] [get_bd_pins Instruction_Decoder_0/RA]
  connect_bd_net -net Instruction_Decoder_0_RB [get_bd_pins ID_RR_PR_0/RB_in] [get_bd_pins Instruction_Decoder_0/RB]
  connect_bd_net -net Instruction_Decoder_0_RC [get_bd_pins ID_RR_PR_0/RC_in] [get_bd_pins Instruction_Decoder_0/RC]
  connect_bd_net -net Instruction_Decoder_0_comp [get_bd_pins ID_RR_PR_0/comp_in] [get_bd_pins Instruction_Decoder_0/comp]
  connect_bd_net -net Instruction_Decoder_0_cz [get_bd_pins ID_RR_PR_0/cz_in] [get_bd_pins Instruction_Decoder_0/cz]
  connect_bd_net -net Instruction_Decoder_0_op [get_bd_pins ID_RR_PR_0/op_in] [get_bd_pins Instruction_Decoder_0/op]
  connect_bd_net -net Instruction_Memory_0_instr [get_bd_pins IF_ID_PR_0/instr_in] [get_bd_pins Instruction_Memory_0/instr]
  connect_bd_net -net LM_and_SM_unit_0_i [get_bd_pins LM_and_SM_unit_0/i] [get_bd_pins RB_select_0/i] [get_bd_pins RR_EX_PR_0/i_in]
  connect_bd_net -net LM_and_SM_unit_0_x [get_bd_pins Hazard_Detection_Unit_0/x] [get_bd_pins LM_and_SM_unit_0/x] [get_bd_pins RR_EX_PR_0/x_in]
  connect_bd_net -net MEM_WB_PR_0_CWrite_out [get_bd_pins CZ_Control_Unit_0/CWrite_wb] [get_bd_pins Carry_and_Zero_flag_0/CWrite] [get_bd_pins MEM_WB_PR_0/CWrite_out]
  connect_bd_net -net MEM_WB_PR_0_Imm2_out [get_bd_pins MEM_WB_PR_0/Imm2_out] [get_bd_pins WB_mux_0/Imm2]
  connect_bd_net -net MEM_WB_PR_0_L_out [get_bd_pins Hazard_Detection_Unit_0/L_wb] [get_bd_pins MEM_WB_PR_0/L_out] [get_bd_pins Special_2_Control_0/L_wb] [get_bd_pins Special_Control_0/L]
  connect_bd_net -net MEM_WB_PR_0_MemtoReg_out [get_bd_pins MEM_WB_PR_0/MemtoReg_out] [get_bd_pins WB_mux_0/MemtoReg]
  connect_bd_net -net MEM_WB_PR_0_PC_out [get_bd_ports PC_out_0] [get_bd_pins MEM_WB_PR_0/PC_out]
  connect_bd_net -net MEM_WB_PR_0_PC_plus_2_out [get_bd_pins MEM_WB_PR_0/PC_plus_2_out] [get_bd_pins WB_mux_0/PC_plus_2]
  connect_bd_net -net MEM_WB_PR_0_RD_out1 [get_bd_ports Load_address] [get_bd_pins Forwarding_unit_0/RD_wb] [get_bd_pins Hazard_Detection_Unit_0/RD_wb] [get_bd_pins MEM_WB_PR_0/RD_out] [get_bd_pins RR_Forwarding_Unit_0/RD] [get_bd_pins Registers_0/RD] [get_bd_pins Special_2_Control_0/RD_wb] [get_bd_pins Special_Control_0/RD]
  connect_bd_net -net MEM_WB_PR_0_RegWrite_out [get_bd_pins Forwarding_unit_0/RegWrite_wb] [get_bd_pins Hazard_Detection_Unit_0/RegWrite_wb] [get_bd_pins MEM_WB_PR_0/RegWrite_out] [get_bd_pins RR_Forwarding_Unit_0/RegWrite] [get_bd_pins Registers_0/RegWrite] [get_bd_pins Special_2_Control_0/RegWrite_wb] [get_bd_pins Special_Control_0/RegWrite]
  connect_bd_net -net MEM_WB_PR_0_S_out [get_bd_pins MEM_WB_PR_0/S_out] [get_bd_pins Special_Control_0/S]
  connect_bd_net -net MEM_WB_PR_0_ZWrite_out [get_bd_pins CZ_Control_Unit_0/ZWrite_wb] [get_bd_pins Carry_and_Zero_flag_0/ZWrite] [get_bd_pins MEM_WB_PR_0/ZWrite_out]
  connect_bd_net -net MEM_WB_PR_0_alu_out_out [get_bd_pins CZ_Control_Unit_0/alu_out_wb] [get_bd_pins Carry_and_Zero_flag_0/alu_in] [get_bd_pins MEM_WB_PR_0/alu_out_out] [get_bd_pins WB_mux_0/alu_out]
  connect_bd_net -net MEM_WB_PR_0_carry_out [get_bd_pins CZ_Control_Unit_0/carry_out_wb] [get_bd_pins Carry_and_Zero_flag_0/carry_in] [get_bd_pins MEM_WB_PR_0/carry_out]
  connect_bd_net -net MEM_WB_PR_0_dm_data_out [get_bd_pins CZ_Control_Unit_0/dm_data_wb] [get_bd_pins Carry_and_Zero_flag_0/dm_data_in] [get_bd_pins MEM_WB_PR_0/dm_data_out] [get_bd_pins WB_mux_0/dm_data]
  connect_bd_net -net MEM_WB_PR_0_invalid1_out [get_bd_pins CZ_Control_Unit_0/invalid1_wb] [get_bd_pins Forwarding_unit_0/invalid1_wb] [get_bd_pins MEM_WB_PR_0/invalid1_out] [get_bd_pins RR_Forwarding_Unit_0/invalid1_wb]
  connect_bd_net -net MEM_WB_PR_0_mem_addr_out [get_bd_ports Store_address] [get_bd_pins MEM_WB_PR_0/mem_addr_out]
  connect_bd_net -net MEM_WB_PR_0_mem_data_out [get_bd_ports Store_data] [get_bd_pins MEM_WB_PR_0/mem_data_out]
  connect_bd_net -net PC_0_PC [get_bd_pins IF_ID_PR_0/PC_in] [get_bd_pins Instruction_Memory_0/PC] [get_bd_pins PC_0/PC] [get_bd_pins PC_0/PC_in]
  connect_bd_net -net PC_0_PC_plus_2 [get_bd_pins IF_ID_PR_0/PC_plus_2_in] [get_bd_pins PC_0/PC_plus_2]
  connect_bd_net -net RB_select_0_RB_final [get_bd_pins Hazard_Detection_Unit_0/RB_RR] [get_bd_pins RB_select_0/RB_final] [get_bd_pins RR_EX_PR_0/RB_final_in] [get_bd_pins RR_Forwarding_Unit_0/RB_in] [get_bd_pins Registers_0/RB_in]
  connect_bd_net -net RB_select_0_SM_reg [get_bd_pins RB_select_0/SM_reg] [get_bd_pins RR_EX_PR_0/SM_reg_in]
  connect_bd_net -net RR_Control_0_ALUOp [get_bd_pins RR_Control_0/ALUOp] [get_bd_pins RR_EX_PR_0/ALUOp_in]
  connect_bd_net -net RR_Control_0_ALUSrc1 [get_bd_pins RR_Control_0/ALUSrc1] [get_bd_pins RR_EX_PR_0/ALUSrc1_in]
  connect_bd_net -net RR_Control_0_ALUSrc2 [get_bd_pins RR_Control_0/ALUSrc2] [get_bd_pins RR_EX_PR_0/ALUSrc2_in]
  connect_bd_net -net RR_Control_0_CWrite [get_bd_pins RR_Control_0/CWrite] [get_bd_pins RR_EX_PR_0/CWrite_in]
  connect_bd_net -net RR_Control_0_L [get_bd_pins Hazard_Detection_Unit_0/L] [get_bd_pins LM_and_SM_unit_0/L] [get_bd_pins RR_Control_0/L] [get_bd_pins RR_EX_PR_0/L_in]
  connect_bd_net -net RR_Control_0_MemRead [get_bd_pins RR_Control_0/MemRead] [get_bd_pins RR_EX_PR_0/MemRead_in]
  connect_bd_net -net RR_Control_0_MemWrite [get_bd_pins RR_Control_0/MemWrite] [get_bd_pins RR_EX_PR_0/MemWrite_in]
  connect_bd_net -net RR_Control_0_MemtoReg [get_bd_pins RR_Control_0/MemtoReg] [get_bd_pins RR_EX_PR_0/MemtoReg_in]
  connect_bd_net -net RR_Control_0_RegDst [get_bd_pins RR_Control_0/RegDst] [get_bd_pins RR_EX_PR_0/RegDst_in]
  connect_bd_net -net RR_Control_0_S [get_bd_pins Hazard_Detection_Unit_0/S] [get_bd_pins LM_and_SM_unit_0/S] [get_bd_pins RR_Control_0/S] [get_bd_pins RR_EX_PR_0/S_in]
  connect_bd_net -net RR_Control_0_S1 [get_bd_pins Branch_PC_0/S1] [get_bd_pins RR_Control_0/S1]
  connect_bd_net -net RR_Control_0_S2 [get_bd_pins Branch_PC_0/S2] [get_bd_pins RR_Control_0/S2]
  connect_bd_net -net RR_Control_0_S3 [get_bd_pins Branch_PC_0/S3] [get_bd_pins RR_Control_0/S3]
  connect_bd_net -net RR_Control_0_ZWrite [get_bd_pins RR_Control_0/ZWrite] [get_bd_pins RR_EX_PR_0/ZWrite_in]
  connect_bd_net -net RR_Control_0_branch [get_bd_pins Hazard_Detection_Unit_0/branch_rr] [get_bd_pins PC_0/branch_rr] [get_bd_pins RR_Control_0/branch]
  connect_bd_net -net RR_EX_PR_0_ALUOp_out [get_bd_pins ALU_Control_unit_0/ALUOp] [get_bd_pins RR_EX_PR_0/ALUOp_out]
  connect_bd_net -net RR_EX_PR_0_ALUSrc1_out [get_bd_pins ALU_inputs_0/ALUSrc1] [get_bd_pins RR_EX_PR_0/ALUSrc1_out]
  connect_bd_net -net RR_EX_PR_0_ALUSrc2_out [get_bd_pins ALU_inputs_0/ALUSrc2] [get_bd_pins RR_EX_PR_0/ALUSrc2_out]
  connect_bd_net -net RR_EX_PR_0_CWrite_out [get_bd_pins EX_MEM_PR_0/CWrite_in] [get_bd_pins RR_EX_PR_0/CWrite_out]
  connect_bd_net -net RR_EX_PR_0_Imm2_out [get_bd_pins EX_MEM_PR_0/Imm2_in] [get_bd_pins RR_EX_PR_0/Imm2_out]
  connect_bd_net -net RR_EX_PR_0_L_out [get_bd_pins ALU_inputs_0/L] [get_bd_pins EX_MEM_PR_0/L_in] [get_bd_pins Hazard_Detection_Unit_0/L_ex] [get_bd_pins LM_and_SM_unit_0/L_ex] [get_bd_pins RR_EX_PR_0/L_out]
  connect_bd_net -net RR_EX_PR_0_MemRead_out [get_bd_pins EX_MEM_PR_0/MemRead_in] [get_bd_pins Hazard_Detection_Unit_0/MemRead_ex] [get_bd_pins RR_EX_PR_0/MemRead_out]
  connect_bd_net -net RR_EX_PR_0_MemWrite_out [get_bd_pins EX_MEM_PR_0/MemWrite_in] [get_bd_pins RR_EX_PR_0/MemWrite_out]
  connect_bd_net -net RR_EX_PR_0_MemtoReg_out [get_bd_pins EX_MEM_PR_0/MemtoReg_in] [get_bd_pins RR_EX_PR_0/MemtoReg_out]
  connect_bd_net -net RR_EX_PR_0_PC_out [get_bd_pins EX_MEM_PR_0/PC_in] [get_bd_pins RR_EX_PR_0/PC_out]
  connect_bd_net -net RR_EX_PR_0_PC_plus_2_out [get_bd_pins EX_MEM_PR_0/PC_plus_2_in] [get_bd_pins RR_EX_PR_0/PC_plus_2_out]
  connect_bd_net -net RR_EX_PR_0_RA_final_out [get_bd_pins Destination_reg_sele_0/RA] [get_bd_pins Forwarding_unit_0/RA] [get_bd_pins RR_EX_PR_0/RA_final_out]
  connect_bd_net -net RR_EX_PR_0_RB_final_out [get_bd_pins Destination_reg_sele_0/RB] [get_bd_pins Forwarding_unit_0/RB] [get_bd_pins RR_EX_PR_0/RB_final_out]
  connect_bd_net -net RR_EX_PR_0_RC_out [get_bd_pins Destination_reg_sele_0/RC] [get_bd_pins RR_EX_PR_0/RC_out]
  connect_bd_net -net RR_EX_PR_0_RegDst_out [get_bd_pins Destination_reg_sele_0/RegDst] [get_bd_pins RR_EX_PR_0/RegDst_out]
  connect_bd_net -net RR_EX_PR_0_SE_Imm1_out [get_bd_pins ALU_inputs_0/SE_Imm1] [get_bd_pins RR_EX_PR_0/SE_Imm1_out]
  connect_bd_net -net RR_EX_PR_0_SM_reg_out [get_bd_pins Destination_reg_sele_0/LM_reg] [get_bd_pins RR_EX_PR_0/SM_reg_out]
  connect_bd_net -net RR_EX_PR_0_S_out [get_bd_pins ALU_inputs_0/S] [get_bd_pins EX_MEM_PR_0/S_in] [get_bd_pins LM_and_SM_unit_0/S_ex] [get_bd_pins RR_EX_PR_0/S_out]
  connect_bd_net -net RR_EX_PR_0_ZWrite_out [get_bd_pins EX_MEM_PR_0/ZWrite_in] [get_bd_pins RR_EX_PR_0/ZWrite_out]
  connect_bd_net -net RR_EX_PR_0_comp_out [get_bd_pins ALU_inputs_0/comp] [get_bd_pins RR_EX_PR_0/comp_out]
  connect_bd_net -net RR_EX_PR_0_cz_out [get_bd_pins ALU_Control_unit_0/cz] [get_bd_pins RR_EX_PR_0/cz_out] [get_bd_pins Reg_Write_Control_0/cz]
  connect_bd_net -net RR_EX_PR_0_i_out [get_bd_pins LM_and_SM_unit_0/i_ex] [get_bd_pins RR_EX_PR_0/i_out]
  connect_bd_net -net RR_EX_PR_0_invalid1_out [get_bd_pins EX_MEM_PR_0/invalid1_in] [get_bd_pins RR_EX_PR_0/invalid1_out] [get_bd_pins Reg_Write_Control_0/invalid1]
  connect_bd_net -net RR_EX_PR_0_op_out [get_bd_pins ALU_Control_unit_0/opcode] [get_bd_pins ALU_inputs_0/op] [get_bd_pins EX_MEM_PR_0/op_in] [get_bd_pins Hazard_Detection_Unit_0/op_ex] [get_bd_pins RR_EX_PR_0/op_out] [get_bd_pins Reg_Write_Control_0/op]
  connect_bd_net -net RR_EX_PR_0_ra_out [get_bd_pins ALU_inputs_0/ra] [get_bd_pins RR_EX_PR_0/ra_out]
  connect_bd_net -net RR_EX_PR_0_rb_out [get_bd_pins ALU_inputs_0/rb] [get_bd_pins RR_EX_PR_0/rb_out]
  connect_bd_net -net RR_EX_PR_0_stall_out [get_bd_pins RR_EX_PR_0/stall_out] [get_bd_pins Reg_Write_Control_0/stall]
  connect_bd_net -net RR_EX_PR_0_x_out [get_bd_pins RR_EX_PR_0/x_out] [get_bd_pins Special_2_Control_0/x_ex]
  connect_bd_net -net Reg_Write_Control_0_RegWrite [get_bd_pins EX_MEM_PR_0/RegWrite_in] [get_bd_pins Reg_Write_Control_0/RegWrite]
  connect_bd_net -net Registers_0_R0 [get_bd_ports R0_0] [get_bd_pins Registers_0/R0]
  connect_bd_net -net Registers_0_R1 [get_bd_ports R1_0] [get_bd_pins Registers_0/R1]
  connect_bd_net -net Registers_0_R2 [get_bd_ports R2_0] [get_bd_pins Registers_0/R2]
  connect_bd_net -net Registers_0_R3 [get_bd_ports R3_0] [get_bd_pins Registers_0/R3]
  connect_bd_net -net Registers_0_R4 [get_bd_ports R4_0] [get_bd_pins Registers_0/R4]
  connect_bd_net -net Registers_0_R5 [get_bd_ports R5_0] [get_bd_pins Registers_0/R5]
  connect_bd_net -net Registers_0_R6 [get_bd_ports R6_0] [get_bd_pins Registers_0/R6]
  connect_bd_net -net Registers_0_R7 [get_bd_ports R7_0] [get_bd_pins Registers_0/R7]
  connect_bd_net -net Registers_0_ra [get_bd_pins Branch_PC_0/ra] [get_bd_pins Comparator_0/ra] [get_bd_pins RR_EX_PR_0/ra_in] [get_bd_pins RR_Forwarding_Unit_0/ra_final]
  connect_bd_net -net Registers_0_ra1 [get_bd_pins RR_Forwarding_Unit_0/ra] [get_bd_pins Registers_0/ra]
  connect_bd_net -net Registers_0_rb [get_bd_pins Branch_PC_0/rb] [get_bd_pins Comparator_0/rb] [get_bd_pins RR_EX_PR_0/rb_in] [get_bd_pins RR_Forwarding_Unit_0/rb_final]
  connect_bd_net -net Registers_0_rb1 [get_bd_pins RR_Forwarding_Unit_0/rb] [get_bd_pins Registers_0/rb]
  connect_bd_net -net Registers_0_write_data_rr [get_bd_pins PC_0/write_data_rr] [get_bd_pins Registers_0/write_data_rr]
  connect_bd_net -net Sign_Extension_0_SE_Imm1 [get_bd_pins ID_RR_PR_0/SE_Imm1_in] [get_bd_pins Sign_Extension_0/SE_Imm1]
  connect_bd_net -net Sign_Extension_0_SE_Imm2 [get_bd_pins ID_RR_PR_0/SE_Imm2_in] [get_bd_pins Sign_Extension_0/SE_Imm2]
  connect_bd_net -net Special_2_Control_0_special_2 [get_bd_pins Hazard_Detection_Unit_0/special_2] [get_bd_pins Special_2_Control_0/special_2]
  connect_bd_net -net Special_Control_0_special_wb [get_bd_pins Hazard_Detection_Unit_0/special_wb] [get_bd_pins PC_0/special_wb] [get_bd_pins Special_Control_0/special_wb]
  connect_bd_net -net WB_mux_0_write_data1 [get_bd_ports Load_data] [get_bd_pins ALU_inputs_0/write_data_wb] [get_bd_pins RR_Forwarding_Unit_0/write_data] [get_bd_pins Registers_0/write_data] [get_bd_pins Registers_0/write_data_wb] [get_bd_pins WB_mux_0/write_data]
  connect_bd_net -net Write_Data_Select_0_write_data [get_bd_pins Data_memory_0/write_data] [get_bd_pins MEM_WB_PR_0/mem_data_in] [get_bd_pins Write_Data_Select_0/write_data]
  connect_bd_net -net clk_0_1 [get_bd_ports clk_0] [get_bd_pins Carry_and_Zero_flag_0/clk] [get_bd_pins Data_memory_0/clk] [get_bd_pins EX_MEM_PR_0/clk] [get_bd_pins ID_RR_PR_0/clk] [get_bd_pins IF_ID_PR_0/clk] [get_bd_pins MEM_WB_PR_0/clk] [get_bd_pins PC_0/clk] [get_bd_pins RR_EX_PR_0/clk] [get_bd_pins Registers_0/clk] [get_bd_pins Special_2_Control_0/clk]
  connect_bd_net -net rst_0_1 [get_bd_ports rst_0] [get_bd_pins Carry_and_Zero_flag_0/rst] [get_bd_pins Data_memory_0/rst] [get_bd_pins EX_MEM_PR_0/rst] [get_bd_pins ID_RR_PR_0/rst] [get_bd_pins IF_ID_PR_0/rst] [get_bd_pins Instruction_Memory_0/rst] [get_bd_pins MEM_WB_PR_0/rst] [get_bd_pins PC_0/rst] [get_bd_pins RR_EX_PR_0/rst] [get_bd_pins Registers_0/rst] [get_bd_pins Special_2_Control_0/rst]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins RR_EX_PR_0/RR_EX_Write] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins EX_MEM_PR_0/EX_MEM_Write] [get_bd_pins xlconstant_1/dout]
  connect_bd_net -net xlconstant_2_dout [get_bd_pins MEM_WB_PR_0/MEM_WB_Write] [get_bd_pins xlconstant_2/dout]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


