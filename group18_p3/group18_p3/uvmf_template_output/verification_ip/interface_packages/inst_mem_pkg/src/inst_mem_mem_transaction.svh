class inst_mem_mem_transaction extends inst_mem_transaction;

  `uvm_object_utils( inst_mem_mem_transaction )

    constraint valid_instr
    {
	opcode inside {LD,LDI,LDR,LEA,AND,ST,STI,STR,LEA,AND};
    }


  // ****************************************************************************
  // FUNCTION : new()
  // This function is the standard SystemVerilog constructor.
  //
  function new( string name = "" );
    super.new( name );
 
  endfunction

endclass

