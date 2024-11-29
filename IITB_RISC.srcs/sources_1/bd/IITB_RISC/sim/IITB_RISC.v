//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Thu Sep 19 16:56:31 2024
//Host        : CHEEMz-PC running 64-bit major release  (build 9200)
//Command     : generate_target IITB_RISC.bd
//Design      : IITB_RISC
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "IITB_RISC,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=IITB_RISC,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=33,numReposBlks=33,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=30,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "IITB_RISC.hwdef" *) 
module IITB_RISC
   (Load_address,
    Load_data,
    PC_out_0,
    R0_0,
    R1_0,
    R2_0,
    R3_0,
    R4_0,
    R5_0,
    R6_0,
    R7_0,
    Store_address,
    Store_data,
    c_0,
    clk_0,
    rst_0,
    z_0);
  output [2:0]Load_address;
  output [15:0]Load_data;
  output [15:0]PC_out_0;
  output [15:0]R0_0;
  output [15:0]R1_0;
  output [15:0]R2_0;
  output [15:0]R3_0;
  output [15:0]R4_0;
  output [15:0]R5_0;
  output [15:0]R6_0;
  output [15:0]R7_0;
  output [15:0]Store_address;
  output [15:0]Store_data;
  output c_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_0, ASSOCIATED_RESET rst_0, CLK_DOMAIN IITB_RISC_clk_0, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input clk_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST_0, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input rst_0;
  output z_0;

  wire [15:0]ALU_0_alu_out;
  wire ALU_0_carry_out;
  wire [1:0]ALU_Control_unit_0_ALU_CB;
  wire [15:0]ALU_inputs_0_op_1;
  wire [15:0]ALU_inputs_0_op_2;
  wire [15:0]ALU_inputs_0_ra_final;
  wire [15:0]ALU_inputs_0_rb_final;
  wire [15:0]Branch_PC_0_branch_pc;
  wire CZ_Control_Unit_0_Z_final;
  wire Carry_and_Zero_flag_0_c;
  wire Carry_and_Zero_flag_0_c1;
  wire Carry_and_Zero_flag_0_z;
  wire Comparator_0_ET;
  wire Comparator_0_LT;
  wire [15:0]Data_memory_0_dm_data;
  wire [2:0]Destination_reg_sele_0_RD;
  wire EX_MEM_PR_0_CWrite_out;
  wire [8:0]EX_MEM_PR_0_Imm2_out;
  wire EX_MEM_PR_0_L_out;
  wire EX_MEM_PR_0_MemRead_out;
  wire EX_MEM_PR_0_MemWrite_out;
  wire [1:0]EX_MEM_PR_0_MemtoReg_out;
  wire [15:0]EX_MEM_PR_0_PC_out;
  wire [15:0]EX_MEM_PR_0_PC_plus_2_out;
  wire [2:0]EX_MEM_PR_0_RD_out;
  wire EX_MEM_PR_0_RegWrite_out;
  wire EX_MEM_PR_0_S_out;
  wire [1:0]EX_MEM_PR_0_ZWrite_out;
  wire [15:0]EX_MEM_PR_0_alu_out_out;
  wire EX_MEM_PR_0_carry_out;
  wire EX_MEM_PR_0_invalid1_out;
  wire [3:0]EX_MEM_PR_0_op_out;
  wire [15:0]EX_MEM_PR_0_ra_out;
  wire [15:0]EX_MEM_PR_0_rb_out;
  wire [1:0]Forwarding_unit_0_forwardA;
  wire [1:0]Forwarding_unit_0_forwardB;
  wire Hazard_Detection_Unit_0_EX_FLUSH;
  wire Hazard_Detection_Unit_0_ID_FLUSH;
  wire Hazard_Detection_Unit_0_ID_Write;
  wire Hazard_Detection_Unit_0_IF_FLUSH;
  wire Hazard_Detection_Unit_0_IF_Write;
  wire Hazard_Detection_Unit_0_MEM_FLUSH;
  wire Hazard_Detection_Unit_0_PC_Write;
  wire Hazard_Detection_Unit_0_RR_FLUSH;
  wire Hazard_Detection_Unit_0_stall;
  wire [8:0]ID_RR_PR_0_Imm2_out;
  wire [15:0]ID_RR_PR_0_PC_out;
  wire [15:0]ID_RR_PR_0_PC_plus_2_out;
  wire [2:0]ID_RR_PR_0_RA_out;
  wire [2:0]ID_RR_PR_0_RB_out;
  wire [2:0]ID_RR_PR_0_RC_out1;
  wire [15:0]ID_RR_PR_0_SE_Imm1_out;
  wire [15:0]ID_RR_PR_0_SE_Imm2_out;
  wire ID_RR_PR_0_comp_out;
  wire [1:0]ID_RR_PR_0_cz_out;
  wire ID_RR_PR_0_invalid1_out;
  wire [3:0]ID_RR_PR_0_op_out;
  wire [15:0]IF_ID_PR_0_PC_out;
  wire [15:0]IF_ID_PR_0_PC_plus_2_out;
  wire [15:0]IF_ID_PR_0_instr_out;
  wire IF_ID_PR_0_invalid1;
  wire [5:0]Instruction_Decoder_0_Imm1;
  wire [8:0]Instruction_Decoder_0_Imm2;
  wire [2:0]Instruction_Decoder_0_RA;
  wire [2:0]Instruction_Decoder_0_RB;
  wire [2:0]Instruction_Decoder_0_RC;
  wire Instruction_Decoder_0_comp;
  wire [1:0]Instruction_Decoder_0_cz;
  wire [3:0]Instruction_Decoder_0_op;
  wire [15:0]Instruction_Memory_0_instr;
  wire [2:0]LM_and_SM_unit_0_i;
  wire [2:0]LM_and_SM_unit_0_x;
  wire MEM_WB_PR_0_CWrite_out;
  wire [8:0]MEM_WB_PR_0_Imm2_out;
  wire MEM_WB_PR_0_L_out;
  wire [1:0]MEM_WB_PR_0_MemtoReg_out;
  wire [15:0]MEM_WB_PR_0_PC_out;
  wire [15:0]MEM_WB_PR_0_PC_plus_2_out;
  wire [2:0]MEM_WB_PR_0_RD_out1;
  wire MEM_WB_PR_0_RegWrite_out;
  wire MEM_WB_PR_0_S_out;
  wire [1:0]MEM_WB_PR_0_ZWrite_out;
  wire [15:0]MEM_WB_PR_0_alu_out_out;
  wire MEM_WB_PR_0_carry_out;
  wire [15:0]MEM_WB_PR_0_dm_data_out;
  wire MEM_WB_PR_0_invalid1_out;
  wire [15:0]MEM_WB_PR_0_mem_addr_out;
  wire [15:0]MEM_WB_PR_0_mem_data_out;
  wire [15:0]PC_0_PC;
  wire [15:0]PC_0_PC_plus_2;
  wire [2:0]RB_select_0_RB_final;
  wire [2:0]RB_select_0_SM_reg;
  wire RR_Control_0_ALUOp;
  wire RR_Control_0_ALUSrc1;
  wire RR_Control_0_ALUSrc2;
  wire RR_Control_0_CWrite;
  wire RR_Control_0_L;
  wire RR_Control_0_MemRead;
  wire RR_Control_0_MemWrite;
  wire [1:0]RR_Control_0_MemtoReg;
  wire [1:0]RR_Control_0_RegDst;
  wire RR_Control_0_S;
  wire [1:0]RR_Control_0_S1;
  wire [1:0]RR_Control_0_S2;
  wire [1:0]RR_Control_0_S3;
  wire [1:0]RR_Control_0_ZWrite;
  wire [1:0]RR_Control_0_branch;
  wire RR_EX_PR_0_ALUOp_out;
  wire RR_EX_PR_0_ALUSrc1_out;
  wire RR_EX_PR_0_ALUSrc2_out;
  wire RR_EX_PR_0_CWrite_out;
  wire [8:0]RR_EX_PR_0_Imm2_out;
  wire RR_EX_PR_0_L_out;
  wire RR_EX_PR_0_MemRead_out;
  wire RR_EX_PR_0_MemWrite_out;
  wire [1:0]RR_EX_PR_0_MemtoReg_out;
  wire [15:0]RR_EX_PR_0_PC_out;
  wire [15:0]RR_EX_PR_0_PC_plus_2_out;
  wire [2:0]RR_EX_PR_0_RA_final_out;
  wire [2:0]RR_EX_PR_0_RB_final_out;
  wire [2:0]RR_EX_PR_0_RC_out;
  wire [1:0]RR_EX_PR_0_RegDst_out;
  wire [15:0]RR_EX_PR_0_SE_Imm1_out;
  wire [2:0]RR_EX_PR_0_SM_reg_out;
  wire RR_EX_PR_0_S_out;
  wire [1:0]RR_EX_PR_0_ZWrite_out;
  wire RR_EX_PR_0_comp_out;
  wire [1:0]RR_EX_PR_0_cz_out;
  wire [2:0]RR_EX_PR_0_i_out;
  wire RR_EX_PR_0_invalid1_out;
  wire [3:0]RR_EX_PR_0_op_out;
  wire [15:0]RR_EX_PR_0_ra_out;
  wire [15:0]RR_EX_PR_0_rb_out;
  wire RR_EX_PR_0_stall_out;
  wire [2:0]RR_EX_PR_0_x_out;
  wire Reg_Write_Control_0_RegWrite;
  wire [15:0]Registers_0_R0;
  wire [15:0]Registers_0_R1;
  wire [15:0]Registers_0_R2;
  wire [15:0]Registers_0_R3;
  wire [15:0]Registers_0_R4;
  wire [15:0]Registers_0_R5;
  wire [15:0]Registers_0_R6;
  wire [15:0]Registers_0_R7;
  wire [15:0]Registers_0_ra;
  wire [15:0]Registers_0_ra1;
  wire [15:0]Registers_0_rb;
  wire [15:0]Registers_0_rb1;
  wire [15:0]Registers_0_write_data_rr;
  wire [15:0]Sign_Extension_0_SE_Imm1;
  wire [15:0]Sign_Extension_0_SE_Imm2;
  wire Special_2_Control_0_special_2;
  wire Special_Control_0_special_wb;
  wire [15:0]WB_mux_0_write_data1;
  wire [15:0]Write_Data_Select_0_write_data;
  wire clk_0_1;
  wire rst_0_1;
  wire [0:0]xlconstant_0_dout;
  wire [0:0]xlconstant_1_dout;
  wire [0:0]xlconstant_2_dout;

  assign Load_address[2:0] = MEM_WB_PR_0_RD_out1;
  assign Load_data[15:0] = WB_mux_0_write_data1;
  assign PC_out_0[15:0] = MEM_WB_PR_0_PC_out;
  assign R0_0[15:0] = Registers_0_R0;
  assign R1_0[15:0] = Registers_0_R1;
  assign R2_0[15:0] = Registers_0_R2;
  assign R3_0[15:0] = Registers_0_R3;
  assign R4_0[15:0] = Registers_0_R4;
  assign R5_0[15:0] = Registers_0_R5;
  assign R6_0[15:0] = Registers_0_R6;
  assign R7_0[15:0] = Registers_0_R7;
  assign Store_address[15:0] = MEM_WB_PR_0_mem_addr_out;
  assign Store_data[15:0] = MEM_WB_PR_0_mem_data_out;
  assign c_0 = Carry_and_Zero_flag_0_c1;
  assign clk_0_1 = clk_0;
  assign rst_0_1 = rst_0;
  assign z_0 = Carry_and_Zero_flag_0_z;
  IITB_RISC_ALU_0_0 ALU_0
       (.ALU_CB(ALU_Control_unit_0_ALU_CB),
        .alu_out(ALU_0_alu_out),
        .c(Carry_and_Zero_flag_0_c),
        .carry_out(ALU_0_carry_out),
        .op_1(ALU_inputs_0_op_1),
        .op_2(ALU_inputs_0_op_2));
  IITB_RISC_ALU_Control_unit_0_0 ALU_Control_unit_0
       (.ALUOp(RR_EX_PR_0_ALUOp_out),
        .ALU_CB(ALU_Control_unit_0_ALU_CB),
        .cz(RR_EX_PR_0_cz_out),
        .opcode(RR_EX_PR_0_op_out));
  IITB_RISC_ALU_inputs_0_0 ALU_inputs_0
       (.ALUSrc1(RR_EX_PR_0_ALUSrc1_out),
        .ALUSrc2(RR_EX_PR_0_ALUSrc2_out),
        .Imm2_mem(EX_MEM_PR_0_Imm2_out),
        .L(RR_EX_PR_0_L_out),
        .L_mem(EX_MEM_PR_0_L_out),
        .S(RR_EX_PR_0_S_out),
        .SE_Imm1(RR_EX_PR_0_SE_Imm1_out),
        .S_mem(EX_MEM_PR_0_S_out),
        .alu_out_mem(EX_MEM_PR_0_alu_out_out),
        .comp(RR_EX_PR_0_comp_out),
        .forwardA(Forwarding_unit_0_forwardA),
        .forwardB(Forwarding_unit_0_forwardB),
        .op(RR_EX_PR_0_op_out),
        .op_1(ALU_inputs_0_op_1),
        .op_2(ALU_inputs_0_op_2),
        .op_mem(EX_MEM_PR_0_op_out),
        .ra(RR_EX_PR_0_ra_out),
        .ra_final(ALU_inputs_0_ra_final),
        .rb(RR_EX_PR_0_rb_out),
        .rb_final(ALU_inputs_0_rb_final),
        .write_data_wb(WB_mux_0_write_data1));
  IITB_RISC_Branch_PC_0_0 Branch_PC_0
       (.PC(ID_RR_PR_0_PC_out),
        .S1(RR_Control_0_S1[0]),
        .S2(RR_Control_0_S2[0]),
        .S3(RR_Control_0_S3[0]),
        .SE_Imm1(ID_RR_PR_0_SE_Imm1_out),
        .SE_Imm2(ID_RR_PR_0_SE_Imm2_out),
        .branch_pc(Branch_PC_0_branch_pc),
        .ra(Registers_0_ra),
        .rb(Registers_0_rb));
  IITB_RISC_CZ_Control_Unit_0_0 CZ_Control_Unit_0
       (.C(Carry_and_Zero_flag_0_c1),
        .CWrite_mem(EX_MEM_PR_0_CWrite_out),
        .CWrite_wb(MEM_WB_PR_0_CWrite_out),
        .C_final(Carry_and_Zero_flag_0_c),
        .Z(Carry_and_Zero_flag_0_z),
        .ZWrite_mem(EX_MEM_PR_0_ZWrite_out),
        .ZWrite_wb(MEM_WB_PR_0_ZWrite_out),
        .Z_final(CZ_Control_Unit_0_Z_final),
        .alu_out_mem(EX_MEM_PR_0_alu_out_out),
        .alu_out_wb(MEM_WB_PR_0_alu_out_out),
        .carry_out_mem(EX_MEM_PR_0_carry_out),
        .carry_out_wb(MEM_WB_PR_0_carry_out),
        .dm_data_mem(Data_memory_0_dm_data),
        .dm_data_wb(MEM_WB_PR_0_dm_data_out),
        .invalid1_mem(EX_MEM_PR_0_invalid1_out),
        .invalid1_wb(MEM_WB_PR_0_invalid1_out));
  IITB_RISC_Carry_and_Zero_flag_0_0 Carry_and_Zero_flag_0
       (.CWrite(MEM_WB_PR_0_CWrite_out),
        .ZWrite(MEM_WB_PR_0_ZWrite_out),
        .alu_in(MEM_WB_PR_0_alu_out_out),
        .c(Carry_and_Zero_flag_0_c1),
        .carry_in(MEM_WB_PR_0_carry_out),
        .clk(clk_0_1),
        .dm_data_in(MEM_WB_PR_0_dm_data_out),
        .rst(rst_0_1),
        .z(Carry_and_Zero_flag_0_z));
  IITB_RISC_Comparator_0_0 Comparator_0
       (.ET(Comparator_0_ET),
        .LT(Comparator_0_LT),
        .ra(Registers_0_ra),
        .rb(Registers_0_rb));
  IITB_RISC_Data_memory_0_0 Data_memory_0
       (.MemRead(EX_MEM_PR_0_MemRead_out),
        .MemWrite(EX_MEM_PR_0_MemWrite_out),
        .addr(EX_MEM_PR_0_alu_out_out),
        .clk(clk_0_1),
        .dm_data(Data_memory_0_dm_data),
        .rst(rst_0_1),
        .write_data(Write_Data_Select_0_write_data));
  IITB_RISC_Destination_reg_sele_0_0 Destination_reg_sele_0
       (.LM_reg(RR_EX_PR_0_SM_reg_out),
        .RA(RR_EX_PR_0_RA_final_out),
        .RB(RR_EX_PR_0_RB_final_out),
        .RC(RR_EX_PR_0_RC_out),
        .RD(Destination_reg_sele_0_RD),
        .RegDst(RR_EX_PR_0_RegDst_out));
  IITB_RISC_EX_MEM_PR_0_0 EX_MEM_PR_0
       (.CWrite_in(RR_EX_PR_0_CWrite_out),
        .CWrite_out(EX_MEM_PR_0_CWrite_out),
        .EX_FLUSH(Hazard_Detection_Unit_0_EX_FLUSH),
        .EX_MEM_Write(xlconstant_1_dout),
        .Imm2_in(RR_EX_PR_0_Imm2_out),
        .Imm2_out(EX_MEM_PR_0_Imm2_out),
        .L_in(RR_EX_PR_0_L_out),
        .L_out(EX_MEM_PR_0_L_out),
        .MemRead_in(RR_EX_PR_0_MemRead_out),
        .MemRead_out(EX_MEM_PR_0_MemRead_out),
        .MemWrite_in(RR_EX_PR_0_MemWrite_out),
        .MemWrite_out(EX_MEM_PR_0_MemWrite_out),
        .MemtoReg_in(RR_EX_PR_0_MemtoReg_out),
        .MemtoReg_out(EX_MEM_PR_0_MemtoReg_out),
        .PC_in(RR_EX_PR_0_PC_out),
        .PC_out(EX_MEM_PR_0_PC_out),
        .PC_plus_2_in(RR_EX_PR_0_PC_plus_2_out),
        .PC_plus_2_out(EX_MEM_PR_0_PC_plus_2_out),
        .RD_in(Destination_reg_sele_0_RD),
        .RD_out(EX_MEM_PR_0_RD_out),
        .RegWrite_in(Reg_Write_Control_0_RegWrite),
        .RegWrite_out(EX_MEM_PR_0_RegWrite_out),
        .S_in(RR_EX_PR_0_S_out),
        .S_out(EX_MEM_PR_0_S_out),
        .ZWrite_in(RR_EX_PR_0_ZWrite_out),
        .ZWrite_out(EX_MEM_PR_0_ZWrite_out),
        .alu_out_in(ALU_0_alu_out),
        .alu_out_out(EX_MEM_PR_0_alu_out_out),
        .carry_in(ALU_0_carry_out),
        .carry_out(EX_MEM_PR_0_carry_out),
        .clk(clk_0_1),
        .invalid1_in(RR_EX_PR_0_invalid1_out),
        .invalid1_out(EX_MEM_PR_0_invalid1_out),
        .op_in(RR_EX_PR_0_op_out),
        .op_out(EX_MEM_PR_0_op_out),
        .ra_in(ALU_inputs_0_ra_final),
        .ra_out(EX_MEM_PR_0_ra_out),
        .rb_in(ALU_inputs_0_rb_final),
        .rb_out(EX_MEM_PR_0_rb_out),
        .rst(rst_0_1));
  IITB_RISC_Forwarding_unit_0_0 Forwarding_unit_0
       (.MemtoReg_mem(EX_MEM_PR_0_MemtoReg_out),
        .RA(RR_EX_PR_0_RA_final_out),
        .RB(RR_EX_PR_0_RB_final_out),
        .RD_mem(EX_MEM_PR_0_RD_out),
        .RD_wb(MEM_WB_PR_0_RD_out1),
        .RegWrite_mem(EX_MEM_PR_0_RegWrite_out),
        .RegWrite_wb(MEM_WB_PR_0_RegWrite_out),
        .forwardA(Forwarding_unit_0_forwardA),
        .forwardB(Forwarding_unit_0_forwardB),
        .invalid1_mem(EX_MEM_PR_0_invalid1_out),
        .invalid1_wb(MEM_WB_PR_0_invalid1_out));
  IITB_RISC_Hazard_Detection_Unit_0_0 Hazard_Detection_Unit_0
       (.EX_FLUSH(Hazard_Detection_Unit_0_EX_FLUSH),
        .ID_FLUSH(Hazard_Detection_Unit_0_ID_FLUSH),
        .ID_Write(Hazard_Detection_Unit_0_ID_Write),
        .IF_FLUSH(Hazard_Detection_Unit_0_IF_FLUSH),
        .IF_Write(Hazard_Detection_Unit_0_IF_Write),
        .L(RR_Control_0_L),
        .L_ex(RR_EX_PR_0_L_out),
        .L_mem(EX_MEM_PR_0_L_out),
        .L_wb(MEM_WB_PR_0_L_out),
        .MEM_FLUSH(Hazard_Detection_Unit_0_MEM_FLUSH),
        .MemRead_ex(RR_EX_PR_0_MemRead_out),
        .PC_Write(Hazard_Detection_Unit_0_PC_Write),
        .RA_RR(ID_RR_PR_0_RA_out),
        .RB_RR(RB_select_0_RB_final),
        .RD_ex(Destination_reg_sele_0_RD),
        .RD_mem(EX_MEM_PR_0_RD_out),
        .RD_wb(MEM_WB_PR_0_RD_out1),
        .RR_FLUSH(Hazard_Detection_Unit_0_RR_FLUSH),
        .RegWrite_mem(EX_MEM_PR_0_RegWrite_out),
        .RegWrite_wb(MEM_WB_PR_0_RegWrite_out),
        .S(RR_Control_0_S),
        .branch_rr(RR_Control_0_branch[0]),
        .op_ex(RR_EX_PR_0_op_out),
        .op_rr(ID_RR_PR_0_op_out),
        .special_2(Special_2_Control_0_special_2),
        .special_wb(Special_Control_0_special_wb),
        .stall(Hazard_Detection_Unit_0_stall),
        .x(LM_and_SM_unit_0_x));
  IITB_RISC_ID_RR_PR_0_0 ID_RR_PR_0
       (.ID_FLUSH(Hazard_Detection_Unit_0_ID_FLUSH),
        .ID_RR_write(Hazard_Detection_Unit_0_ID_Write),
        .Imm2_in(Instruction_Decoder_0_Imm2),
        .Imm2_out(ID_RR_PR_0_Imm2_out),
        .PC_in(IF_ID_PR_0_PC_out),
        .PC_out(ID_RR_PR_0_PC_out),
        .PC_plus_2_in(IF_ID_PR_0_PC_plus_2_out),
        .PC_plus_2_out(ID_RR_PR_0_PC_plus_2_out),
        .RA_in(Instruction_Decoder_0_RA),
        .RA_out(ID_RR_PR_0_RA_out),
        .RB_in(Instruction_Decoder_0_RB),
        .RB_out(ID_RR_PR_0_RB_out),
        .RC_in(Instruction_Decoder_0_RC),
        .RC_out(ID_RR_PR_0_RC_out1),
        .SE_Imm1_in(Sign_Extension_0_SE_Imm1),
        .SE_Imm1_out(ID_RR_PR_0_SE_Imm1_out),
        .SE_Imm2_in(Sign_Extension_0_SE_Imm2),
        .SE_Imm2_out(ID_RR_PR_0_SE_Imm2_out),
        .clk(clk_0_1),
        .comp_in(Instruction_Decoder_0_comp),
        .comp_out(ID_RR_PR_0_comp_out),
        .cz_in(Instruction_Decoder_0_cz),
        .cz_out(ID_RR_PR_0_cz_out),
        .invalid1_in(IF_ID_PR_0_invalid1),
        .invalid1_out(ID_RR_PR_0_invalid1_out),
        .op_in(Instruction_Decoder_0_op),
        .op_out(ID_RR_PR_0_op_out),
        .rst(rst_0_1));
  IITB_RISC_IF_ID_PR_0_1 IF_ID_PR_0
       (.IF_FLUSH(Hazard_Detection_Unit_0_IF_FLUSH),
        .IF_ID_write(Hazard_Detection_Unit_0_IF_Write),
        .PC_in(PC_0_PC),
        .PC_out(IF_ID_PR_0_PC_out),
        .PC_plus_2_in(PC_0_PC_plus_2),
        .PC_plus_2_out(IF_ID_PR_0_PC_plus_2_out),
        .clk(clk_0_1),
        .instr_in(Instruction_Memory_0_instr),
        .instr_out(IF_ID_PR_0_instr_out),
        .invalid1(IF_ID_PR_0_invalid1),
        .rst(rst_0_1));
  IITB_RISC_Instruction_Decoder_0_0 Instruction_Decoder_0
       (.ID_FLUSH(Hazard_Detection_Unit_0_ID_FLUSH),
        .Imm1(Instruction_Decoder_0_Imm1),
        .Imm2(Instruction_Decoder_0_Imm2),
        .RA(Instruction_Decoder_0_RA),
        .RB(Instruction_Decoder_0_RB),
        .RC(Instruction_Decoder_0_RC),
        .comp(Instruction_Decoder_0_comp),
        .cz(Instruction_Decoder_0_cz),
        .instr_in(IF_ID_PR_0_instr_out),
        .op(Instruction_Decoder_0_op));
  IITB_RISC_Instruction_Memory_0_0 Instruction_Memory_0
       (.PC(PC_0_PC),
        .instr(Instruction_Memory_0_instr),
        .rst(rst_0_1));
  IITB_RISC_LM_and_SM_unit_0_0 LM_and_SM_unit_0
       (.Imm2(ID_RR_PR_0_Imm2_out),
        .L(RR_Control_0_L),
        .L_ex(RR_EX_PR_0_L_out),
        .S(RR_Control_0_S),
        .S_ex(RR_EX_PR_0_S_out),
        .i(LM_and_SM_unit_0_i),
        .i_ex(RR_EX_PR_0_i_out),
        .x(LM_and_SM_unit_0_x));
  IITB_RISC_MEM_WB_PR_0_0 MEM_WB_PR_0
       (.CWrite_in(EX_MEM_PR_0_CWrite_out),
        .CWrite_out(MEM_WB_PR_0_CWrite_out),
        .Imm2_in(EX_MEM_PR_0_Imm2_out),
        .Imm2_out(MEM_WB_PR_0_Imm2_out),
        .L_in(EX_MEM_PR_0_L_out),
        .L_out(MEM_WB_PR_0_L_out),
        .MEM_FLUSH(Hazard_Detection_Unit_0_MEM_FLUSH),
        .MEM_WB_Write(xlconstant_2_dout),
        .MemtoReg_in(EX_MEM_PR_0_MemtoReg_out),
        .MemtoReg_out(MEM_WB_PR_0_MemtoReg_out),
        .PC_in(EX_MEM_PR_0_PC_out),
        .PC_out(MEM_WB_PR_0_PC_out),
        .PC_plus_2_in(EX_MEM_PR_0_PC_plus_2_out),
        .PC_plus_2_out(MEM_WB_PR_0_PC_plus_2_out),
        .RD_in(EX_MEM_PR_0_RD_out),
        .RD_out(MEM_WB_PR_0_RD_out1),
        .RegWrite_in(EX_MEM_PR_0_RegWrite_out),
        .RegWrite_out(MEM_WB_PR_0_RegWrite_out),
        .S_in(EX_MEM_PR_0_S_out),
        .S_out(MEM_WB_PR_0_S_out),
        .ZWrite_in(EX_MEM_PR_0_ZWrite_out),
        .ZWrite_out(MEM_WB_PR_0_ZWrite_out),
        .alu_out_in(EX_MEM_PR_0_alu_out_out),
        .alu_out_out(MEM_WB_PR_0_alu_out_out),
        .carry_in(EX_MEM_PR_0_carry_out),
        .carry_out(MEM_WB_PR_0_carry_out),
        .clk(clk_0_1),
        .dm_data_in(Data_memory_0_dm_data),
        .dm_data_out(MEM_WB_PR_0_dm_data_out),
        .invalid1_in(EX_MEM_PR_0_invalid1_out),
        .invalid1_out(MEM_WB_PR_0_invalid1_out),
        .mem_addr_in(EX_MEM_PR_0_alu_out_out),
        .mem_addr_out(MEM_WB_PR_0_mem_addr_out),
        .mem_data_in(Write_Data_Select_0_write_data),
        .mem_data_out(MEM_WB_PR_0_mem_data_out),
        .rst(rst_0_1));
  IITB_RISC_PC_0_0 PC_0
       (.PC(PC_0_PC),
        .PC_Write(Hazard_Detection_Unit_0_PC_Write),
        .PC_in(PC_0_PC),
        .PC_plus_2(PC_0_PC_plus_2),
        .branch_pc(Branch_PC_0_branch_pc),
        .branch_rr(RR_Control_0_branch[0]),
        .clk(clk_0_1),
        .rst(rst_0_1),
        .special_wb(Special_Control_0_special_wb),
        .write_data_rr(Registers_0_write_data_rr));
  IITB_RISC_RB_select_0_1 RB_select_0
       (.RB(ID_RR_PR_0_RB_out),
        .RB_final(RB_select_0_RB_final),
        .SM_reg(RB_select_0_SM_reg),
        .i(LM_and_SM_unit_0_i),
        .op(ID_RR_PR_0_op_out));
  IITB_RISC_RR_Control_0_0 RR_Control_0
       (.ALUOp(RR_Control_0_ALUOp),
        .ALUSrc1(RR_Control_0_ALUSrc1),
        .ALUSrc2(RR_Control_0_ALUSrc2),
        .CWrite(RR_Control_0_CWrite),
        .ET(Comparator_0_ET),
        .L(RR_Control_0_L),
        .LT(Comparator_0_LT),
        .MemRead(RR_Control_0_MemRead),
        .MemWrite(RR_Control_0_MemWrite),
        .MemtoReg(RR_Control_0_MemtoReg),
        .RegDst(RR_Control_0_RegDst),
        .S(RR_Control_0_S),
        .S1(RR_Control_0_S1),
        .S2(RR_Control_0_S2),
        .S3(RR_Control_0_S3),
        .ZWrite(RR_Control_0_ZWrite),
        .branch(RR_Control_0_branch),
        .invalid1(ID_RR_PR_0_invalid1_out),
        .op(ID_RR_PR_0_op_out),
        .stall(Hazard_Detection_Unit_0_stall));
  IITB_RISC_RR_EX_PR_0_0 RR_EX_PR_0
       (.ALUOp_in(RR_Control_0_ALUOp),
        .ALUOp_out(RR_EX_PR_0_ALUOp_out),
        .ALUSrc1_in(RR_Control_0_ALUSrc1),
        .ALUSrc1_out(RR_EX_PR_0_ALUSrc1_out),
        .ALUSrc2_in(RR_Control_0_ALUSrc2),
        .ALUSrc2_out(RR_EX_PR_0_ALUSrc2_out),
        .CWrite_in(RR_Control_0_CWrite),
        .CWrite_out(RR_EX_PR_0_CWrite_out),
        .Imm2_in(ID_RR_PR_0_Imm2_out),
        .Imm2_out(RR_EX_PR_0_Imm2_out),
        .L_in(RR_Control_0_L),
        .L_out(RR_EX_PR_0_L_out),
        .MemRead_in(RR_Control_0_MemRead),
        .MemRead_out(RR_EX_PR_0_MemRead_out),
        .MemWrite_in(RR_Control_0_MemWrite),
        .MemWrite_out(RR_EX_PR_0_MemWrite_out),
        .MemtoReg_in(RR_Control_0_MemtoReg),
        .MemtoReg_out(RR_EX_PR_0_MemtoReg_out),
        .PC_in(ID_RR_PR_0_PC_out),
        .PC_out(RR_EX_PR_0_PC_out),
        .PC_plus_2_in(ID_RR_PR_0_PC_plus_2_out),
        .PC_plus_2_out(RR_EX_PR_0_PC_plus_2_out),
        .RA_final_in(ID_RR_PR_0_RA_out),
        .RA_final_out(RR_EX_PR_0_RA_final_out),
        .RB_final_in(RB_select_0_RB_final),
        .RB_final_out(RR_EX_PR_0_RB_final_out),
        .RC_in(ID_RR_PR_0_RC_out1),
        .RC_out(RR_EX_PR_0_RC_out),
        .RR_EX_Write(xlconstant_0_dout),
        .RR_FLUSH(Hazard_Detection_Unit_0_RR_FLUSH),
        .RegDst_in(RR_Control_0_RegDst),
        .RegDst_out(RR_EX_PR_0_RegDst_out),
        .SE_Imm1_in(ID_RR_PR_0_SE_Imm1_out),
        .SE_Imm1_out(RR_EX_PR_0_SE_Imm1_out),
        .SM_reg_in(RB_select_0_SM_reg),
        .SM_reg_out(RR_EX_PR_0_SM_reg_out),
        .S_in(RR_Control_0_S),
        .S_out(RR_EX_PR_0_S_out),
        .ZWrite_in(RR_Control_0_ZWrite),
        .ZWrite_out(RR_EX_PR_0_ZWrite_out),
        .clk(clk_0_1),
        .comp_in(ID_RR_PR_0_comp_out),
        .comp_out(RR_EX_PR_0_comp_out),
        .cz_in(ID_RR_PR_0_cz_out),
        .cz_out(RR_EX_PR_0_cz_out),
        .i_in(LM_and_SM_unit_0_i),
        .i_out(RR_EX_PR_0_i_out),
        .invalid1_in(ID_RR_PR_0_invalid1_out),
        .invalid1_out(RR_EX_PR_0_invalid1_out),
        .op_in(ID_RR_PR_0_op_out),
        .op_out(RR_EX_PR_0_op_out),
        .ra_in(Registers_0_ra),
        .ra_out(RR_EX_PR_0_ra_out),
        .rb_in(Registers_0_rb),
        .rb_out(RR_EX_PR_0_rb_out),
        .rst(rst_0_1),
        .stall_in(Hazard_Detection_Unit_0_stall),
        .stall_out(RR_EX_PR_0_stall_out),
        .x_in(LM_and_SM_unit_0_x),
        .x_out(RR_EX_PR_0_x_out));
  IITB_RISC_RR_Forwarding_Unit_0_0 RR_Forwarding_Unit_0
       (.RA_in(ID_RR_PR_0_RA_out),
        .RB_in(RB_select_0_RB_final),
        .RD(MEM_WB_PR_0_RD_out1),
        .RegWrite(MEM_WB_PR_0_RegWrite_out),
        .invalid1_wb(MEM_WB_PR_0_invalid1_out),
        .ra(Registers_0_ra1),
        .ra_final(Registers_0_ra),
        .rb(Registers_0_rb1),
        .rb_final(Registers_0_rb),
        .write_data(WB_mux_0_write_data1));
  IITB_RISC_Reg_Write_Control_0_0 Reg_Write_Control_0
       (.RegWrite(Reg_Write_Control_0_RegWrite),
        .c(Carry_and_Zero_flag_0_c),
        .cz(RR_EX_PR_0_cz_out),
        .invalid1(RR_EX_PR_0_invalid1_out),
        .op(RR_EX_PR_0_op_out),
        .stall(RR_EX_PR_0_stall_out),
        .z(CZ_Control_Unit_0_Z_final));
  IITB_RISC_Registers_0_5 Registers_0
       (.PC_in(ID_RR_PR_0_PC_out),
        .R0(Registers_0_R0),
        .R1(Registers_0_R1),
        .R2(Registers_0_R2),
        .R3(Registers_0_R3),
        .R4(Registers_0_R4),
        .R5(Registers_0_R5),
        .R6(Registers_0_R6),
        .R7(Registers_0_R7),
        .RA_in(ID_RR_PR_0_RA_out),
        .RB_in(RB_select_0_RB_final),
        .RD(MEM_WB_PR_0_RD_out1),
        .RegWrite(MEM_WB_PR_0_RegWrite_out),
        .clk(clk_0_1),
        .ra(Registers_0_ra1),
        .rb(Registers_0_rb1),
        .rst(rst_0_1),
        .write_data(WB_mux_0_write_data1),
        .write_data_rr(Registers_0_write_data_rr),
        .write_data_wb(WB_mux_0_write_data1));
  IITB_RISC_Sign_Extension_0_0 Sign_Extension_0
       (.Imm1(Instruction_Decoder_0_Imm1),
        .Imm2(Instruction_Decoder_0_Imm2),
        .SE_Imm1(Sign_Extension_0_SE_Imm1),
        .SE_Imm2(Sign_Extension_0_SE_Imm2));
  IITB_RISC_Special_2_Control_0_0 Special_2_Control_0
       (.L_wb(MEM_WB_PR_0_L_out),
        .RD_wb(MEM_WB_PR_0_RD_out1),
        .RegWrite_wb(MEM_WB_PR_0_RegWrite_out),
        .clk(clk_0_1),
        .rst(rst_0_1),
        .special_2(Special_2_Control_0_special_2),
        .x_ex(RR_EX_PR_0_x_out));
  IITB_RISC_Special_Control_0_0 Special_Control_0
       (.L(MEM_WB_PR_0_L_out),
        .RD(MEM_WB_PR_0_RD_out1),
        .RegWrite(MEM_WB_PR_0_RegWrite_out),
        .S(MEM_WB_PR_0_S_out),
        .special_wb(Special_Control_0_special_wb));
  IITB_RISC_WB_mux_0_0 WB_mux_0
       (.Imm2(MEM_WB_PR_0_Imm2_out),
        .MemtoReg(MEM_WB_PR_0_MemtoReg_out),
        .PC_plus_2(MEM_WB_PR_0_PC_plus_2_out),
        .alu_out(MEM_WB_PR_0_alu_out_out),
        .dm_data(MEM_WB_PR_0_dm_data_out),
        .write_data(WB_mux_0_write_data1));
  IITB_RISC_Write_Data_Select_0_0 Write_Data_Select_0
       (.S(EX_MEM_PR_0_S_out),
        .ra(EX_MEM_PR_0_ra_out),
        .rb(EX_MEM_PR_0_rb_out),
        .write_data(Write_Data_Select_0_write_data));
  IITB_RISC_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
  IITB_RISC_xlconstant_0_1 xlconstant_1
       (.dout(xlconstant_1_dout));
  IITB_RISC_xlconstant_0_2 xlconstant_2
       (.dout(xlconstant_2_dout));
endmodule
