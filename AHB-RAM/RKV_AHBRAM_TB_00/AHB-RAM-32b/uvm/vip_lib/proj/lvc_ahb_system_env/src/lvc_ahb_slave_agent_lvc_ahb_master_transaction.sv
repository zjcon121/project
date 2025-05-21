//
// Template for UVM-compliant transaction descriptor


`ifndef LVC_AHB_MASTER_TRANSACTION__SV
`define LVC_AHB_MASTER_TRANSACTION__SV


class lvc_ahb_master_transaction extends uvm_sequence_item;

   typedef enum {READ, WRITE } kinds_e;
   rand kinds_e kind;
   typedef enum {IS_OK, ERROR} status_e;
   rand status_e status;
   rand byte sa;

   // ToDo: Add constraint blocks to prevent error injection
   // ToDo: Add relevant class properties to define all transactions
   // ToDo: Modify/add symbolic transaction identifiers to match

   constraint lvc_ahb_master_transaction_valid {
      // ToDo: Define constraint to make descriptor valid
      status == IS_OK;
   }
   `uvm_object_utils_begin(lvc_ahb_master_transaction) 

      // ToDo: add properties using macros here
   
      `uvm_field_enum(kinds_e,kind,UVM_ALL_ON)
      `uvm_field_enum(status_e,status, UVM_ALL_ON)
   `uvm_object_utils_end
 
   extern function new(string name = "Trans");
endclass: lvc_ahb_master_transaction


function lvc_ahb_master_transaction::new(string name = "Trans");
   super.new(name);
endfunction: new


`endif // LVC_AHB_MASTER_TRANSACTION__SV
