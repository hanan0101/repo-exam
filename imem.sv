module imem#(
    parameter n = 4
)(
    input wire [3:0] addr,
    output wire [7:0] inst
);
    wire [7:0] imem[0:1<<n - 1];

    assign inst = imem[addr];
endmodule : imem