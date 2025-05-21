//
// Template for UVM-compliant verification environment
//

`ifndef LVC_AHB_SYSTEM_ENV_ENV__SV
`define LVC_AHB_SYSTEM_ENV_ENV__SV
`include "lvc_ahb_system_env.sv"
//ToDo: Include required files here
//Including all the required component files here
class lvc_ahb_system_env_env extends uvm_env;
   lvc_ahb_master_agent master_agent;
   lvc_ahb_slave_agent slave_agent;
   lvc_ahb_system_env_cov cov;
   
   lvc_ahb_master_monitor_2cov_connect mon2cov;


    `uvm_component_utils(lvc_ahb_system_env_env)

   extern function new(string name="lvc_ahb_system_env_env", uvm_component parent=null);
   extern virtual function void build_phase(uvm_phase phase);
   extern virtual function void connect_phase(uvm_phase phase);
   extern function void start_of_simulation_phase(uvm_phase phase);
   extern virtual task reset_phase(uvm_phase phase);
   extern virtual task configure_phase(uvm_phase phase);
   extern virtual task run_phase(uvm_phase phase);
   extern virtual function void report_phase(uvm_phase phase);
   extern virtual task shutdown_phase(uvm_phase phase);

endclass: lvc_ahb_system_env_env

function lvc_ahb_system_env_env::new(string name= "lvc_ahb_system_env_env",uvm_component parent=null);
   super.new(name,parent);
endfunction:new

function void lvc_ahb_system_env_env::build_phase(uvm_phase phase);
   super.build_phase(phase);
   master_agent = lvc_ahb_master_agent::type_id::create("master_agent",this); 
   slave_agent = lvc_ahb_slave_agent::type_id::create("slave_agent",this);
 
   //ToDo: Register other components,callbacks and TLM ports if added by user  

   cov = lvc_ahb_system_env_cov::type_id::create("cov",this); //Instantiating the coverage class

   mon2cov  = lvc_ahb_master_monitor_2cov_connect::type_id::create("mon2cov", this);
   mon2cov.cov = cov;
   // ToDo: To enable backdoor access specify the HDL path
   // ToDo: Register any required callbacks
endfunction: build_phase

function void lvc_ahb_system_env_env::connect_phase(uvm_phase phase);
   super.connect_phase(phase);
   master_agent.mast_mon.mon_analysis_port.connect(cov.cov_export);
endfunction: connect_phase

function void lvc_ahb_system_env_env::start_of_simulation_phase(uvm_phase phase);
   super.start_of_simulation_phase(phase);
   `ifdef UVM_VERSION_1_0
   uvm_top.print_topology();  
   factory.print();          
   `endif
   
   `ifdef UVM_VERSION_1_1
	uvm_root::get().print_topology(); 
    uvm_factory::get().print();      
   `endif

   `ifdef UVM_POST_VERSION_1_1
	uvm_root::get().print_topology(); 
    uvm_factory::get().print();      
   `endif

   //ToDo : Implement this phase here 
endfunction: start_of_simulation_phase


task lvc_ahb_system_env_env::reset_phase(uvm_phase phase);
   super.reset_phase(phase);
   //ToDo: Reset DUT
endtask:reset_phase

task lvc_ahb_system_env_env::configure_phase (uvm_phase phase);
   super.configure_phase(phase);
   //ToDo: Configure components here
endtask:configure_phase

task lvc_ahb_system_env_env::run_phase(uvm_phase phase);
   super.run_phase(phase);
   //ToDo: Run your simulation here
endtask:run_phase

function void lvc_ahb_system_env_env::report_phase(uvm_phase phase);
   super.report_phase(phase);
   //ToDo: Implement this phase here
endfunction:report_phase

task lvc_ahb_system_env_env::shutdown_phase(uvm_phase phase);
   super.shutdown_phase(phase);
   //ToDo: Implement this phase here
endtask:shutdown_phase
`endif // LVC_AHB_SYSTEM_ENV_ENV__SV

