module n_bit_register#(
    parameter n = 8
)(
    input logic clk,
    input logic reset_n,
    input logic en,
    input logic [n-1 : 0] data_i,
    output logic [n-1 : 0] data_o
);

genvar i;

generate
    for(i = 0; i < n; i = i+1) 
    begin : gen_loop
        d_flipflop dff(
            .clk(clk),
            .D(data_i[i]),
            .reset_n(reset_n),
            .en(en),
            .Q(data_o[i]),
            .Qn());
    end
endgenerate

endmodule : n_bit_register