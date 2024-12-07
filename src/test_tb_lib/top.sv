
`ifndef TB__SV
`define TB__SV
module top();
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    // import typical_test_pkg::*;

    // Clock Generation
    realtime period = 10;
    reg clk = 1'b0;
    always #(period/2) clk = ~clk;

    // Reset Delay Parameter
    realtime rst_delay = 50;
    reg rst_n = 1'b0;
    initial #(rst_delay) rst_n = 1'b1;

    initial begin
        run_test("base_test");
    end

endmodule : top

`endif // TB__SV