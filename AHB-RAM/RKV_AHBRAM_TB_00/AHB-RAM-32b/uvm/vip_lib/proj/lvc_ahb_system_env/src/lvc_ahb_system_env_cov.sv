//
// Template for UVM-compliant Coverage Class
//

`ifndef LVC_AHB_SYSTEM_ENV_COV__SV
`define LVC_AHB_SYSTEM_ENV_COV__SV

class lvc_ahb_system_env_cov extends uvm_component;
   event cov_event;
   lvc_ahb_master_transaction tr;
   uvm_analysis_imp #(lvc_ahb_master_transaction, lvc_ahb_system_env_cov) cov_export;
   `uvm_component_utils(lvc_ahb_system_env_cov)
 
   covergroup cg_trans @(cov_event);
      coverpoint tr.kind;
      // ToDo: Add required coverpoints, coverbins
   endgroup: cg_trans


   function new(string name, uvm_component parent);
      super.new(name,parent);
      cg_trans = new;
      cov_export = new("Coverage Analysis",this);
   endfunction: new

   virtual function write(lvc_ahb_master_transaction tr);
      this.tr = tr;
      -> cov_event;
   endfunction: write

endclass: lvc_ahb_system_env_cov

`endif // LVC_AHB_SYSTEM_ENV_COV__SV

