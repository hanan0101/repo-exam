module addsub #(
    parameter n = 4
)(
    input logic M,
    input logic [n -1:0] A,
    input logic [n -1:0] B,
    output logic [n-1:0] S,
    output logic Cout
);
    logic [n : 0] C;
    logic [n-1:0] Xor_o;
    // 

    xor (Xor_o[0], B[0], M);
    xor (Xor_o[1], B[1], M);
    xor (Xor_o[2], B[2], M);
    xor (Xor_o[3], B[3], M);

    full_adder fa_inst0(C[0],  A[i], Xor_o[i], S[i], C[1]);
    full_adder fa_inst0(C[1],  A[i], Xor_o[i], S[i], C[2]);
    full_adder fa_inst0(C[2],  A[i], Xor_o[i], S[i], C[3]);
    full_adder fa_inst0(C[3],  A[i], Xor_o[i], S[i], C[4]);
    assign Cout = C[n];

endmodule : addsub