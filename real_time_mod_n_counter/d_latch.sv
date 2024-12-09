module d_latch(
    input logic clk,
    input logic D,
    output logic Q, 
    output logic Qn 
);
    logic S, R;

    assign S = D;
    assign R = ~D;

    logic nand1_o, nand2_o;
    nand (nand1_o, S, clk);
    nand (nand2_o, R, clk);

    nand (Q, nand1_o, Qn);
    nand (Qn, nand2_o, Q);

endmodule : d_latch