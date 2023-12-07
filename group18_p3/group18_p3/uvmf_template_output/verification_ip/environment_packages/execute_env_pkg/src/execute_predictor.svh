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
//   analysis_export receives transactions of type  execute_in_transaction
//
//   This analysis component has the following analysis_ports that can broadcast 
//   the listed transaction type.
//
//  expected_ap broadcasts transactions of type execute_out_transaction
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

class execute_predictor #(
  type CONFIG_T,
  type BASE_T = uvm_component
  ) extends BASE_T;

  // Factory registration of this class
  `uvm_component_param_utils( execute_predictor #(
                              CONFIG_T,
                              BASE_T
                              ))


  // Instantiate a handle to the configuration of the environment in which this component resides
  CONFIG_T configuration;

  
  // Instantiate the analysis exports
  uvm_analysis_imp_analysis_export #(execute_in_transaction, execute_predictor #(
                              .CONFIG_T(CONFIG_T),
                              .BASE_T(BASE_T)
                              )) analysis_export;

  
  // Instantiate the analysis ports
  uvm_analysis_port #(execute_out_transaction) expected_ap;


  // Transaction variable for predicted values to be sent out expected_ap
  // Once a transaction is sent through an analysis_port, another transaction should
  // be constructed for the next predicted transaction. 
  typedef execute_out_transaction expected_ap_output_transaction_t;
  expected_ap_output_transaction_t expected_ap_output_transaction;
  // Code for sending output transaction out through expected_ap
  expected_ap_output_transaction_t stored_txn;
  expected_ap_output_transaction_t golden_pred_out_output_transaction;
  bit first_txn = 1;
  // expected_ap.write(expected_ap_output_transaction);

  // Define transaction handles for debug visibility 
  execute_in_transaction analysis_export_debug;


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
    expected_ap =new("expected_ap", this );
  // pragma uvmf custom build_phase begin
  // pragma uvmf custom build_phase end
  endfunction

  // FUNCTION: write_analysis_export
  // Transactions received through analysis_export initiate the execution of this function.
  // This function performs prediction of DUT output values based on DUT input, configuration and state
  virtual function void write_analysis_export(execute_in_transaction t);
    // pragma uvmf custom analysis_export_predictor begin
    analysis_export_debug = t;
    `uvm_info("PRED", "Transaction Received through analysis_export", UVM_MEDIUM)
    `uvm_info("PRED", {"            Data: ",t.convert2string()}, UVM_FULL)
    // Construct one of each output transaction type.
    expected_ap_output_transaction = expected_ap_output_transaction_t::type_id::create("expected_ap_output_transaction");
    // Code for sending output transaction out through expected_ap
    // Please note that each broadcasted transaction should be a different object than previously 
    // broadcasted transactions.  Creation of a different object is done by constructing the transaction 
    // using either new() or create().  Broadcasting a transaction object more than once to either the 
    // same subscriber or multiple subscribers will result in unexpected and incorrect behavior.
        if(execute_model(t.E_control, t.bypass_alu_1, t.bypass_alu_2, t.bypass_mem_1, t.bypass_mem_2,t.enable_execute, t.IR, t.npc_in, t.Mem_Control_in, t.W_Control_in, t.Mem_Bypass_Val, t.VSR1, t.VSR2, expected_ap_output_transaction.aluout, expected_ap_output_transaction.W_Control_out, expected_ap_output_transaction.Mem_Control_out, expected_ap_output_transaction.M_Data, expected_ap_output_transaction.dr, expected_ap_output_transaction.sr1, expected_ap_output_transaction.sr2, expected_ap_output_transaction.IR_Exec, expected_ap_output_transaction.NZP, expected_ap_output_transaction.pcout))
   begin
      `uvm_fatal(get_name(), "Predcitor model failed for execute block");
    end
 //   expected_ap.write(expected_ap_output_transaction);
   if(first_txn)
      begin
        golden_pred_out_output_transaction = expected_ap_output_transaction_t::type_id::create("golden_pred_out_output_transaction");
        golden_pred_out_output_transaction.aluout        = 0;
        golden_pred_out_output_transaction.W_Control_out = 0;
        golden_pred_out_output_transaction.Mem_Control_out = 0;
        golden_pred_out_output_transaction.M_Data = 0;
        golden_pred_out_output_transaction.dr = 0;
        golden_pred_out_output_transaction.sr1 = 0;
        golden_pred_out_output_transaction.sr2 = 0;
        golden_pred_out_output_transaction.IR_Exec = 0;
        golden_pred_out_output_transaction.NZP = 0;
        golden_pred_out_output_transaction.pcout = 0;
        expected_ap.write(golden_pred_out_output_transaction);
        stored_txn = expected_ap_output_transaction_t::type_id::create("stored_txn");
        stored_txn = expected_ap_output_transaction ;
        first_txn = 0;
      end
      else
      // Actual pred txn check.
      begin
       expected_ap.write(stored_txn);
       stored_txn = expected_ap_output_transaction_t::type_id::create("stored_txn");
       stored_txn = expected_ap_output_transaction;
      end
    
    // pragma uvmf custom analysis_export_predictor end
  endfunction


endclass 

// pragma uvmf custom external begin
// pragma uvmf custom external end

