//
// Template for UVM-compliant generic master agent
//

`ifndef LVC_AHB_MASTER_AGENT__SV
`define LVC_AHB_MASTER_AGENT__SV


class lvc_ahb_master_agent extends uvm_agent;
   // ToDo: add uvm agent properties here
   protected uvm_active_passive_enum is_active = UVM_ACTIVE;
   lvc_ahb_master_sequencer mast_sqr;
   lvc_ahb_master_driver mast_drv;
   lvc_ahb_master_monitor mast_mon;
   typedef virtual lvc_ahb_master_if vif;
   vif mast_agt_if; 

   `uvm_component_utils_begin(lvc_ahb_master_agent)
   //ToDo: add field utils macros here if required
	`uvm_component_utils_end

      // ToDo: Add required short hand override method

   function new(string name = "mast_agt", uvm_component parent = null);
      super.new(name, parent);
   endfunction

   virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      mast_mon = lvc_ahb_master_monitor::type_id::create("mast_mon", this);
      if (is_active == UVM_ACTIVE) begin
         mast_sqr = lvc_ahb_master_sequencer::type_id::create("mast_sqr", this);
         mast_drv = lvc_ahb_master_driver::type_id::create("mast_drv", this);
      end
      if (!uvm_config_db#(vif)::get(this, "", "mst_if", mast_agt_if)) begin
         `uvm_fatal("AGT/NOVIF", "No virtual interface specified for this agent instance")
      end
      uvm_config_db# (vif)::set(this,"mast_drv","mst_if",mast_drv.drv_if);
      uvm_config_db# (vif)::set(this,"mast_mon","mst_if",mast_mon.mon_if);
   endfunction: build_phase

   virtual function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      if (is_active == UVM_ACTIVE) begin
   		  mast_drv.seq_item_port.connect(mast_sqr.seq_item_export);
      end
   endfunction

   virtual task run_phase(uvm_phase phase);
      super.run_phase(phase);
      // phase.raise_objection(this,"slv_agt_run"); //Raise/drop objections in sequence file

      //ToDo :: Implement here

      // phase.drop_objection(this);
   endtask

   virtual function void report_phase(uvm_phase phase);
      super.report_phase(phase);

      //ToDo :: Implement here

   endfunction

endclass: lvc_ahb_master_agent
 
`endif // LVC_AHB_MASTER_AGENT__SV

