//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//
//----------------------------------------------------------------------
//
// DESCRIPTION: This analysis component contains analysis_exports for receiving
//   data and analysis_ports for sending data.
// 
//   This analysis component has the following analysis_exports that receive the 
//   listed transaction type.
//   
//   analysis_export receives transactions of type  fetch_in_transaction
//
//   This analysis component has the following analysis_ports that can broadcast 
//   the listed transaction type.
//
//  pred_out broadcasts transactions of type fetch_out_transaction
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

class fetch_predictor #(
  type CONFIG_T,
  type BASE_T = uvm_component
  ) extends BASE_T;

  // Factory registration of this class
  `uvm_component_param_utils( fetch_predictor #(
                              CONFIG_T,
                              BASE_T
                              ))


  // Instantiate a handle to the configuration of the environment in which this component resides
  CONFIG_T configuration;

  
  // Instantiate the analysis exports
  uvm_analysis_imp_analysis_export #(fetch_in_transaction, fetch_predictor #(
                              .CONFIG_T(CONFIG_T),
                              .BASE_T(BASE_T)
                              )) analysis_export;

  
  // Instantiate the analysis ports
  uvm_analysis_port #(fetch_out_transaction) pred_out;


  // Transaction variable for predicted values to be sent out pred_out
  // Once a transaction is sent through an analysis_port, another transaction should
  // be constructed for the next predicted transaction. 
  typedef fetch_out_transaction pred_out_output_transaction_t;
  pred_out_output_transaction_t pred_out_output_transaction;
  pred_out_output_transaction_t stored_pred_out_output_transaction;
  pred_out_output_transaction_t golden_pred_out_output_transaction;
  bit first_txn = 1;

  // Code for sending output transaction out through pred_out
  // pred_out.write(pred_out_output_transaction);

  // Define transaction handles for debug visibility 
  fetch_in_transaction analysis_export_debug;


  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  // FUNCTION: new
  function new(string name, uvm_component parent);
     super.new(name,parent);
  // pragma uvmf custom new begin
  // pragma uvmf custom new end
  endfunction

  // FUNCTION: build_phase
  virtual function void build_phase (uvm_phase phase);

    analysis_export = new("analysis_export", this);
    pred_out =new("pred_out", this );
  // pragma uvmf custom build_phase begin
  // pragma uvmf custom build_phase end
  endfunction

  // FUNCTION: write_analysis_export
  // Transactions received through analysis_export initiate the execution of this function.
  // This function performs prediction of DUT output values based on DUT input, configuration and state
  virtual function void write_analysis_export(fetch_in_transaction t);
    // pragma uvmf custom analysis_export_predictor begin
    analysis_export_debug = t;
    `uvm_info("PRED", "Transaction Received through analysis_export", UVM_MEDIUM)
    `uvm_info("PRED", {"            Data: ",t.convert2string()}, UVM_FULL)
    // Construct one of each output transaction type.
    pred_out_output_transaction = pred_out_output_transaction_t::type_id::create("pred_out_output_transaction");
    //  UVMF_CHANGE_ME: Implement predictor model here.  

 if(fetch_model(t.enable_updatePC, t.enable_fetch, t.br_taken, t.taddr, 
                                    pred_out_output_transaction.npc, 
                                    pred_out_output_transaction.pc, 
                                    pred_out_output_transaction.instrmem_rd))
 begin
   `uvm_fatal(get_name(), $sformatf("Fetch_Predictor_Model_Failed"));
 end



//`uvm_info("ANURAG_IS_AWESOME",$sformatf("PRED == %s",pred_out_output_transaction.convert2string()),UVM_LOW)
    
 
    // Code for sending output transaction out through pred_out
    // Please note that each broadcasted transaction should be a different object than previously 
    // broadcasted transactions.  Creation of a different object is done by constructing the transaction 
    // using either new() or create().  Broadcasting a transaction object more than once to either the 
    // same subscriber or multiple subscribers will result in unexpected and incorrect behavior.
//    if(t.enable_fetch)

   // Golden Model check.
   if(first_txn)
   begin
     golden_pred_out_output_transaction = pred_out_output_transaction_t::type_id::create("golden_pred_out_output_transaction");
     golden_pred_out_output_transaction.npc = 'h3001;
     golden_pred_out_output_transaction.pc = 'h3000;
     golden_pred_out_output_transaction.instrmem_rd = 'h1;
     pred_out.write(golden_pred_out_output_transaction);
     stored_pred_out_output_transaction = pred_out_output_transaction_t::type_id::create("stored_pred_out_output_transaction");
     stored_pred_out_output_transaction = pred_out_output_transaction;
     first_txn = 0;
   end
   else
   // Actual pred txn check.
   begin
    pred_out.write(stored_pred_out_output_transaction);
    stored_pred_out_output_transaction = pred_out_output_transaction_t::type_id::create("stored_pred_out_output_transaction");
    stored_pred_out_output_transaction = pred_out_output_transaction;
   end
   


    // pragma uvmf custom analysis_export_predictor end
  endfunction


endclass 

// pragma uvmf custom external begin
// pragma uvmf custom external end

