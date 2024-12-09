module counter(
    input logic clk,
    input logic reset_n,
    input logic load,
    input logic [3:0] load_data,
    output logic [3:0] count
);

        logic dff0_data_i;
        logic dff1_data_i;
        logic dff2_data_i;
        logic dff3_data_i;

        logic dff0_reset_n;
        logic dff1_reset_n;
        logic dff2_reset_n;
        logic dff3_reset_n;

        mux2x1 mux_inst0(load, ~count[0], load_data[0], dff0_data_i);
        mux2x1 mux_inst1(load, count[0] ^ count[1], load_data[1], dff1_data_i);
        mux2x1 mux_inst2(load, (count[0] & count[1]) ^ count[2], load_data[2], dff2_data_i);
        mux2x1 mux_inst3(load, (count[0] & count[1] & count[2]) ^ count[3], load_data[3], dff3_data_i);

        d_flipflop dff0(
            .clk(clk),
            .D(dff0_data_i),
            .reset_n(reset_n),
            .Q(count[0]),
            .Qn());

        d_flipflop dff1(
            .clk(clk),
            .D(dff1_data_i),
            .reset_n(reset_n),
            .Q(count[1]),
            .Qn());

        d_flipflop dff2(
            .clk(clk),
            .D(dff2_data_i),
            .reset_n(reset_n),
            .Q(count[2]),
            .Qn());

        d_flipflop dff3(
            .clk(clk),
            .D(dff3_data_i),
            .reset_n(reset_n),
            .Q(count[3]),
            .Qn());

endmodule : counter