//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This file contains macros used with the execute_in package.
//   These macros include packed struct definitions.  These structs are
//   used to pass data between classes, hvl, and BFM's, hdl.  Use of 
//   structs are more efficient and simpler to modify.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_struct
//      and from_struct methods defined in the macros below that are used in  
//      the execute_in_configuration class.
//
  `define execute_in_CONFIGURATION_STRUCT \
typedef struct packed  { \
     uvmf_active_passive_t active_passive; \
     uvmf_initiator_responder_t initiator_responder; \
     } execute_in_configuration_s;

  `define execute_in_CONFIGURATION_TO_STRUCT_FUNCTION \
  virtual function execute_in_configuration_s to_struct();\
    execute_in_configuration_struct = \
       {\
       this.active_passive,\
       this.initiator_responder\
       };\
    return ( execute_in_configuration_struct );\
  endfunction

  `define execute_in_CONFIGURATION_FROM_STRUCT_FUNCTION \
  virtual function void from_struct(execute_in_configuration_s execute_in_configuration_struct);\
      {\
      this.active_passive,\
      this.initiator_responder  \
      } = execute_in_configuration_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_monitor_struct
//      and from_monitor_struct methods of the execute_in_transaction class.
//
  `define execute_in_MONITOR_STRUCT typedef struct packed  { \
  block_t _source ; \
  logic _enable_execute ; \
  logic _bypass_alu_1 ; \
  logic _bypass_alu_2 ; \
  logic _bypass_mem_1 ; \
  logic _bypass_mem_2 ; \
  logic [5:0] _E_control ; \
  logic [15:0] _IR ; \
  logic [15:0] _npc_in ; \
  logic [1:0] _W_Control_in ; \
  logic _Mem_Control_in ; \
  logic [15:0] _VSR1 ; \
  logic [15:0] _VSR2 ; \
  logic [15:0] _Mem_Bypass_Val ; \
     } execute_in_monitor_s;

  `define execute_in_TO_MONITOR_STRUCT_FUNCTION \
  virtual function execute_in_monitor_s to_monitor_struct();\
    execute_in_monitor_struct = \
            { \
            this._source , \
            this._enable_execute , \
            this._bypass_alu_1 , \
            this._bypass_alu_2 , \
            this._bypass_mem_1 , \
            this._bypass_mem_2 , \
            this._E_control , \
            this._IR , \
            this._npc_in , \
            this._W_Control_in , \
            this._Mem_Control_in , \
            this._VSR1 , \
            this._VSR2 , \
            this._Mem_Bypass_Val  \
            };\
    return ( execute_in_monitor_struct);\
  endfunction\

  `define execute_in_FROM_MONITOR_STRUCT_FUNCTION \
  virtual function void from_monitor_struct(execute_in_monitor_s execute_in_monitor_struct);\
            {\
            this._source , \
            this._enable_execute , \
            this._bypass_alu_1 , \
            this._bypass_alu_2 , \
            this._bypass_mem_1 , \
            this._bypass_mem_2 , \
            this._E_control , \
            this._IR , \
            this._npc_in , \
            this._W_Control_in , \
            this._Mem_Control_in , \
            this._VSR1 , \
            this._VSR2 , \
            this._Mem_Bypass_Val  \
            } = execute_in_monitor_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_initiator_struct
//      and from_initiator_struct methods of the execute_in_transaction class.
//      Also update the comments in the driver BFM.
//
  `define execute_in_INITIATOR_STRUCT typedef struct packed  { \
  block_t _source ; \
  logic _enable_execute ; \
  logic _bypass_alu_1 ; \
  logic _bypass_alu_2 ; \
  logic _bypass_mem_1 ; \
  logic _bypass_mem_2 ; \
  logic [5:0] _E_control ; \
  logic [15:0] _IR ; \
  logic [15:0] _npc_in ; \
  logic [1:0] _W_Control_in ; \
  logic _Mem_Control_in ; \
  logic [15:0] _VSR1 ; \
  logic [15:0] _VSR2 ; \
  logic [15:0] _Mem_Bypass_Val ; \
     } execute_in_initiator_s;

  `define execute_in_TO_INITIATOR_STRUCT_FUNCTION \
  virtual function execute_in_initiator_s to_initiator_struct();\
    execute_in_initiator_struct = \
           {\
           this._source , \
           this._enable_execute , \
           this._bypass_alu_1 , \
           this._bypass_alu_2 , \
           this._bypass_mem_1 , \
           this._bypass_mem_2 , \
           this._E_control , \
           this._IR , \
           this._npc_in , \
           this._W_Control_in , \
           this._Mem_Control_in , \
           this._VSR1 , \
           this._VSR2 , \
           this._Mem_Bypass_Val  \
           };\
    return ( execute_in_initiator_struct);\
  endfunction

  `define execute_in_FROM_INITIATOR_STRUCT_FUNCTION \
  virtual function void from_initiator_struct(execute_in_initiator_s execute_in_initiator_struct);\
           {\
           this._source , \
           this._enable_execute , \
           this._bypass_alu_1 , \
           this._bypass_alu_2 , \
           this._bypass_mem_1 , \
           this._bypass_mem_2 , \
           this._E_control , \
           this._IR , \
           this._npc_in , \
           this._W_Control_in , \
           this._Mem_Control_in , \
           this._VSR1 , \
           this._VSR2 , \
           this._Mem_Bypass_Val  \
           } = execute_in_initiator_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_responder_struct
//      and from_responder_struct methods of the execute_in_transaction class.
//      Also update the comments in the driver BFM.
//
  `define execute_in_RESPONDER_STRUCT typedef struct packed  { \
  block_t _source ; \
  logic _enable_execute ; \
  logic _bypass_alu_1 ; \
  logic _bypass_alu_2 ; \
  logic _bypass_mem_1 ; \
  logic _bypass_mem_2 ; \
  logic [5:0] _E_control ; \
  logic [15:0] _IR ; \
  logic [15:0] _npc_in ; \
  logic [1:0] _W_Control_in ; \
  logic _Mem_Control_in ; \
  logic [15:0] _VSR1 ; \
  logic [15:0] _VSR2 ; \
  logic [15:0] _Mem_Bypass_Val ; \
     } execute_in_responder_s;

  `define execute_in_TO_RESPONDER_STRUCT_FUNCTION \
  virtual function execute_in_responder_s to_responder_struct();\
    execute_in_responder_struct = \
           {\
           this._source , \
           this._enable_execute , \
           this._bypass_alu_1 , \
           this._bypass_alu_2 , \
           this._bypass_mem_1 , \
           this._bypass_mem_2 , \
           this._E_control , \
           this._IR , \
           this._npc_in , \
           this._W_Control_in , \
           this._Mem_Control_in , \
           this._VSR1 , \
           this._VSR2 , \
           this._Mem_Bypass_Val  \
           };\
    return ( execute_in_responder_struct);\
  endfunction

  `define execute_in_FROM_RESPONDER_STRUCT_FUNCTION \
  virtual function void from_responder_struct(execute_in_responder_s execute_in_responder_struct);\
           {\
           this._source , \
           this._enable_execute , \
           this._bypass_alu_1 , \
           this._bypass_alu_2 , \
           this._bypass_mem_1 , \
           this._bypass_mem_2 , \
           this._E_control , \
           this._IR , \
           this._npc_in , \
           this._W_Control_in , \
           this._Mem_Control_in , \
           this._VSR1 , \
           this._VSR2 , \
           this._Mem_Bypass_Val  \
           } = execute_in_responder_struct;\
  endfunction
// pragma uvmf custom additional begin
// pragma uvmf custom additional end
