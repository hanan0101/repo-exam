module n_bit_register_tb;
    logic clk;
    logic reset_n;
    logic [7:0] data_i;
    logic [7:0] data_o;

    n_bit_register DUT(.*);

    
    always #5 clk = ~clk;

    initial begin 
        clk = 0;
        reset_n = 0;
        #20;
        reset_n =1;
        for(int i = 0; 1<<8; i++)
        begin
            data_i = i;
            @(negedge clk);
            if(i%10 == 0) reset_n = 0;
            else reset_n = 1;
        end
    end

endmodule : n_bit_register_tb