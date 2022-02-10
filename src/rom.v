module(addr, out);
    input wire [3:0] addr;
    output reg [7:0] out;

    always @(addr) begin
        case (addr)
        4'b0000: out = 8'b00110001; // MOV A, 1
        4'b0001: out = 8'b01110010; // MOV B, 2
        4'b0010: out = 8'b00010000; // MOV A, B
        4'b0011: out = 8'b01000000; // MOV B, A
        4'b0100: out = 8'b00000011; // ADD A, 3
        4'b0101: out = 8'b01010100; // ADD B, 4
        4'b0110: out = 8'b00100000; // IN A
        4'b0111: out = 8'b01100000; // IN B
        4'b1000: out = 8'b10110101; // OUT 5
        4'b1001: out = 8'b10010000; // OUT B
        4'b1010: out = 8'b11110110; // JMP 6
        4'b1011: out = 8'b11100111; // JNC 7
        endcase
    end
endmodule