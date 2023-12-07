//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface contains the memaccess_in interface signals.
//      It is instantiated once per memaccess_in bus.  Bus Functional Models, 
//      BFM's named memaccess_in_driver_bfm, are used to drive signals on the bus.
//      BFM's named memaccess_in_monitor_bfm are used to monitor signals on the 
//      bus. This interface signal bundle is passed in the port list of
//      the BFM in order to give the BFM access to the signals in this
//      interface.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// This template can be used to connect a DUT to these signals
//
// .dut_signal_port(memaccess_in_bus.mem_state), // Agent output 
// .dut_signal_port(memaccess_in_bus.m_control), // Agent output 
// .dut_signal_port(memaccess_in_bus.m_data), // Agent output 
// .dut_signal_port(memaccess_in_bus.m_addr), // Agent output 
// .dut_signal_port(memaccess_in_bus.data_dout), // Agent output 

import uvmf_base_pkg_hdl::*;
import memaccess_in_pkg_hdl::*;

interface  memaccess_in_if 

  (
  input tri clock, 
  input tri reset,
  inout tri [1:0] mem_state,
  inout tri  m_control,
  inout tri [15:0] m_data,
  inout tri [15:0] m_addr,
  inout tri [15:0] data_dout
  );

modport monitor_port 
  (
  input clock,
  input reset,
  input mem_state,
  input m_control,
  input m_data,
  input m_addr,
  input data_dout
  );

modport initiator_port 
  (
  input clock,
  input reset,
  output mem_state,
  output m_control,
  output m_data,
  output m_addr,
  output data_dout
  );

modport responder_port 
  (
  input clock,
  input reset,  
  input mem_state,
  input m_control,
  input m_data,
  input m_addr,
  input data_dout
  );
  

// pragma uvmf custom interface_item_additional begin
// pragma uvmf custom interface_item_additional end

endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

