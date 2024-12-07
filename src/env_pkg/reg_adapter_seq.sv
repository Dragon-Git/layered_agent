class reg_adapter_sequence  extends uvm_reg_sequence#();

  `uvm_object_utils(reg_adapter_sequence)

  function new (string name="uvm_reg_sequence_inst");
    super.new(name);
  endfunction

  virtual task do_reg_item(uvm_reg_item rw);
     string rws=rw.convert2string();
    up_item tr;
    tr = up_item::type_id_create("tr"); 
    if (m_sequencer == null)
     `uvm_fatal("REG/DO_ITEM/NULL","do_reg_item: m_sequencer is null") 
    if (adapter == null)
     `uvm_fatal("REG/DO_ITEM/NULL","do_reg_item: adapter handle is null") 

    `uvm_info("DO_RW_ACCESS",{"Doing transaction: ",rws},UVM_LOW)

    if (rw.kind == UVM_WRITE) begin
      start_item(tr);
      finish_item(tr);
    end else begin
      start_item(tr);
      finish_item(tr);
    end
    #1;
  endtask
endclass
