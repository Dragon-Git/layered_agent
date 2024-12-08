class reg_adapter extends uvm_reg_adapter;
  `uvm_object_utils(reg_adapter)

  function new(string name="reg_adapter");
    super.new(name);

  endfunction

  virtual function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
    reg_item tr = reg_item::type_id::create("reg_item");
    tr.kind = rw.kind;
    tr.addr = rw.addr;
    tr.data = rw.data;
    return tr;
  endfunction

  virtual function void bus2reg(uvm_sequence_item bus_item,
                                ref uvm_reg_bus_op rw);
    reg_item tr;
    if (!$cast(tr,bus_item)) begin
      `uvm_fatal("CONVERT_tr2REG","Bus item is not of type ureg_item")
    end
    rw.kind = tr.kind;
    rw.addr = tr.addr;
    rw.data = tr.data;
    rw.status = UVM_IS_OK;
  endfunction

endclass