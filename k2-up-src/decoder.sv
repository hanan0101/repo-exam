module decoder#(
    parameter n = 2
)(
    input logic [n-1:0]in,
    output logic [(1 << n) - 1: 0]out
);

    always @(*)
    begin 
        case(in)
        0: out = 0001;
        1: out = 0010;
        2: out = 0110;
        endcase
    end

endmodule : 