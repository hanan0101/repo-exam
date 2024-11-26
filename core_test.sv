module core_test;

    reg resetn;
    reg clk;

    // DUT instantiation 
    core DUT (
        .resetn(resetn),
        .clk(clk)
    );

    // Generating clock signal
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin 
        resetn = 0;
        @(posedge clk);
        @(posedge clk);
        @(negedge clk);
        resetn = 1;
    end

    // Feeding instructions to the memory at the very start
    initial begin 
        $readmemb("fibonacci.bin", DUT.imem_inst.imem);
    end

    // Continuously displaying processor state
    initial begin 
        forever begin
            @(posedge clk);
            $display("RA = %d, RB = %d, RO = %d", DUT.regA, DUT.regB, DUT.regO);
        end
    end 

endmodule : core_test
