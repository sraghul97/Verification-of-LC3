 

onerror resume
wave tags F0
wave update off

wave spacer -backgroundcolor Salmon { fetch_agent_fetch_in }
wave add uvm_test_top.environment.fetch.agent_fetch_in.agent_fetch_in_monitor.txn_stream -radix string -tag F0
wave group fetch_agent_fetch_in_bus
wave add -group fetch_agent_fetch_in_bus hdl_top.fetch_agent_fetch_in_bus.* -radix hexadecimal -tag F0
wave group fetch_agent_fetch_in_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { fetch_agent_fetch_out }
wave add uvm_test_top.environment.fetch.agent_fetch_out.agent_fetch_out_monitor.txn_stream -radix string -tag F0
wave group fetch_agent_fetch_out_bus
wave add -group fetch_agent_fetch_out_bus hdl_top.fetch_agent_fetch_out_bus.* -radix hexadecimal -tag F0
wave group fetch_agent_fetch_out_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { decode_decode_in_agent_handle }
wave add uvm_test_top.environment.decode.decode_in_agent_handle.decode_in_agent_handle_monitor.txn_stream -radix string -tag F0
wave group decode_decode_in_agent_handle_bus
wave add -group decode_decode_in_agent_handle_bus hdl_top.decode_decode_in_agent_handle_bus.* -radix hexadecimal -tag F0
wave group decode_decode_in_agent_handle_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { decode_decode_out_agent_handle }
wave add uvm_test_top.environment.decode.decode_out_agent_handle.decode_out_agent_handle_monitor.txn_stream -radix string -tag F0
wave group decode_decode_out_agent_handle_bus
wave add -group decode_decode_out_agent_handle_bus hdl_top.decode_decode_out_agent_handle_bus.* -radix hexadecimal -tag F0
wave group decode_decode_out_agent_handle_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { control_control_in_agent_handle }
wave add uvm_test_top.environment.control.control_in_agent_handle.control_in_agent_handle_monitor.txn_stream -radix string -tag F0
wave group control_control_in_agent_handle_bus
wave add -group control_control_in_agent_handle_bus hdl_top.control_control_in_agent_handle_bus.* -radix hexadecimal -tag F0
wave group control_control_in_agent_handle_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { control_control_out_agent_handle }
wave add uvm_test_top.environment.control.control_out_agent_handle.control_out_agent_handle_monitor.txn_stream -radix string -tag F0
wave group control_control_out_agent_handle_bus
wave add -group control_control_out_agent_handle_bus hdl_top.control_control_out_agent_handle_bus.* -radix hexadecimal -tag F0
wave group control_control_out_agent_handle_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { execute_execute_in_agent }
wave add uvm_test_top.environment.execute.execute_in_agent.execute_in_agent_monitor.txn_stream -radix string -tag F0
wave group execute_execute_in_agent_bus
wave add -group execute_execute_in_agent_bus hdl_top.execute_execute_in_agent_bus.* -radix hexadecimal -tag F0
wave group execute_execute_in_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { execute_execute_out_agent }
wave add uvm_test_top.environment.execute.execute_out_agent.execute_out_agent_monitor.txn_stream -radix string -tag F0
wave group execute_execute_out_agent_bus
wave add -group execute_execute_out_agent_bus hdl_top.execute_execute_out_agent_bus.* -radix hexadecimal -tag F0
wave group execute_execute_out_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { memaccess_memaccess_in_agent_handle }
wave add uvm_test_top.environment.memaccess.memaccess_in_agent_handle.memaccess_in_agent_handle_monitor.txn_stream -radix string -tag F0
wave group memaccess_memaccess_in_agent_handle_bus
wave add -group memaccess_memaccess_in_agent_handle_bus hdl_top.memaccess_memaccess_in_agent_handle_bus.* -radix hexadecimal -tag F0
wave group memaccess_memaccess_in_agent_handle_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { memaccess_memaccess_out_agent_handle }
wave add uvm_test_top.environment.memaccess.memaccess_out_agent_handle.memaccess_out_agent_handle_monitor.txn_stream -radix string -tag F0
wave group memaccess_memaccess_out_agent_handle_bus
wave add -group memaccess_memaccess_out_agent_handle_bus hdl_top.memaccess_memaccess_out_agent_handle_bus.* -radix hexadecimal -tag F0
wave group memaccess_memaccess_out_agent_handle_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { writeback_agent_in }
wave add uvm_test_top.environment.writeback.agent_in.agent_in_monitor.txn_stream -radix string -tag F0
wave group writeback_agent_in_bus
wave add -group writeback_agent_in_bus hdl_top.writeback_agent_in_bus.* -radix hexadecimal -tag F0
wave group writeback_agent_in_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { writeback_agent_out }
wave add uvm_test_top.environment.writeback.agent_out.agent_out_monitor.txn_stream -radix string -tag F0
wave group writeback_agent_out_bus
wave add -group writeback_agent_out_bus hdl_top.writeback_agent_out_bus.* -radix hexadecimal -tag F0
wave group writeback_agent_out_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { inst_mem }
wave add uvm_test_top.environment.inst_mem.inst_mem_monitor.txn_stream -radix string -tag F0
wave group inst_mem_bus
wave add -group inst_mem_bus hdl_top.inst_mem_bus.* -radix hexadecimal -tag F0
wave group inst_mem_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { data_mem }
wave add uvm_test_top.environment.data_mem.data_mem_monitor.txn_stream -radix string -tag F0
wave group data_mem_bus
wave add -group data_mem_bus hdl_top.data_mem_bus.* -radix hexadecimal -tag F0
wave group data_mem_bus -collapse
wave insertion [expr [wave index insertpoint] +1]



wave update on
WaveSetStreamView

