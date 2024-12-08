`ifndef reg_item__SV
`define reg_item__SV

class reg_item extends uvm_reg_item;

   rand bit [31:0] addr;
   rand bit [31:0] data;

   `uvm_object_utils_begin(reg_item) 
      `uvm_field_int(addr, UVM_ALL_ON)
      `uvm_field_int(data, UVM_ALL_ON)
   `uvm_object_utils_end
 
   function new(string name = "reg_item");
      super.new(name);
   endfunction: new

endclass: reg_item

`endif // reg_item__SV
