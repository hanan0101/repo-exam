module real_time_counter #(
    parameter N = 10,
    localparam n = $clog2(N)
)(
    input logic clk, 
    input logic reset_n, 
    input logic en, 
    output logic [ n - 1 : 0] count
);

    logic div_clk;
    clock_divider clk_div_inst(
        .*
    );

    mod_N_counter #(
            .N(N)
        ) mnc_inst (
            .clk(div_clk),
            .reset_n(reset_n),
            .load(0),
            .en(en),
            .load_data(),
            .count(count)
        );


endmodule : real_time_counter