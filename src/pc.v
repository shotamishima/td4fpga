module pc(clk, reset, data_in, q);
    input clk, reset;
    input [3:0] data_in;
    output [3:0] q;

    reg [3:0] register = 4'b0000;

    always @(posedge clk) begin
        if (reset) begin
            register <= 4'b0000;
        end else begin
            register <= register + 1;
        end
    end
    assign q = register;
endmodule

