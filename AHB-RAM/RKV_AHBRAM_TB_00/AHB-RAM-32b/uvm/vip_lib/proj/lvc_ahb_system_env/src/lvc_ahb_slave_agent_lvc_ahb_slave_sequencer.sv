//
// Template for UVM-compliant sequencer class
//


`ifndef LVC_AHB_SLAVE_SEQUENCER__SV
`define LVC_AHB_SLAVE_SEQUENCER__SV


typedef class lvc_ahb_master_transaction;
class lvc_ahb_slave_sequencer extends uvm_sequencer # (lvc_ahb_master_transaction);

   `uvm_component_utils(lvc_ahb_slave_sequencer)
   function new (string name,
                 uvm_component parent);
   super.new(name,parent);
   endfunction:new 
endclass:lvc_ahb_slave_sequencer

`endif // LVC_AHB_SLAVE_SEQUENCER__SV
