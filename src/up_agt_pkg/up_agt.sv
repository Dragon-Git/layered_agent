`ifndef up_agt__SV
`define up_agt__SV

class up_agt extends uvm_agent;
    // ToDo: add sub environmnet properties here
    up_drv drv;
    up_sqr sqr;

    `uvm_component_utils(up_agt)

    function new(string name = "up_agt", uvm_component parent = null);
        super.new(name, parent);
    endfunction: new

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        sqr = up_sqr::type_id::create("sqr", this);
        drv = up_drv::type_id::create("drv", this);
    endfunction: build_phase

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        drv.seq_item_port.connect(sqr.seq_item_export);
    endfunction: connect_phase

endclass:up_agt

`endif // up_agt__SV
