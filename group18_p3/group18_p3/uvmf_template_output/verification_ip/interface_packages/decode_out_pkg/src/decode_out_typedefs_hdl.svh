//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
// This file contains defines and typedefs to be compiled for use in
// the simulation running on the emulator when using Veloce.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
                                                                               

typedef enum bit [3:0] {ADD=4'b0001, AND=4'b0101, NOT=4'b1001, LD=4'b0010, LDR=4'b0110, LDI=4'b1010, LEA=4'b1110, ST=4'b0011, STR=4'b0111, STI=4'b1011, BR=4'b0000, JMP=4'b1100} op_t;
typedef bit [2:0] dest_reg_t;
typedef bit [2:0] sr1_t;
typedef bit [4:0] sr2_or_imm5_t;
typedef bit inst_type_t;
typedef bit [15:0] inst_out_t;

// pragma uvmf custom additional begin
// pragma uvmf custom additional end

