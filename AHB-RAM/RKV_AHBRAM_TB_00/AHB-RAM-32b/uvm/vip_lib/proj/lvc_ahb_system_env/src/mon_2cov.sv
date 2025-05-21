//
// Template for UVM-compliant Monitor to Coverage Connector Callbacks
//

`ifndef LVC_AHB_MASTER_MONITOR_2COV_CONNECT
`define LVC_AHB_MASTER_MONITOR_2COV_CONNECT
class lvc_ahb_master_monitor_2cov_connect extends uvm_component;
   lvc_ahb_system_env_cov cov;
   uvm_analysis_export # (lvc_ahb_master_transaction) an_exp;
   `uvm_component_utils(lvc_ahb_master_monitor_2cov_connect)
   function new(string name="", uvm_component parent=null);
   	super.new(name, parent);
   endfunction: new

   virtual function void write(lvc_ahb_master_transaction tr);
      cov.tr = tr;
      -> cov.cov_event;
   endfunction:write 
endclass: lvc_ahb_master_monitor_2cov_connect

`endif // LVC_AHB_MASTER_MONITOR_2COV_CONNECT
