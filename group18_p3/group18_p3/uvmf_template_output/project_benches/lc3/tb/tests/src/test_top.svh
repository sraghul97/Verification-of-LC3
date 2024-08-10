//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
// Description: This top level UVM test is the base class for all
//     future tests created for this project.
//
//     This test class contains:
//          Configuration:  The top level configuration for the project.
//          Environment:    The top level environment for the project.
//          Top_level_sequence:  The top level sequence for the project.
//                                        
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

typedef lc3_env_configuration lc3_env_configuration_t;
typedef lc3_environment lc3_environment_t;

class test_top extends uvmf_test_base #(.CONFIG_T(lc3_env_configuration_t), 
                                        .ENV_T(lc3_environment_t), 
                                        .TOP_LEVEL_SEQ_T(lc3_bench_sequence_base));

  `uvm_component_utils( test_top );


  string interface_names[] = {
    fetch_agent_fetch_in_BFM /* fetch_agent_fetch_in     [0] */ , 
    fetch_agent_fetch_out_BFM /* fetch_agent_fetch_out     [1] */ , 
    decode_decode_in_agent_handle_BFM /* decode_decode_in_agent_handle     [2] */ , 
    decode_decode_out_agent_handle_BFM /* decode_decode_out_agent_handle     [3] */ , 
    control_control_in_agent_handle_BFM /* control_control_in_agent_handle     [4] */ , 
    control_control_out_agent_handle_BFM /* control_control_out_agent_handle     [5] */ , 
    execute_execute_in_agent_BFM /* execute_execute_in_agent     [6] */ , 
    execute_execute_out_agent_BFM /* execute_execute_out_agent     [7] */ , 
    memaccess_memaccess_in_agent_handle_BFM /* memaccess_memaccess_in_agent_handle     [8] */ , 
    memaccess_memaccess_out_agent_handle_BFM /* memaccess_memaccess_out_agent_handle     [9] */ , 
    writeback_agent_in_BFM /* writeback_agent_in     [10] */ , 
    writeback_agent_out_BFM /* writeback_agent_out     [11] */ , 
    inst_mem_BFM /* inst_mem     [12] */ , 
    data_mem_BFM /* data_mem     [13] */ 
};

uvmf_active_passive_t interface_activities[] = { 
    PASSIVE /* fetch_agent_fetch_in     [0] */ , 
    PASSIVE /* fetch_agent_fetch_out     [1] */ , 
    PASSIVE /* decode_decode_in_agent_handle     [2] */ , 
    PASSIVE /* decode_decode_out_agent_handle     [3] */ , 
    PASSIVE /* control_control_in_agent_handle     [4] */ , 
    PASSIVE /* control_control_out_agent_handle     [5] */ , 
    PASSIVE /* execute_execute_in_agent     [6] */ , 
    PASSIVE /* execute_execute_out_agent     [7] */ , 
    PASSIVE /* memaccess_memaccess_in_agent_handle     [8] */ , 
    PASSIVE /* memaccess_memaccess_out_agent_handle     [9] */ , 
    PASSIVE /* writeback_agent_in     [10] */ , 
    PASSIVE /* writeback_agent_out     [11] */ , 
    ACTIVE /* inst_mem     [12] */ , 
    ACTIVE /* data_mem     [13] */   };


  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  // ****************************************************************************
  // FUNCTION: new()
  // This is the standard systemVerilog constructor.  All components are 
  // constructed in the build_phase to allow factory overriding.
  //
  function new( string name = "", uvm_component parent = null );
     super.new( name ,parent );
  endfunction



  // ****************************************************************************
  // FUNCTION: build_phase()
  // The construction of the configuration and environment classes is done in
  // the build_phase of uvmf_test_base.  Once the configuraton and environment
  // classes are built then the initialize call is made to perform the
  // following: 
  //     Monitor and driver BFM virtual interface handle passing into agents
  //     Set the active/passive state for each agent
  // Once this build_phase completes, the build_phase of the environment is
  // executed which builds the agents.
  //
  virtual function void build_phase(uvm_phase phase);
// pragma uvmf custom build_phase_pre_super begin
// pragma uvmf custom build_phase_pre_super end
    super.build_phase(phase);
    // pragma uvmf custom configuration_settings_post_randomize begin
    // pragma uvmf custom configuration_settings_post_randomize end
    configuration.initialize(NA, "uvm_test_top.environment", interface_names, null, interface_activities);
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

