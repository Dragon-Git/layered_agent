`ifndef base_env_SV
`define base_env_SV
class base_env extends uvm_env;

    up_agt m_up_agt;
    uvm_sequencer #(uvm_reg_item, uvm_reg_item) m_reg_sqr;
    reg_adapter_sequence ral_seq;
    empty_reg_block regmodel;
    `uvm_component_utils(base_env)

    extern function new(string name= "base_env", uvm_component parent=null);
    extern virtual function void build_phase(uvm_phase phase);
    extern virtual function void connect_phase(uvm_phase phase);
    extern virtual task run_phase(uvm_phase phase);

endclass: base_env

function base_env::new(string name= "base_env",uvm_component parent=null);
    super.new(name,parent);
endfunction:new

function void base_env::build_phase(uvm_phase phase);
    super.build_phase(phase);
    m_up_agt = up_agt::type_id::create("m_up_agt",this);
    m_reg_sqr = uvm_sequencer #(uvm_reg_item, uvm_reg_item)::type_id::create("sqr", this);
    regmodel = empty_reg_block::type_id::create("regmodel",this);
    regmodel.build();
    regmodel.lock_model();
    ral_seq = reg_adapter_sequence::type_id::create("ral_sequence");


endfunction: build_phase

function void base_env::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    regmodel.default_map.set_sequencer(m_reg_sqr,null);
    ral_seq.reg_seqr = m_reg_sqr;

endfunction: connect_phase

task base_env::run_phase(uvm_phase phase);
    ral_seq.start(m_up_agt.sqr);
endtask

`endif // base_env_SV