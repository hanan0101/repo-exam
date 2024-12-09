module counter_tb;

logic clk;
logic reset_n;
logic load;
logic [3:0] load_data;
logic [3:0] count;

counter DUT(.*);

always #5 clk = ~clk;

int j = 0;
initial begin 
    clk = 0;
    reset_n = 0;
    #20;
    reset_n = 1;
    for(int i = 0; i<100;i = i+1)
    begin 
        @(posedge clk);
        #1;
        if(i%13 == 0)
        begin 
            load = 1;
            reset_n = 1;
            load_data = j;
            j++;
        end
        else if(i % 9 == 0) 
        begin 
            reset_n = 0;
        end
        else begin 
            reset_n = 1;
            load  = 0;
        end
        #3;
        reset_n = 1;
    end
    j = 0;
    for(int i = 0; i<100;i = i+1)
    begin 
        if(i%13 == 0)
        begin 
            load = 1;
            reset_n = 1;
            load_data = j;
            j++;
        end
        else if(i % 9 == 0) 
        begin 
            reset_n = 0;
        end
        else begin 
            reset_n = 1;
            load  = 0;
        end
        @(negedge clk);
    end
end

endmodule : counter_tb