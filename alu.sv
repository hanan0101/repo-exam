module alu(
    input wire clk,
    input wire opcode,
    input wire [3:0]a,
    input wire [3:0]b,

    output wire [3:0] out,
    output reg carry
);
    wire [5:0] temp_out;
    assign temp_out = opcode ? (a-b) : (a+b);

    assign out = temp_out[3:0];
    always_ff @(posedge clk)
    begin
        carry = temp_out[4];
    end
    
endmodule : alu