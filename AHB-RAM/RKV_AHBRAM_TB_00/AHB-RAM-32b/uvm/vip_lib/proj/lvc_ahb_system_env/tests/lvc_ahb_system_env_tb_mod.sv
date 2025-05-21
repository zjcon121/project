//
// Template for UVM-compliant Program block

`ifndef LVC_AHB_SYSTEM_ENV_TB_MOD__SV
`define LVC_AHB_SYSTEM_ENV_TB_MOD__SV

`include "mstr_slv_intfs.incl"
module lvc_ahb_system_env_tb_mod;

import uvm_pkg::*;

`include "lvc_ahb_system_env_env.sv"
`include "lvc_ahb_system_env_test.sv"  //ToDo: Change this name to the testcase file-name

// ToDo: Include all other test list here
   typedef virtual lvc_ahb_master_if v_if1;
   typedef virtual lvc_ahb_slave_if v_if2;
   initial begin
      uvm_config_db #(v_if1)::set(null,"","mst_if",lvc_ahb_system_env_top.mst_if); 
      uvm_config_db #(v_if2)::set(null,"","slv_if",lvc_ahb_system_env_top.slv_if);
      run_test();
   end

endmodule: lvc_ahb_system_env_tb_mod

`endif // LVC_AHB_SYSTEM_ENV_TB_MOD__SV

