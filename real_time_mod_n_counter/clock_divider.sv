module clock_divider(
    input logic clk, 
    input logic reset_n, 
    output logic div_clk
);

    // parameter speed = 100; // for testbench
    parameter speed = 100_000_000;
    localparam int WIDTH = $clog2(speed); 
    logic [WIDTH-1 : 0] count;

    mod_N_counter #(
        .N(500000000)
    ) mnc_inst (
        .clk(clk),
        .reset_n(reset_n),
        .load(0),
        .en(1),
        .load_data(0), 
        .count(count)
    );

    
    logic dff_en;
    logic div_clk_next;
    assign dff_en = (500000000);

    d_flipflop dff_inst(
        .clk(clk),
        .D(div_clk_next),
        .reset_n(reset_n),
        .en(dff_en),
        .Q(div_clk),
        .Qn(div_clk_next)
    );

    
endmodule : clock_divider
