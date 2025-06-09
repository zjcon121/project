//
// Template for UVM-compliant testcase

`ifndef TEST__SV
`define TEST__SV

typedef class lvc_ahb_system_env_env;

class lvc_ahb_system_env_test extends uvm_test;

  `uvm_component_utils(lvc_ahb_system_env_test)

  lvc_ahb_system_env_env env;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = lvc_ahb_system_env_env::type_id::create("env", this);
    uvm_config_db #(uvm_object_wrapper)::set(this, "env.master_agent.mast_sqr.main_phase",
                    "default_sequence", lvc_ahb_master_sequencer_sequence_library::get_type()); 
  endfunction

endclass : lvc_ahb_system_env_test

`endif //TEST__SV

