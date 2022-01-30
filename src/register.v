module register(clk, rst, load, dat_in, dat_out);
    input clk;
    input rst;
    input load;
    input [3:0] dat_in;
    output [3:0] dat_out; //TODO

    reg [3:0] register;

    always @(posedge clk) begin
        if (rst) begin
            register <= 4'b0000;
        end else if (load) begin
            register <= dat_in;
        end
    end

    assign dat_out = register;
    
endmodule
