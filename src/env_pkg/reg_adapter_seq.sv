class reg_adapter_sequence  extends uvm_reg_sequence#(uvm_sequence #(uvm_reg_item));

  `uvm_object_utils(reg_adapter_sequence)

  function new (string name="uvm_reg_sequence_inst");
    super.new(name);
  endfunction

  virtual task do_reg_item(uvm_reg_item rw);
     string rws=rw.convert2string();
    up_item tr;
    reg_item rg;
    tr = up_item::type_id::create("tr"); 
    $cast(rg, rw);
    if (m_sequencer == null)
     `uvm_fatal("REG/DO_ITEM/NULL","do_reg_item: m_sequencer is null") 

    `uvm_info("DO_RW_ACCESS",{"Doing transaction: ",rws},UVM_HIGH)

    if (rw.kind == UVM_WRITE) begin
      tr.data = rg.addr;
      start_item(tr);
      finish_item(tr);
      tr.data = rg.data;
      start_item(tr);
      finish_item(tr);
    end else begin
      start_item(tr);
      finish_item(tr);
      start_item(tr);
      finish_item(tr);
    end
  endtask
endclass
