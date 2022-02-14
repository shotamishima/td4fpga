module cpu(clk, rst, inp, outp);

    input clk, rst;
    input [3:0] inp;
    output [3:0] outp;

    /* fetch */
    wire [3:0] addr;
    wire [7:0] op;
    wire [3:0] opcode, im;

    /* decode */
    reg cflag;
    wire cflag_r; // for assign in alu module
    wire [1:0] sel;
    wire [3:0] ld;
    
    /* execute */
    wire [3:0] a;
    wire [3:0] ch0, ch1, ch2, ch3;
    assign ch3 = 4'b0000; // nothing to do

    wire [3:0] alu_out;
    assign outp = ch2;

    /* FETCH */
    pc program_counter(
        .clk(clk),
        .rst(rst),
        .load(ld[3]),
        .data_in(alu_out),
        .q(addr)
    );

    rom rom(.addr(addr), .out(op));

    assign {opcode, im} = op;

    /* DECODE */
    decoder decoder(
        .op(opcode),
        .carry_flag(cflag),
        .sel(sel),
        .load(ld)
    );
    
    /* EXECUTE */
    register register_a(
        .clk(clk),
        .rst(rst),
        .load(ld[0]),
        .dat_in(alu_out),
        .dat_out(ch0)
    );
    register register_b(
        .clk(clk),
        .rst(rst),
        .load(ld[1]),
        .dat_in(alu_out),
        .dat_out(ch1)
    );
    register output_port(
        .clk(clk),
        .rst(rst),
        .load(ld[2]),
        .dat_in(alu_out),
        .dat_out(outp)
    );
    data_selector data_selector(
        .c0(ch0),
        .c1(ch1),
        .c2(inp),
        .c3(ch3),
        .sel(sel),
        .y(a)
    );
    alu alu(
        .dat_in(a),
        .imdata(im),
        .dat_out(alu_out),
        .carry_flag(cflag_r)
    );

    always @(posedge clk or rst) begin
        if (rst) begin
            cflag = 1'b0;
        end else begin
            cflag = cflag_r;
        end
    end
endmodule
 