//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface contains the memaccess_out interface signals.
//      It is instantiated once per memaccess_out bus.  Bus Functional Models, 
//      BFM's named memaccess_out_driver_bfm, are used to drive signals on the bus.
//      BFM's named memaccess_out_monitor_bfm are used to monitor signals on the 
//      bus. This interface signal bundle is passed in the port list of
//      the BFM in order to give the BFM access to the signals in this
//      interface.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// This template can be used to connect a DUT to these signals
//
// .dut_signal_port(memaccess_out_bus.data_addr), // Agent input 
// .dut_signal_port(memaccess_out_bus.data_din), // Agent input 
// .dut_signal_port(memaccess_out_bus.data_rd), // Agent input 
// .dut_signal_port(memaccess_out_bus.memout), // Agent input 

import uvmf_base_pkg_hdl::*;
import memaccess_out_pkg_hdl::*;

interface  memaccess_out_if 

  (
  input tri clock, 
  input tri reset,
  inout tri [15:0] data_addr,
  inout tri [15:0] data_din,
  inout tri  data_rd,
  inout tri [15:0] memout
  );

modport monitor_port 
  (
  input clock,
  input reset,
  input data_addr,
  input data_din,
  input data_rd,
  input memout
  );

modport initiator_port 
  (
  input clock,
  input reset,
  input data_addr,
  input data_din,
  input data_rd,
  input memout
  );

modport responder_port 
  (
  input clock,
  input reset,  
  output data_addr,
  output data_din,
  output data_rd,
  output memout
  );
  

// pragma uvmf custom interface_item_additional begin
// pragma uvmf custom interface_item_additional end

endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

