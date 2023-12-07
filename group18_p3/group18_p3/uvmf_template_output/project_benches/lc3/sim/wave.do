 

onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -noupdate -divider fetch_agent_fetch_in 
add wave -noupdate /uvm_root/uvm_test_top/environment.fetch/agent_fetch_in/agent_fetch_in_monitor/txn_stream
add wave -noupdate -group fetch_agent_fetch_in_bus /hdl_top/fetch_agent_fetch_in_bus/*
add wave -noupdate -divider fetch_agent_fetch_out 
add wave -noupdate /uvm_root/uvm_test_top/environment.fetch/agent_fetch_out/agent_fetch_out_monitor/txn_stream
add wave -noupdate -group fetch_agent_fetch_out_bus /hdl_top/fetch_agent_fetch_out_bus/*
add wave -noupdate -divider decode_decode_in_agent_handle 
add wave -noupdate /uvm_root/uvm_test_top/environment.decode/decode_in_agent_handle/decode_in_agent_handle_monitor/txn_stream
add wave -noupdate -group decode_decode_in_agent_handle_bus /hdl_top/decode_decode_in_agent_handle_bus/*
add wave -noupdate -divider decode_decode_out_agent_handle 
add wave -noupdate /uvm_root/uvm_test_top/environment.decode/decode_out_agent_handle/decode_out_agent_handle_monitor/txn_stream
add wave -noupdate -group decode_decode_out_agent_handle_bus /hdl_top/decode_decode_out_agent_handle_bus/*
add wave -noupdate -divider control_control_in_agent_handle 
add wave -noupdate /uvm_root/uvm_test_top/environment.control/control_in_agent_handle/control_in_agent_handle_monitor/txn_stream
add wave -noupdate -group control_control_in_agent_handle_bus /hdl_top/control_control_in_agent_handle_bus/*
add wave -noupdate -divider control_control_out_agent_handle 
add wave -noupdate /uvm_root/uvm_test_top/environment.control/control_out_agent_handle/control_out_agent_handle_monitor/txn_stream
add wave -noupdate -group control_control_out_agent_handle_bus /hdl_top/control_control_out_agent_handle_bus/*
add wave -noupdate -divider execute_execute_in_agent 
add wave -noupdate /uvm_root/uvm_test_top/environment.execute/execute_in_agent/execute_in_agent_monitor/txn_stream
add wave -noupdate -group execute_execute_in_agent_bus /hdl_top/execute_execute_in_agent_bus/*
add wave -noupdate -divider execute_execute_out_agent 
add wave -noupdate /uvm_root/uvm_test_top/environment.execute/execute_out_agent/execute_out_agent_monitor/txn_stream
add wave -noupdate -group execute_execute_out_agent_bus /hdl_top/execute_execute_out_agent_bus/*
add wave -noupdate -divider memaccess_memaccess_in_agent_handle 
add wave -noupdate /uvm_root/uvm_test_top/environment.memaccess/memaccess_in_agent_handle/memaccess_in_agent_handle_monitor/txn_stream
add wave -noupdate -group memaccess_memaccess_in_agent_handle_bus /hdl_top/memaccess_memaccess_in_agent_handle_bus/*
add wave -noupdate -divider memaccess_memaccess_out_agent_handle 
add wave -noupdate /uvm_root/uvm_test_top/environment.memaccess/memaccess_out_agent_handle/memaccess_out_agent_handle_monitor/txn_stream
add wave -noupdate -group memaccess_memaccess_out_agent_handle_bus /hdl_top/memaccess_memaccess_out_agent_handle_bus/*
add wave -noupdate -divider writeback_agent_in 
add wave -noupdate /uvm_root/uvm_test_top/environment.writeback/agent_in/agent_in_monitor/txn_stream
add wave -noupdate -group writeback_agent_in_bus /hdl_top/writeback_agent_in_bus/*
add wave -noupdate -divider writeback_agent_out 
add wave -noupdate /uvm_root/uvm_test_top/environment.writeback/agent_out/agent_out_monitor/txn_stream
add wave -noupdate -group writeback_agent_out_bus /hdl_top/writeback_agent_out_bus/*
add wave -noupdate -divider inst_mem 
add wave -noupdate /uvm_root/uvm_test_top/environment/inst_mem/inst_mem_monitor/txn_stream
add wave -noupdate -group inst_mem_bus /hdl_top/inst_mem_bus/*
add wave -noupdate -divider data_mem 
add wave -noupdate /uvm_root/uvm_test_top/environment/data_mem/data_mem_monitor/txn_stream
add wave -noupdate -group data_mem_bus /hdl_top/data_mem_bus/*



TreeUpdate [SetDefaultTree]
quietly wave cursor active 0
configure wave -namecolwidth 472
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {27 ns} {168 ns}

