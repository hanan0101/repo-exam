module d_latch_asyn_rstn_tb;

logic clk;
logic D;
logic reset_n;
logic Q;
logic Qn;


d_latch_asyn_rstn DUT(.*);

//always #5 clk = ~clk;

initial begin
    clk = 0;
    $display(" rstn   clk   D   Q  Qn"); 
    for(int i  = 0; i < 100; i++)
    begin 
        @(negedge clk);
        {reset_n, D, clk} = i;
        #1;
        $display(" %b   %b    %b   %b  %b", reset_n, clk, D, Q, Qn);
    end
end
endmodule : d_latch_asyn_rstn_tb