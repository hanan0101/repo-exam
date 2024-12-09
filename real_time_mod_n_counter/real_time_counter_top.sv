//`include "decoder.sv"
//`include "counter_n_bit.sv"
//`include "sev_seg_decoder.sv"
//`include "sev_seg_controller.sv"

module real_time_counter_top(
    input wire CPU_RESETN,
    input wire CLK100MHZ,
    output wire CA, CB, CC, CD, CE, CF, CG, DP,
    output wire [7:0] AN,
    input wire BTNC,
    input wire [15:0]SW,
    output wire [15:0] LED
);



wire resetn;
wire clk;

assign resetn = CPU_RESETN;
assign clk = CLK100MHZ;

assign LED = ~SW;

// real time counter 
parameter N = 100;
parameter n = $clog2(N);
logic [ n - 1 : 0] count;


real_time_counter #(.N(10)) rtc_inst(
    .clk(clk),
    .reset_n(resetn),
    .en(SW[0]),
    .count(count)
);



// Seven segments Controller
wire [6:0] Seg;
wire [3:0] digits[0:7];

assign digits[0] = count[3:0];
assign digits[1] = count[6:4];
assign digits[2] = 4'b1111;
assign digits[3] = 4'b1111;
assign digits[4] = 4'b1111;
assign digits[5] = 4'b1111;
assign digits[6] = 4'b1111;
assign digits[7] = 4'b1111;


sev_seg_controller ssc(
    .clk(clk),
    .resetn(resetn),
    .digits(digits),
    .Seg(Seg),
    .AN(AN)
);


assign CA = Seg[0];
assign CB = Seg[1];
assign CC = Seg[2];
assign CD = Seg[3];
assign CE = Seg[4];
assign CF = Seg[5];
assign CG = Seg[6];
assign DP = 1'b1; // turn off the dot point on seven segs


endmodule : real_time_counter_top