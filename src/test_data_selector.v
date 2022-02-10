`timescale 1ns/100ps

module top();
    parameter STEP = 10;

    reg [1:0] SEL;
    reg [3:0] C0, C1, C2, C3;
    wire [3:0] Y;
    
    data_selector data_selector_instance(
        .sel(SEL),
        .c0(C0),
        .c1(C1),
        .c2(C2),
        .c3(C3),
        .y(Y)
    );
    
    initial begin
        $dumpfile("test_data_selector.vcd");
        $dumpvars(0, data_selector_instance);
        
        C0 <= 4'b0001;
        C1 <= 4'b0010;
        C2 <= 4'b0011;
        C3 <= 4'b0100;
    #STEP
        SEL <= 2'b00;
    #STEP
        $display("output y: %b", Y);
        SEL <= 2'b01;
    #STEP
        $display("output y: %b", Y);
        SEL <= 2'b10;
    #STEP
        $display("output y: %b", Y);
        SEL <= 2'b11;
    #STEP
        $display("output y: %b", Y);
    end
endmodule