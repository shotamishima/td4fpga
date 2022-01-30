module alu(dat_in, imdata, dat_out, carry_flag);
    input [3:0] dat_in;
    input [3:0] imdata;
    output [3:0] dat_out;
    output carry_flag;

    wire [4:0] result;
    assign  result = dat_in + imdata;
    assign dat_out = result[3:0];
    assign carry_flag = result[4];

endmodule
