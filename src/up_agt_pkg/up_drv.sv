`ifndef up_DRV__SV
`define up_DRV__SV

class up_drv extends uvm_driver #(up_item);

   `uvm_component_utils(up_drv)
   
   extern function new(string name = "up_drv",
                       uvm_component parent = null); 

   extern virtual task run_phase(uvm_phase phase);
   extern protected virtual task tx_driver();

endclass: up_drv


function up_drv::new(string name = "up_drv", uvm_component parent = null);
   super.new(name, parent);
endfunction: new


task up_drv::run_phase(uvm_phase phase);
   super.run_phase(phase);
   fork 
      tx_driver();
   join
endtask: run_phase


task up_drv::tx_driver();
 forever begin
      // ToDo: Set output signals to their idle state
      `uvm_info("TX_DRIVER", "Starting transaction...",UVM_LOW)
      seq_item_port.get_next_item(req);
      #10;
      // case (tr.kind) 
      //    up_item::READ: begin
      //       // ToDo: Implement READ transaction

      //    end
      //    up_item::WRITE: begin
      //       // ToDo: Implement WRITE transaction

      //    end
      // endcase
      seq_item_port.item_done();
      `uvm_info("TX_DRIVER", "Completed transaction...",UVM_LOW)
      `uvm_info("TX_DRIVER", req.sprint(),UVM_HIGH)

   end
endtask : tx_driver



`endif // up_drv__SV
