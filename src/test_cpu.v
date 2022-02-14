`timescale 1ns/100ps

module top;
    localparam step = 20; // duration of clock

    reg clk, rst;
    reg [3:0] inp;
    wire [3:0] outp;

    cpu cpu_instance(.clk(clk), .rst(rst), .inp(inp), .outp(outp));

    initial begin
        $dumpfile("test_cpu.vcd");
        $dumpvars(0, cpu_instance);
        
        /* finish after 5us */
        #5000 $finish;
    end
    
    always begin
        clk = 1'b0;
        #step;
        clk = 1'b1;
        #step;
    end
endmodule