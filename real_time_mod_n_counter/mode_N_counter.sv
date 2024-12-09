module mod_N_counter#(
    parameter N = 10,
    parameter n = $clog2(N)
)(
    input logic clk, 
    input logic reset_n, 
    input logic load, 
    input logic en, 
    input logic [ n - 1 : 0] load_data,
    output logic [ n - 1 : 0] count
);

    assign clear = ~(count == (N - 1)); // Active-low reset

    n_bit_counter #(
        .n(n)
    ) nbc (
        .clk(clk),
        .reset_n(reset_n),
        .clear(clear)
        .load(load),
        .en(en),
        .load_data(load_data),
        .count(count)
    );
    
endmodule : mod_N_counter