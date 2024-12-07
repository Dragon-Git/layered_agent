`ifndef up_SQR__SV
`define up_SQR__SV

typedef class up_item;
class up_sqr extends uvm_sequencer #(up_item, up_item);

   `uvm_component_utils(up_sqr)
   function new (string name, uvm_component parent);
      super.new(name,parent);
   endfunction:new

endclass:up_sqr

`endif // up_SQR__SV
