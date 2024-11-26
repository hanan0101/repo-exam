module counter_n_bit#(
    parameter n = 4
)(
    input logic clk,
    input logic resetn,
    input logic load,
    input logic en,
    input logic [n - 1: 0] load_data,
    output logic [n - 1: 0] count
);

    always_ff @(posedge clk, negedge resetn) begin 
        if(resetn) count <= 0;
        else begin 
            else if(en) count <= count + 1;
            if(load) count <= load_data;
        end
    end
endmodule : counter_n_bit