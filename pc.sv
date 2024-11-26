module pc(
    input wire clk,
    input wire resetn,

    input wire [2:0] imm,
    input wire load,

    output logic [3:0] pc
);

    always_ff @(posedge clk)
    begin 
        if(~resetn) pc <= 0;
        else if(load) pc <= imm;
        else pc <= pc + 1;
    end

endmodule : pc