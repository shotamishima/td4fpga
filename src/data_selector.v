module data_selector(c0, c1, c2, c3, sel, y);
    input wire [1:0] sel;
    input wire [3:0] c0, c1, c2, c3; 
    output reg [3:0] y;
    
    always @(sel or c0 or c1 or c2 or c3) begin
        case (sel)
        2'b00: y = c0;
        2'b01: y = c1;
        2'b10: y = c2;
        2'b11: y = c3;
        endcase
    end
endmodule
  