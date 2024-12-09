module sr_latch(
    input logic R,
    input logic S,
    output logic Qa,
    output logic Qb
);

    nor (Qa, R, Qb);
    nor (Qb, S, Qa);

endmodule : sr_latch