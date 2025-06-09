//
// Template for UVM-compliant verification environment
//

`ifndef LVC_AHB_SYSTEM_ENV__SV
`define LVC_AHB_SYSTEM_ENV__SV




`include "mstr_slv_src.incl"

`include "lvc_ahb_system_env_cfg.sv"



`include "lvc_ahb_system_env_cov.sv"

`include "mon_2cov.sv"


// ToDo: Add additional required `include directives

`endif // LVC_AHB_SYSTEM_ENV__SV
