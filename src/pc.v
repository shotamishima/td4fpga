module pc(clk, rst, load, data_in, q);
    input clk, rst;
    input [3:0] data_in;
    input load;
    output [3:0] q;

    reg [3:0] register = 4'b0000;

    always @(posedge clk) begin
        if (rst) begin
            register <= 4'b0000;
        end else if (load == 0) begin
            register <= register;
        end else begin
            register <= register + 1;
        end
    end
    assign q = register;
endmodule

