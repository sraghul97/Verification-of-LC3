class mem_test extends test_top;

  `uvm_component_utils( mem_test );

  function new( string name = "", uvm_component parent = null );
    super.new( name, parent );
  endfunction

  virtual function void build_phase(uvm_phase phase);
    // The factory override below is an example of how to replace the lc3_bench_bench_sequence_base 
    // sequence with the example_derived_test_sequence.
    inst_mem_transaction::type_id::set_type_override(inst_mem_mem_transaction::get_type());
    // Execute the build_phase of test_top AFTER all factory overrides have been created.
    super.build_phase(phase);
  endfunction

endclass

