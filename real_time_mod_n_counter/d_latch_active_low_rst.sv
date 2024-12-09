module d_latch_asyn_rstn(
    input logic clk,
    input logic D,
    input logic reset_n,
    output logic Q, 
    output logic Qn 
);
    logic S, R;

    assign S = D;
    assign R = ~D;

    logic nand1_o, nand2_o;
    // nand (nand1_o, S, clk);
    assign nand1_o = ~(S & clk & reset_n);
    nand (nand2_o, R, clk);

    nand (Q, nand1_o, Qn);
    // nand (Qn, nand2_o, Q);
    assign Qn = ~(Q & nand2_o & reset_n);

endmodule : d_latch_asyn_rstn






// module d_latch_asyn_rstn(
//     input logic clk,
//     input logic D,
//     input logic reset_n,
//     output logic Q, 
//     output logic Qn 
// );
//     logic S, R;

//     assign S = D;
//     assign R = ~D;

//     logic nand1_o, nand2_o;
//     nand (nand1_o, S, clk);
//     nand (nand2_o, R, clk);

//     nand (Q1, nand1_o, Qn);
//     and (Q, reset_n, Q1);
//     nand (Qn, nand2_o, Q);
//     // assign Qn = ~(Q & nand2_o & reset_n);

// endmodule : d_latch_asyn_rstn




















// module d_latch_asyn_rstn(
//     input logic clk,
//     input logic D,
//     input logic reset_n,
//     output logic Q, 
//     output logic Qn 
// );
//     logic S, R;

//     assign S = D;
//     assign R = ~D;

//     logic nand1_o, nand2_o;
//     nand (nand1_o, S, clk);
//     nand (nand2_o, R, clk);

//     nand (Q, nand1_o, Qn);
//     // nand (Qn, nand2_o, Q);
//     assign Qn = ~(Q & nand2_o & reset_n);

// endmodule : d_latch_asyn_rstn