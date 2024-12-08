`ifndef up_ITEM__SV
`define up_ITEM__SV

class up_item extends uvm_sequence_item;

   rand int kind;
   rand int status;
   rand bit [31:0] data;

   // ToDo: Add constraint blocks to prevent error injection
   // ToDo: Add relevant class properties to define all transactions
   // ToDo: Modify/add symbolic transaction identifiers to match

   constraint up_item_valid {
      // ToDo: Define constraint to make descriptor valid
      status == 1;
   }
    
   `uvm_object_utils_begin(up_item) 

      // ToDo: add properties using macros here
   
      `uvm_field_int(kind,UVM_ALL_ON)
      `uvm_field_int(status, UVM_ALL_ON)
      `uvm_field_int(data, UVM_ALL_ON)
   `uvm_object_utils_end
 
   function new(string name = "up_item");
      super.new(name);
   endfunction: new

endclass: up_item

`endif // up_ITEM__SV
