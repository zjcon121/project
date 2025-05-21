//
// Template for UVM-compliant physical-level transactor
//

`ifndef LVC_AHB_SLAVE_DRIVER__SV
`define LVC_AHB_SLAVE_DRIVER__SV

typedef class lvc_ahb_master_transaction;
typedef class lvc_ahb_slave_driver;

class lvc_ahb_slave_driver_callbacks extends uvm_callback;

   // ToDo: Add additional relevant callbacks
   // ToDo: Use "task" if callbacks cannot be blocking

   // Called before a transaction is executed
   virtual task pre_tx( lvc_ahb_slave_driver xactor,
                        lvc_ahb_master_transaction tr);
                                   
     // ToDo: Add relevant code

   endtask: pre_tx


   // Called after a transaction has been executed
   virtual task post_tx( lvc_ahb_slave_driver xactor,
                         lvc_ahb_master_transaction tr);
     // ToDo: Add relevant code

   endtask: post_tx

endclass: lvc_ahb_slave_driver_callbacks


class lvc_ahb_slave_driver extends uvm_driver # (lvc_ahb_master_transaction);

   
   typedef virtual lvc_ahb_slave_if v_if; 
   v_if drv_if;
   `uvm_register_cb(lvc_ahb_slave_driver,lvc_ahb_slave_driver_callbacks); 
   
   extern function new(string name = "lvc_ahb_slave_driver",
                       uvm_component parent = null); 
 
      `uvm_component_utils_begin(lvc_ahb_slave_driver)
      // ToDo: Add uvm driver member
      `uvm_component_utils_end
   // ToDo: Add required short hand override method


   extern virtual function void build_phase(uvm_phase phase);
   extern virtual function void end_of_elaboration_phase(uvm_phase phase);
   extern virtual function void start_of_simulation_phase(uvm_phase phase);
   extern virtual function void connect_phase(uvm_phase phase);
   extern virtual task reset_phase(uvm_phase phase);
   extern virtual task configure_phase(uvm_phase phase);
   extern virtual task run_phase(uvm_phase phase);
   extern protected virtual task send(lvc_ahb_master_transaction tr); 
   extern protected virtual task tx_driver();

endclass: lvc_ahb_slave_driver


function lvc_ahb_slave_driver::new(string name = "lvc_ahb_slave_driver",
                   uvm_component parent = null);
   super.new(name, parent);

   
endfunction: new


function void lvc_ahb_slave_driver::build_phase(uvm_phase phase);
   super.build_phase(phase);
   //ToDo : Implement this phase here

endfunction: build_phase

function void lvc_ahb_slave_driver::connect_phase(uvm_phase phase);
   super.connect_phase(phase);
   uvm_config_db#(v_if)::get(this, "", "slv_if", drv_if);
endfunction: connect_phase

function void lvc_ahb_slave_driver::end_of_elaboration_phase(uvm_phase phase);
   super.end_of_elaboration_phase(phase);
   if (drv_if == null)
       `uvm_fatal("NO_CONN", "Virtual port not connected to the actual interface instance");   
endfunction: end_of_elaboration_phase

function void lvc_ahb_slave_driver::start_of_simulation_phase(uvm_phase phase);
   super.start_of_simulation_phase(phase);
   //ToDo: Implement this phase here
endfunction: start_of_simulation_phase

 
task lvc_ahb_slave_driver::reset_phase(uvm_phase phase);
   super.reset_phase(phase);
   // ToDo: Reset output signals
endtask: reset_phase

task lvc_ahb_slave_driver::configure_phase(uvm_phase phase);
   super.configure_phase(phase);
   //ToDo: Configure your component here
endtask:configure_phase


task lvc_ahb_slave_driver::run_phase(uvm_phase phase);
   super.run_phase(phase);
   // phase.raise_objection(this,""); //Raise/drop objections in sequence file
   fork 
      tx_driver();
   join
   // phase.drop_objection(this);
endtask: run_phase


task lvc_ahb_slave_driver::tx_driver();
 forever begin
      lvc_ahb_master_transaction tr;
      // ToDo: Set output signals to their idle state
      this.drv_if.master.async_en      <= 0;
      `uvm_info("lvc_ahb_system_env_DRIVER", "Starting transaction...",UVM_LOW)
      seq_item_port.get_next_item(tr);
      case (tr.kind) 
         lvc_ahb_master_transaction::READ: begin
            // ToDo: Implement READ transaction

         end
         lvc_ahb_master_transaction::WRITE: begin
            // ToDo: Implement READ transaction

         end
      endcase
	  `uvm_do_callbacks(lvc_ahb_slave_driver,lvc_ahb_slave_driver_callbacks,
                    pre_tx(this, tr))
      send(tr); 
      seq_item_port.item_done();
      `uvm_info("lvc_ahb_system_env_DRIVER", "Completed transaction...",UVM_LOW)
      `uvm_info("lvc_ahb_system_env_DRIVER", tr.sprint(),UVM_HIGH)
      `uvm_do_callbacks(lvc_ahb_slave_driver,lvc_ahb_slave_driver_callbacks,
                    post_tx(this, tr))

   end
endtask : tx_driver

task lvc_ahb_slave_driver::send(lvc_ahb_master_transaction tr);
   // ToDo: Drive signal on interface
  
endtask: send


`endif // LVC_AHB_SLAVE_DRIVER__SV


