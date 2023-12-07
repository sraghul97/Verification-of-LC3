class inst_mem_alu_transaction extends inst_mem_transaction;

  `uvm_object_utils( inst_mem_alu_transaction )
   constraint valid_instr
    {
	opcode inside {AND,ADD,NOT,LDR,LD};
    }


  // ****************************************************************************
  // FUNCTION : new()
  // This function is the standard SystemVerilog constructor.
  //
  function new( string name = "" );
    super.new( name );
 
  endfunction

endclass

