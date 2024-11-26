module mux2x1#(
    parameter n =4
)(
    input wire [n-1:0] in1,
    input wire [n-1:0] in2,
    input wire sel,
    output wire [n-1:0] out

);

    assign out = sel? in2 : in1;

endmodule : mux2x1