module decoder(op, carry_flag, sel, load);
    input wire [7:0] op;
    input wire carry_flag;
    // sel: select input channl to ALU
    // 00: Ch0(register a), 10: Ch1(register b), 01: Ch2(input port), 11: Ch3(4'b0000)
    output reg [1:0] sel; 
    // load: select the destination to load alu operation result
    // {pc, output port, register b, register a}
    output reg [3:0] load;

    wire [3:0] opcode, im;

    // separate opcode and imidiate data
    assign {opcode, im} = op;

    // process for data selector
    always @(opcode) begin 
        case (opcode)
        4'b0011: load = 4'b1110; // MOV A. Im
        4'b0111: load = 4'b1101; // MOV B, Im
        4'b0001: load = 4'b1110; // MOV A, B
        4'b0100: load = 4'b1101; // MOV B, A
        4'b0000: load = 4'b1110; // ADD A, Im
        4'b0101: load = 4'b1101; // ADD B, Im
        4'b0010: load = 4'b1110; // IN A
        4'b0110: load = 4'b1101; // IN B
        4'b1011: load = 4'b1011; // OUT Im
        4'b1001: load = 4'b1011; // OUT B
        4'b1111: load = 4'b0111; // JMP Im
        4'b1110: if(carry_flag == 0) begin
                     load = 4'b0111;
                 end
                 else begin
                     load = 4'b1111;
                 end
        endcase
    end

    always @(opcode) begin
        case (opcode)
        4'b0011: sel = 2'b11; // MOV A. Im
        4'b0111: sel = 2'b11; // MOV B, Im
        4'b0001: sel = 2'b10; // MOV A, B
        4'b0100: sel = 2'b00; // MOV B, A
        4'b0000: sel = 2'b00; // ADD A, Im
        4'b0101: sel = 2'b10; // ADD B, Im
        4'b0010: sel = 2'b01; // IN A
        4'b0110: sel = 2'b01; // IN B
        4'b1011: sel = 2'b11; // OUT Im
        4'b1001: sel = 2'b10; // OUT B
        4'b1111: sel = 2'b11; // JMP Im
        4'b1110: if(carry_flag == 0) begin
                    sel = 2'b11;
                 end 
                 else begin
                    sel = 2'bxx;
                 end
        endcase
    end

endmodule