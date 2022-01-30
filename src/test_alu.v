`timescale 1ns/10ps
module top();
    parameter STEP = 10; // 10ns

    reg [3:0] DAT_IN, IM;
    wire [3:0] DAT_OUT;
    wire CARRY_FLAG;

    alu alu_instance(
        .dat_in(DAT_IN),
        .imdata(IM),
        .dat_out(DAT_OUT),
        .carry_flag(CARRY_FLAG)
    );

    initial begin
        $dumpfile("test_alu.vcd");
        $dumpvars(0, alu_instance);

        DAT_IN <= 4'b0001;
        IM <= 4'b0001;
    #STEP
        $display("DAT_IN:%b, IM:%b, DAT_OUT:%b, CARRY_FLAG:%b", DAT_IN, IM, DAT_OUT, CARRY_FLAG);
        IM <= 4'b1110;
    #STEP
        $display("DAT_IN:%b, IM:%b, DAT_OUT:%b, CARRY_FLAG:%b", DAT_IN, IM, DAT_OUT, CARRY_FLAG);
        IM <= 4'b1111;
    #STEP
        $display("DAT_IN:%b, IM:%b, DAT_OUT:%b, CARRY_FLAG:%b", DAT_IN, IM, DAT_OUT, CARRY_FLAG);
    end
endmodule
