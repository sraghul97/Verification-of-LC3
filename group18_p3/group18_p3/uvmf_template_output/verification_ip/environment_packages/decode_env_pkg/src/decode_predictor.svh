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
//   analysis_export receives transactions of type  decode_in_transaction
//
//   This analysis component has the following analysis_ports that can broadcast 
//   the listed transaction type.
//
//  expected_output_analysis_port broadcasts transactions of type decode_out_transaction
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

class decode_predictor #(
  type CONFIG_T,
  type BASE_T = uvm_component
  ) extends BASE_T;

  // Factory registration of this class
  `uvm_component_param_utils( decode_predictor #(
                              CONFIG_T,
                              BASE_T
                              ))


  // Instantiate a handle to the configuration of the environment in which this component resides
  CONFIG_T configuration;

  static bit [15:0] prev_IR = 16'h0;
  static bit [15:0] prev_npc_out = 16'h0;
  static bit [5:0] prev_E_Control = 6'h0;
  static bit [1:0] prev_W_Control = 2'h0;
  static bit prev_Mem_Control = 1'h0;

  bit first_enable_decode_rcvd;
  
  // Instantiate the analysis exports
  uvm_analysis_imp_analysis_export #(decode_in_transaction, decode_predictor #(
                              .CONFIG_T(CONFIG_T),
                              .BASE_T(BASE_T)
                              )) analysis_export;

  
  // Instantiate the analysis ports
  uvm_analysis_port #(decode_out_transaction) expected_output_analysis_port;


  // Transaction variable for predicted values to be sent out expected_output_analysis_port
  // Once a transaction is sent through an analysis_port, another transaction should
  // be constructed for the next predicted transaction. 
  typedef decode_out_transaction expected_output_analysis_port_output_transaction_t;
  expected_output_analysis_port_output_transaction_t expected_output_analysis_port_output_transaction;
  // Code for sending output transaction out through expected_output_analysis_port
  // expected_output_analysis_port.write(expected_output_analysis_port_output_transaction);
  expected_output_analysis_port_output_transaction_t golden_expected_output_analysis_port_output_transaction;
  expected_output_analysis_port_output_transaction_t stored_expected_output_analysis_port_output_transaction;
 bit first_txn = 1;

  // Define transaction handles for debug visibility 
  decode_in_transaction analysis_export_debug;


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
    expected_output_analysis_port =new("expected_output_analysis_port", this );
  // pragma uvmf custom build_phase begin
  // pragma uvmf custom build_phase end
  endfunction

  // FUNCTION: write_analysis_export
  // Transactions received through analysis_export initiate the execution of this function.
  // This function performs prediction of DUT output values based on DUT input, configuration and state
  virtual function void write_analysis_export(decode_in_transaction t);
    // pragma uvmf custom analysis_export_predictor begin
    analysis_export_debug = t;
    `uvm_info("PRED", "Transaction Received through analysis_export", UVM_MEDIUM)
    `uvm_info("PRED", {"            Data: ",t.convert2string()}, UVM_FULL)
    // Construct one of each output transaction type.
    expected_output_analysis_port_output_transaction = expected_output_analysis_port_output_transaction_t::type_id::create("expected_output_analysis_port_output_transaction");

      if((decode_model(t.dout, t.npc_in, expected_output_analysis_port_output_transaction.ir, expected_output_analysis_port_output_transaction.npc_out, expected_output_analysis_port_output_transaction.e_control, expected_output_analysis_port_output_transaction.w_control,  expected_output_analysis_port_output_transaction.mem_control)))
     begin
       `uvm_fatal(get_name(), "Error in the decode model function");
      end
 
 
    // Code for sending output transaction out through expected_output_analysis_port
    // Please note that each broadcasted transaction should be a different object than previously 
    // broadcasted transactions.  Creation of a different object is done by constructing the transaction 
    // using either new() or create().  Broadcasting a transaction object more than once to either the 
    // same subscriber or multiple subscribers will result in unexpected and incorrect behavior.
    // pragma uvmf custom analysis_export_predictor end

 //  expected_output_analysis_port.write(expected_output_analysis_port_output_transaction);


    if(first_txn || first_enable_decode_rcvd == 0)
    begin
      golden_expected_output_analysis_port_output_transaction = expected_output_analysis_port_output_transaction_t::type_id::create("expected_output_analysis_port_output_transaction");
      golden_expected_output_analysis_port_output_transaction.npc_out     = 0;
      golden_expected_output_analysis_port_output_transaction.e_control   = 0;
      golden_expected_output_analysis_port_output_transaction.w_control   = 0;
      golden_expected_output_analysis_port_output_transaction.mem_control = 0;
      expected_output_analysis_port.write(golden_expected_output_analysis_port_output_transaction);
      first_txn = 0;
      stored_expected_output_analysis_port_output_transaction = expected_output_analysis_port_output_transaction_t::type_id::create("stored_expected_output_analysis_port_output_transaction");
      stored_expected_output_analysis_port_output_transaction = expected_output_analysis_port_output_transaction;
    end

    else if (t.enable_decode == 1'b1) 
    begin
      expected_output_analysis_port.write(stored_expected_output_analysis_port_output_transaction);
      stored_expected_output_analysis_port_output_transaction = expected_output_analysis_port_output_transaction_t::type_id::create("stored_expected_output_analysis_port_output_transaction");
      stored_expected_output_analysis_port_output_transaction = expected_output_analysis_port_output_transaction;
    end
  else 
  begin
    stored_expected_output_analysis_port_output_transaction.ir = prev_IR;
    stored_expected_output_analysis_port_output_transaction.npc_out = prev_npc_out;
    stored_expected_output_analysis_port_output_transaction.e_control = prev_E_Control;
    stored_expected_output_analysis_port_output_transaction.w_control = prev_W_Control;
    stored_expected_output_analysis_port_output_transaction.mem_control = prev_Mem_Control;
    expected_output_analysis_port.write(stored_expected_output_analysis_port_output_transaction);
  end

  prev_IR            = stored_expected_output_analysis_port_output_transaction.ir;
  prev_npc_out       = stored_expected_output_analysis_port_output_transaction.npc_out;
  prev_E_Control     = stored_expected_output_analysis_port_output_transaction.e_control;
  prev_W_Control     = stored_expected_output_analysis_port_output_transaction.w_control;
  prev_Mem_Control   = stored_expected_output_analysis_port_output_transaction.mem_control; 

   if(first_enable_decode_rcvd == 0)  
   begin
     first_enable_decode_rcvd = t.enable_decode;
   end

  endfunction


endclass 

// pragma uvmf custom external begin
// pragma uvmf custom external end

