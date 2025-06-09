//
// Template for Top module
//

`ifndef LVC_AHB_SYSTEM_ENV_TOP__SV
`define LVC_AHB_SYSTEM_ENV_TOP__SV

module lvc_ahb_system_env_top();

   logic clk;
   logic rst;

   // Clock Generation
   parameter sim_cycle = 10;
   
   // Reset Delay Parameter
   parameter rst_delay = 50;

   always 
      begin
         #(sim_cycle/2) clk = ~clk;
      end

   lvc_ahb_master_if mst_if(clk,rst);
   lvc_ahb_slave_if slv_if(clk,rst);
   
   lvc_ahb_system_env_tb_mod test(); 
   
   // ToDo: Include Dut instance here
  
   //Driver reset depending on rst_delay
   initial
      begin
         clk = 0;
         rst = 0;
      #1 rst = 1;
         repeat (rst_delay) @(clk);
         rst = 1'b0;
         @(clk);
   end

endmodule: lvc_ahb_system_env_top

`endif // LVC_AHB_SYSTEM_ENV_TOP__SV
