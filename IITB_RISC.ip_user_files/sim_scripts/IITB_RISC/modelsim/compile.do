vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xlconstant_v1_1_6

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xlconstant_v1_1_6 modelsim_lib/msim/xlconstant_v1_1_6

vlog -work xil_defaultlib -64 -incr \
"../../../../IITB_RISC.srcs/sources_1/bd/IITB_RISC/ip/IITB_RISC_PC_0_0/sim/IITB_RISC_PC_0_0.v" \
"../../../../IITB_RISC.srcs/sources_1/bd/IITB_RISC/ip/IITB_RISC_Instruction_Memory_0_0/sim/IITB_RISC_Instruction_Memory_0_0.v" \
"../../../../IITB_RISC.srcs/sources_1/bd/IITB_RISC/ip/IITB_RISC_IF_ID_PR_0_1/sim/IITB_RISC_IF_ID_PR_0_1.v" \
"../../../../IITB_RISC.srcs/sources_1/bd/IITB_RISC/ip/IITB_RISC_Instruction_Decoder_0_0/sim/IITB_RISC_Instruction_Decoder_0_0.v" \
"../../../../IITB_RISC.srcs/sources_1/bd/IITB_RISC/ip/IITB_RISC_Sign_Extension_0_0/sim/IITB_RISC_Sign_Extension_0_0.v" \
"../../../../IITB_RISC.srcs/sources_1/bd/IITB_RISC/ip/IITB_RISC_ID_RR_PR_0_0/sim/IITB_RISC_ID_RR_PR_0_0.v" \
"../../../../IITB_RISC.srcs/sources_1/bd/IITB_RISC/ip/IITB_RISC_RR_Control_0_0/sim/IITB_RISC_RR_Control_0_0.v" \
"../../../../IITB_RISC.srcs/sources_1/bd/IITB_RISC/ip/IITB_RISC_LM_and_SM_unit_0_0/sim/IITB_RISC_LM_and_SM_unit_0_0.v" \
"../../../../IITB_RISC.srcs/sources_1/bd/IITB_RISC/ip/IITB_RISC_Branch_PC_0_0/sim/IITB_RISC_Branch_PC_0_0.v" \
"../../../../IITB_RISC.srcs/sources_1/bd/IITB_RISC/ip/IITB_RISC_Comparator_0_0/sim/IITB_RISC_Comparator_0_0.v" \
"../../../../IITB_RISC.srcs/sources_1/bd/IITB_RISC/ip/IITB_RISC_RR_EX_PR_0_0/sim/IITB_RISC_RR_EX_PR_0_0.v" \
"../../../../IITB_RISC.srcs/sources_1/bd/IITB_RISC/ip/IITB_RISC_Registers_0_5/sim/IITB_RISC_Registers_0_5.v" \
"../../../../IITB_RISC.srcs/sources_1/bd/IITB_RISC/ip/IITB_RISC_RB_select_0_1/sim/IITB_RISC_RB_select_0_1.v" \
"../../../../IITB_RISC.srcs/sources_1/bd/IITB_RISC/ip/IITB_RISC_ALU_inputs_0_0/sim/IITB_RISC_ALU_inputs_0_0.v" \
"../../../../IITB_RISC.srcs/sources_1/bd/IITB_RISC/ip/IITB_RISC_ALU_0_0/sim/IITB_RISC_ALU_0_0.v" \
"../../../../IITB_RISC.srcs/sources_1/bd/IITB_RISC/ip/IITB_RISC_Carry_and_Zero_flag_0_0/sim/IITB_RISC_Carry_and_Zero_flag_0_0.v" \
"../../../../IITB_RISC.srcs/sources_1/bd/IITB_RISC/ip/IITB_RISC_Reg_Write_Control_0_0/sim/IITB_RISC_Reg_Write_Control_0_0.v" \
"../../../../IITB_RISC.srcs/sources_1/bd/IITB_RISC/ip/IITB_RISC_Destination_reg_sele_0_0/sim/IITB_RISC_Destination_reg_sele_0_0.v" \
"../../../../IITB_RISC.srcs/sources_1/bd/IITB_RISC/ip/IITB_RISC_ALU_Control_unit_0_0/sim/IITB_RISC_ALU_Control_unit_0_0.v" \
"../../../../IITB_RISC.srcs/sources_1/bd/IITB_RISC/ip/IITB_RISC_EX_MEM_PR_0_0/sim/IITB_RISC_EX_MEM_PR_0_0.v" \
"../../../../IITB_RISC.srcs/sources_1/bd/IITB_RISC/ip/IITB_RISC_Forwarding_unit_0_0/sim/IITB_RISC_Forwarding_unit_0_0.v" \
"../../../../IITB_RISC.srcs/sources_1/bd/IITB_RISC/ip/IITB_RISC_Data_memory_0_0/sim/IITB_RISC_Data_memory_0_0.v" \
"../../../../IITB_RISC.srcs/sources_1/bd/IITB_RISC/ip/IITB_RISC_Write_Data_Select_0_0/sim/IITB_RISC_Write_Data_Select_0_0.v" \
"../../../../IITB_RISC.srcs/sources_1/bd/IITB_RISC/ip/IITB_RISC_MEM_WB_PR_0_0/sim/IITB_RISC_MEM_WB_PR_0_0.v" \
"../../../../IITB_RISC.srcs/sources_1/bd/IITB_RISC/ip/IITB_RISC_WB_mux_0_0/sim/IITB_RISC_WB_mux_0_0.v" \
"../../../../IITB_RISC.srcs/sources_1/bd/IITB_RISC/ip/IITB_RISC_Special_Control_0_0/sim/IITB_RISC_Special_Control_0_0.v" \
"../../../../IITB_RISC.srcs/sources_1/bd/IITB_RISC/ip/IITB_RISC_Special_2_Control_0_0/sim/IITB_RISC_Special_2_Control_0_0.v" \
"../../../../IITB_RISC.srcs/sources_1/bd/IITB_RISC/ip/IITB_RISC_Hazard_Detection_Unit_0_0/sim/IITB_RISC_Hazard_Detection_Unit_0_0.v" \

vlog -work xlconstant_v1_1_6 -64 -incr \
"../../../../IITB_RISC.srcs/sources_1/bd/IITB_RISC/ipshared/66e7/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr \
"../../../../IITB_RISC.srcs/sources_1/bd/IITB_RISC/ip/IITB_RISC_xlconstant_0_0/sim/IITB_RISC_xlconstant_0_0.v" \
"../../../../IITB_RISC.srcs/sources_1/bd/IITB_RISC/ip/IITB_RISC_xlconstant_0_1/sim/IITB_RISC_xlconstant_0_1.v" \
"../../../../IITB_RISC.srcs/sources_1/bd/IITB_RISC/ip/IITB_RISC_xlconstant_0_2/sim/IITB_RISC_xlconstant_0_2.v" \
"../../../../IITB_RISC.srcs/sources_1/bd/IITB_RISC/ip/IITB_RISC_RR_Forwarding_Unit_0_0/sim/IITB_RISC_RR_Forwarding_Unit_0_0.v" \
"../../../../IITB_RISC.srcs/sources_1/bd/IITB_RISC/ip/IITB_RISC_CZ_Control_Unit_0_0/sim/IITB_RISC_CZ_Control_Unit_0_0.v" \
"../../../../IITB_RISC.srcs/sources_1/bd/IITB_RISC/sim/IITB_RISC.v" \

vlog -work xil_defaultlib \
"glbl.v"

