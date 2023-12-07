//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class can be used to provide stimulus when an interface
//              has been configured to run in a responder mode. It
//              will never finish by default, always going back to the driver
//              and driver BFM for the next transaction with which to respond.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class inst_mem_responder_sequence 
  extends inst_mem_sequence_base ;

  `uvm_object_utils( inst_mem_responder_sequence )

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
  bit is_random = 1;
  static int instr_count = 0;
  int fd = 0;
  int de = 0;
  int k = 0;
  logic [2:0] dr = 3'b0;
  logic [8:0] pc_offset_9 = 9'b0;
  logic [5:0] pc_offset_6 = 6'b0;
  logic [2:0] br = 3'b0;

  function new(string name = "inst_mem_responder_sequence");
    super.new(name);
  endfunction

    task program_registers();
    start_item(req);
    finish_item(req);
    req.instr_dout[15:12] = LD;
    req.dr = 3'h0;
    req.instr_dout[11:0] = {req.dr, req.pcoffset9}; //LD to R0
    req.complete_instr = 1;

    start_item(req);
    finish_item(req);
    req.instr_dout[15:12] = LD;
    req.dr = 3'h0;
    req.instr_dout[11:0] = {req.dr, 9'h0}; //LD to R0
    req.complete_instr = 1;

    start_item(req);
    finish_item(req);
    req.instr_dout[15:12] = LD;
    req.dr = 3'h1;
    req.instr_dout[11:0] = {req.dr, 9'h0}; //LD to R0
    req.complete_instr = 1;

    start_item(req);
    finish_item(req);
    req.instr_dout[15:12] = LD;
    req.dr = 3'h2;
    req.instr_dout[11:0] = {req.dr, 9'h0}; //LD to R0
    req.complete_instr = 1;

    start_item(req);
    finish_item(req);
    req.instr_dout[15:12] = LD;
    req.dr = 3'h3;
    req.instr_dout[11:0] = {req.dr, 9'h0}; //LD to R0
    req.complete_instr = 1;

    start_item(req);
    finish_item(req);
    req.instr_dout[15:12] = LD;
    req.dr = 3'h4;
    req.instr_dout[11:0] = {req.dr, 9'h0}; //LD to R0
    req.complete_instr = 1;

    start_item(req);
    finish_item(req);
    req.instr_dout[15:12] = LD;
    req.dr = 3'h5;
    req.instr_dout[11:0] = {req.dr, 9'h0}; //LD to R0
    req.complete_instr = 1;

    start_item(req);
    finish_item(req);
    req.instr_dout[15:12] = LD;
    req.dr = 3'h6;
    req.instr_dout[11:0] = {req.dr, 9'h0}; //LD to R0
    req.complete_instr = 1;

    start_item(req);
    finish_item(req);
    req.instr_dout[15:12] = LD;
    req.dr = 3'h7;
    req.instr_dout[11:0] = {req.dr, 9'h0}; //LD to R0
    req.complete_instr = 1;

    start_item(req);
    finish_item(req);

   endtask


  task init_program();
    req=inst_mem_transaction::type_id::create("req");
    start_item(req);
    finish_item(req);
    req.instr_dout = 'h2001;

    start_item(req);
    finish_item(req);
    req.instr_dout = 'h2202;
    start_item(req);
    finish_item(req);
    req.instr_dout = 'h2403;
    start_item(req);
    finish_item(req);
    req.instr_dout = 'h2604;
    start_item(req);
    finish_item(req);
    req.instr_dout = 'h2805;
    start_item(req);
    finish_item(req);
    req.instr_dout = 'h2a06;
    start_item(req);
    finish_item(req);
    req.instr_dout = 'h2c07;
    start_item(req);
    finish_item(req);
    req.instr_dout = 'h2e08;
    start_item(req);
    finish_item(req);
    req = inst_mem_transaction::type_id::create("req");
    for(fd= 0; fd<8; fd++) 
    begin
       for( de =0; de<512; de++) 
       begin
               start_item(req);
               if(!req.randomize()) `uvm_fatal("SEQ", "inst_mem_transaction randomization failed")
               req.instr_dout[15:12] = 4'b1110;
               req.instr_dout[11:9]  = dr;
               req.instr_dout[8:0]   = pc_offset_9;
               pc_offset_9 = pc_offset_9 + 9'h1;
               finish_item(req);
           end
           dr = dr + 3'h1;
       end
      
      dr = '0;
      pc_offset_9 = '0;
  endtask

  task body();
   init_program();
   program_registers();
    forever begin
      start_item(req);
      if(is_random)
      begin
        if(!req.randomize())
        begin
          `uvm_fatal(get_name,"Randomization failed")
        end
      end
      finish_item(req);
      // pragma uvmf custom body begin
      // UVMF_CHANGE_ME : Do something here with the resulting req item.  The
      // finish_item() call above will block until the req transaction is ready
      // to be handled by the responder sequence.
      // If this was an item that required a response, the expectation is
      // that the response should be populated within this transaction now.
      `uvm_info("SEQ",$sformatf("Processed txn: %s",req.convert2string()),UVM_LOW)
      // pragma uvmf custom body end
    end
  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

