class inst_mem_branch_transaction extends inst_mem_transaction;

  `uvm_object_utils( inst_mem_branch_transaction )

	constraint valid_instr
    {
	opcode inside {BR,ADD};
    }


  // ****************************************************************************
  // FUNCTION : new()
  // This function is the standard SystemVerilog constructor.
  //
  function new( string name = "" );
    super.new( name );
 
  endfunction

endclass
