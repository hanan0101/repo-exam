module n_bit_counter#(
    parameter n = 7
)(
    input logic clk,
    input logic reset_n,
    input logic clear, 
    input logic load,
    input logic en,
    input logic [n-1:0] load_data,
    output logic [n-1:0] count
);

    logic reg_wen;
    n_bit_register #(
        .n(n)
    ) n_bit_counter_inst (
        .clk(clk),
        .reset_n(reset_n),
        .data_i(next_count),
        .en(reg_wen),
        .data_o(count)
    );

    // next_count logic here
    assign reg_wen = en | load;
    assign next_count = load ? load_data : (count + 1);

endmodule : n_bit_counter



