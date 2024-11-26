module register#(
    parameter n = 4
)(
    input wire clk,
    input wire resetn,
    input wire wen,
    input wire [n-1:0]D,
    output logic [n-1:0]Q
);

    always_ff @(posedge clk)
    begin 
        if(~resetn) Q <= 0;
        else if(wen) Q <= D;
    end
endmodule : register