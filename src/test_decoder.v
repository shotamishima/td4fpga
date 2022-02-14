`timescale 1ns/100ps

module top;
    parameter STEP = 10;

    /* decodder module port */
    reg [7:0] op;
    reg carry_flag;
    wire [1:0] sel;
    wire [3:0] load;

    decoder decoder_instance(.op(op), .carry_flag(carry_flag), .sel(sel), .load(load));

    reg clk;

    initial begin
        $dumpfile("test_decoder.vcd");
        $dumpvars(0, decoder_instance);

        carry_flag <= 0;
        op <= 8'h0f;
        
        /* finish after 5 micro sec */
        #5000 $finish;
    end

    always begin
        clk = 1'b1;
        #20;
        clk = 1'b0;
        #20;
    end
    
    always @(posedge clk) begin
        op <= op + 8'h10;
        $display("op: %b sel: %b load: %b", op, sel, load);
    end
    /* initial begin */
    /*     $dumpfile("test_decoder.vcd"); */
    /*     $dumpvars(0, decoder_instance); */
        
    /*     carry_flag <= 0; */
    /*     op <= 8'b00110011; */
    /* #STEP */ 
    /*     $display("op: %b, sel: %b, load: %b", op, sel, load); */
    /* end */
endmodule
    