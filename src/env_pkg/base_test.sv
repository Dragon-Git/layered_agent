`ifndef BASE_TEST__SV
`define BASE_TEST__SV

class base_test extends uvm_test;

  `uvm_component_utils(base_test)

  base_env env;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = base_env::type_id::create("env", this);
  endfunction

  virtual task main_phase(uvm_phase phase);
    uvm_status_e      status;

    super.main_phase(phase);
    phase.raise_objection(this);
    `uvm_info(get_full_name(), "write begin", UVM_LOW)
    // env.regmodel.ctrl_reg.write(status, 32'hFFFFFFFF);
    `uvm_info(get_full_name(), "write end", UVM_LOW)

    phase.drop_objection(this);
  endtask: main_phase

endclass : base_test
`endif //BASE_TEST__SV
