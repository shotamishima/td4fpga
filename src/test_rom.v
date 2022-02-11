`timescale 1ns/100ps

module top();
    parameter STEP = 10;

    reg [3:0] addr;
    wire [7:0] out;

    rom rom_instance(.addr(addr), .out(out));

    initial begin
        $dumpfile("test_rom.vcd");
        $dumpvars(0, rom_instance);

        addr <= 4'b0000;
    #STEP
        $display("addr: %b, out: %b", addr, out);
        addr <= 4'b0001;
    #STEP
        $display("addr: %b, out: %b", addr, out);
    end
endmodule

