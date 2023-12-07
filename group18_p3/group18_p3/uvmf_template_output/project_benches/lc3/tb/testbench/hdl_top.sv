module hdl_top();

  import uvm_pkg::*;
  import lc3_parameters_pkg::*;
  import uvmf_base_pkg_hdl::*;
  import uvmf_base_pkg::*;
  `include "uvm_macros.svh"

    reg reset_one,enable_fetch_one, enable_decode_one ,enable_execute_one ,enable_writeback_one, reset_one_ctrl, reset_two_ctrl; 
  
  bit clk;
  bit rst;


// ****************************************************************************
// Clock generator
  initial begin : clk_gen
    clk = 0;
    forever
      #5 clk = ~clk;
  end

// ****************************************************************************
// Reset generator
  initial begin : rst_gen
    rst = 1'b1;
    #113 rst = 1'b0;
  end

//Interface connection
  //fetch
  fetch_in_if  fetch_agent_fetch_in_bus(
      .clock(clk),
      .reset(rst), 
      .enable_updatePC(DUT.enable_updatePC),
      .enable_fetch(DUT.enable_fetch),
      .taddr(DUT.taddr),
      .br_taken(DUT.br_taken)
      );
  fetch_out_if  fetch_agent_fetch_out_bus(
      .clock(clk), 
      .reset(rst), 
      .npc(DUT.npc_out_fetch), 
      .pc(DUT.pc), 
      .instrmem_rd(DUT.instrmem_rd)
    );

  //decode
  decode_in_if  decode_decode_in_agent_handle_bus(
      .clock(clk), 
      .reset(rst), 
      .enable_decode(DUT.enable_decode), 
      .dout(DUT.Instr_dout), 
      .npc_in(DUT.npc_out_fetch)
     );
  decode_out_if  decode_decode_out_agent_handle_bus(
      .clock(clk), 
      .reset(rst),  
      .e_control(DUT.E_Control), 
      .mem_control(DUT.Mem_Control) , 
      .w_control(DUT.W_Control), 
      .ir(DUT.IR), 
      .npc_out(DUT.npc_out_dec)
    );

  //execute
  execute_in_if  execute_execute_in_agent_bus(
      .clock(clk), 
      .reset(rst), 
      .enable_execute(DUT.enable_execute), 
      .E_control(DUT.E_Control), 
      .bypass_alu_1(DUT.bypass_alu_1), 
      .bypass_alu_2(DUT.bypass_alu_2), 
      .bypass_mem_1(DUT.bypass_mem_1), 
      .bypass_mem_2(DUT.bypass_mem_2),
      .IR(DUT.IR), 
      .npc_in(DUT.npc_out_dec), 
      .Mem_Control_in(DUT.Mem_Control), 
      .W_Control_in(DUT.W_Control), 
      .VSR1(DUT.VSR1), 
      .VSR2(DUT.VSR2), 
      .Mem_Bypass_Val(DUT.memout)
     );
  execute_out_if  execute_execute_out_agent_bus(
     //.enable_execute_out(DUT.enable_execute), 
      .clock(clk), 
      .reset(rst), 
      .aluout(DUT.aluout), 
      .W_Control_out(DUT.W_Control_out), 
      .Mem_Control_out(DUT.Mem_Control_out), 
      .M_Data(DUT.M_Data),
      .dr(DUT.dr), 
      .sr1(DUT.sr1), 
      .sr2(DUT.sr2), 
      .pcout(DUT.pcout), 
      .IR_Exec(DUT.IR_Exec), 
      .NZP(DUT.NZP)
     );

  //memaccess   
  memaccess_in_if  memaccess_memaccess_in_agent_handle_bus(
      .clock(clk),
      .reset(rst), 
      .mem_state(DUT.mem_state), 
      .m_control(DUT.Mem_Control_out), // FIXME: RAGHUL 
      .m_data(DUT.M_Data), 
      .m_addr(DUT.pcout), 
      .data_dout(DUT.Data_dout)
     );
  memaccess_out_if  memaccess_memaccess_out_agent_handle_bus(
      .clock(clk), 
      .reset(rst), 
      .data_addr(DUT.Data_addr), 
      .data_din(DUT.Data_din), 
      .data_rd(DUT.Data_rd),
      .memout(DUT.memout) 
      );

  //writeback
  writeback_in_if  writeback_agent_in_bus(
      .clock(clk), 
      .reset(rst), 
      .enable_writeback(DUT.enable_writeback), 
      .npc(DUT.npc_out_dec), 
      .W_Control(DUT.W_Control_out), 
      .aluout(DUT.aluout),
      .pcout(DUT.pcout), 
      .memout(DUT.memout), 
      .sr1(DUT.sr1), 
      .sr2(DUT.sr2), 
      .dr(DUT.dr)
      );
 writeback_out_if  writeback_agent_out_bus(
      .clock(clk), 
      .reset(rst), 
      .vsr1(DUT.VSR1), 
      .vsr2(DUT.VSR2), 
      .psr(DUT.psr), 
      .enable_writeback_out(DUT.enable_writeback)
    );

  //control  
  control_in_if  control_control_in_agent_handle_bus(
      .clock(clk), 
      .reset(rst),  
      .complete_data(DUT.complete_data), 
      .complete_instr(DUT.complete_instr), 
      .IR(DUT.IR), 
      .psr(DUT.psr), 
      .IR_Exec(DUT.IR_Exec),
      .Instr_dout(DUT.Instr_dout),
      .NZP(DUT.NZP)
     );
  control_out_if  control_control_out_agent_handle_bus(
     .clock(clk), 
     .reset(rst), 
     .enable_updatePC(DUT.enable_updatePC), 
     .enable_fetch(DUT.enable_fetch),  
     .enable_decode(DUT.enable_decode), 
     .enable_execute(DUT.enable_execute), 
     .enable_writeback(DUT.enable_writeback),  
     .bypass_alu_1(DUT.bypass_alu_1), 
     .bypass_alu_2(DUT.bypass_alu_2), 
     .bypass_mem_1(DUT.bypass_mem_1), 
     .bypass_mem_2(DUT.bypass_mem_2), 
     .mem_state(DUT.mem_state),
     .br_taken(DUT.br_taken)
     );

  //imem
  inst_mem_if  inst_mem_bus(
     .clock(clk), 
     .reset(rst), 
     .PC(DUT.pc), 
     .instrmem_rd(DUT.instrmem_rd),
     .instr_dout(DUT.Instr_dout) ,
     .complete_instr(DUT.complete_instr)
     );

  //dmem
  data_mem_if  data_mem_bus(
     .clock(clk), 
     .reset(rst), 
     .complete_data(DUT.complete_data), 
     .Data_dout(DUT.Data_dout), 
     .Data_din(DUT.Data_din), 
     .Data_rd(DUT.Data_rd),
     .Data_addr(DUT.Data_addr)
     );
  
  //Instantiation of BFM
  fetch_in_monitor_bfm  fetch_agent_fetch_in_mon_bfm(fetch_agent_fetch_in_bus);
  fetch_out_monitor_bfm  fetch_agent_fetch_out_mon_bfm(fetch_agent_fetch_out_bus);
  decode_in_monitor_bfm  decode_decode_in_agent_handle_mon_bfm(decode_decode_in_agent_handle_bus);
  decode_out_monitor_bfm  decode_decode_out_agent_handle_mon_bfm(decode_decode_out_agent_handle_bus);
  control_in_monitor_bfm  control_control_in_agent_handle_mon_bfm(control_control_in_agent_handle_bus);
  control_out_monitor_bfm  control_control_out_agent_handle_mon_bfm(control_control_out_agent_handle_bus);
  execute_in_monitor_bfm  execute_execute_in_agent_mon_bfm(execute_execute_in_agent_bus);
  execute_out_monitor_bfm  execute_execute_out_agent_mon_bfm(execute_execute_out_agent_bus);
  memaccess_in_monitor_bfm  memaccess_memaccess_in_agent_handle_mon_bfm(memaccess_memaccess_in_agent_handle_bus);
  memaccess_out_monitor_bfm  memaccess_memaccess_out_agent_handle_mon_bfm(memaccess_memaccess_out_agent_handle_bus);
  writeback_in_monitor_bfm  writeback_agent_in_mon_bfm(writeback_agent_in_bus);
  writeback_out_monitor_bfm  writeback_agent_out_mon_bfm(writeback_agent_out_bus);
  inst_mem_monitor_bfm  inst_mem_mon_bfm(inst_mem_bus);
  data_mem_monitor_bfm  data_mem_mon_bfm(data_mem_bus);
  inst_mem_driver_bfm  inst_mem_drv_bfm(inst_mem_bus);
  data_mem_driver_bfm  data_mem_drv_bfm(data_mem_bus);

  initial begin      // tbx vif_binding_block 
    import uvm_pkg::uvm_config_db;
    // The monitor_bfm and driver_bfm for each interface is placed into the uvm_config_db.
    // They are placed into the uvm_config_db using the string names defined in the parameters package.
    // The string names are passed to the agent configurations by test_top through the top level configuration.
    // They are retrieved by the agents configuration class for use by the agent.
    uvm_config_db #( virtual fetch_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , fetch_agent_fetch_in_BFM , fetch_agent_fetch_in_mon_bfm ); 
    uvm_config_db #( virtual fetch_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , fetch_agent_fetch_out_BFM , fetch_agent_fetch_out_mon_bfm ); 
    uvm_config_db #( virtual decode_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , decode_decode_in_agent_handle_BFM , decode_decode_in_agent_handle_mon_bfm ); 
    uvm_config_db #( virtual decode_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , decode_decode_out_agent_handle_BFM , decode_decode_out_agent_handle_mon_bfm ); 
    uvm_config_db #( virtual control_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , control_control_in_agent_handle_BFM , control_control_in_agent_handle_mon_bfm ); 
    uvm_config_db #( virtual control_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , control_control_out_agent_handle_BFM , control_control_out_agent_handle_mon_bfm ); 
    uvm_config_db #( virtual execute_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , execute_execute_in_agent_BFM , execute_execute_in_agent_mon_bfm ); 
    uvm_config_db #( virtual execute_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , execute_execute_out_agent_BFM , execute_execute_out_agent_mon_bfm ); 
    uvm_config_db #( virtual memaccess_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , memaccess_memaccess_in_agent_handle_BFM , memaccess_memaccess_in_agent_handle_mon_bfm ); 
    uvm_config_db #( virtual memaccess_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , memaccess_memaccess_out_agent_handle_BFM , memaccess_memaccess_out_agent_handle_mon_bfm ); 
    uvm_config_db #( virtual writeback_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , writeback_agent_in_BFM , writeback_agent_in_mon_bfm ); 
    uvm_config_db #( virtual writeback_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , writeback_agent_out_BFM , writeback_agent_out_mon_bfm ); 
    uvm_config_db #( virtual inst_mem_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , inst_mem_BFM , inst_mem_mon_bfm ); 
    uvm_config_db #( virtual data_mem_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , data_mem_BFM , data_mem_mon_bfm ); 
    uvm_config_db #( virtual inst_mem_driver_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , inst_mem_BFM , inst_mem_drv_bfm  );
    uvm_config_db #( virtual data_mem_driver_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , data_mem_BFM , data_mem_drv_bfm  );
  end

  LC3 DUT (	.clock(clk), 
            .reset(rst), 
            .pc(inst_mem_bus.PC) , 
            .instrmem_rd(inst_mem_bus.instrmem_rd), 
            .Instr_dout(inst_mem_bus.instr_dout), 
            .Data_addr(data_mem_bus.Data_addr), 
            .complete_instr(inst_mem_bus.complete_instr),
            .complete_data(data_mem_bus.complete_data),  
				.Data_din(data_mem_bus.Data_din), 
            .Data_dout(data_mem_bus.Data_dout), 
            .Data_rd(data_mem_bus.Data_rd)	
			);

 

endmodule


