// module d_flipflop(
//     input logic clk, 
//     input logic D, 
//     input logic reset_n,
//     input logic en,
//     output logic Q,
//     output logic Qn 
// );

// logic d_latch0_o;
// logic d_latch0_clk;
// logic d_latch1_clk;

// assign d_latch0_clk = en & ~clk;
// assign d_latch1_clk = en & ~d_latch0_clk;

// d_latch_asyn_rstn d_latch0(
//     .clk(d_latch0_clk),
//     .D(D),
//     .reset_n(reset_n),
//     .Q(d_latch0_o),
//     .Qn() 
// );

// d_latch_asyn_rstn d_latch1(
//     .clk(d_latch1_clk),
//     .D(d_latch0_o),
//     .reset_n(reset_n),
//     .Q(Q),
//     .Qn(Qn) 
// );

// endmodule : d_flipflop


module d_flipflop(
    input logic clk, 
    input logic D, 
    input logic reset_n,
    input logic en,
    output logic Q,
    output logic Qn 
);

    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            Q <= 1'b0;       // Reset the flip-flop
        end else begin
            Q <= D;          // Capture data on the clock edge if enabled
        end
    end

    assign Qn = ~Q;           // Complement of Q

endmodule : d_flipflop
