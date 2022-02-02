`timescale 1ns/100ps

module top();
    reg CLK, RST;
    reg [3:0] DATA_IN;
    wire [3:0] Q;

    pc pc_instance(
        .clk(CLK),
        .reset(RST),
        .data_in(DATA_IN),
        .q(Q)
    );
    
    initial begin
        CLK = 0;
        forever #10 CLK = ~CLK;
    end

    initial begin
        #500 $finish();
    end

    initial begin
            RST = 0;
        #50 RST = 1;
        #50 RST = 0;
    end

    always @(posedge CLK) begin
        $write("[%t] counter: %b\n", $time, Q);
    end

    initial begin
        $dumpfile("test_pc.vcd");
        $dumpvars(0, pc_instance);
    end
endmodule
