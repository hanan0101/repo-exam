`include "pc.sv"
`include "imem.sv"
`include "2x1mux.sv"
`include "alu.sv"
`include "decoder.sv"
`include "register.sv"

module core(
    input wire resetn,
    input wire clk
);

// Instruction Fetching 
wire [2:0] imm;
wire pc_load;
wire [3:0] pc;
pc pc_inst(
    .clk(clk),
    .resetn(resetn),
    .imm(imm),
    .load(pc_load),
    .pc(pc)
);

// Instruction memory
wire [7:0] inst;
imem imem_inst(
    .addr(pc),
    .inst(inst)
);

// Decoding instruction 
wire J;
wire C;
wire [1:0] D;
wire Sreg;
wire S;

assign J = inst[7];
assign C = inst[6];
assign D = inst[5:4];
assign Sreg = inst[3];
assign S = inst[2];
assign imm = inst[2:0];


// Generating enables for register O, A and B
wire enA, enB, enO;
decoder decoder_inst(
    .in(D),
    .out({enO,enB,enA})
);
// registers 
wire [3:0] regIn;
wire [3:0] regA, regB, regO;

wire [3:0] AluOut;

// Mux for selecting inputs for register (regIn)
mux2x1 mux1(
    .in1(AluOut),
    .in2(imm),
    .sel(Sreg),
    .out(regIn)
);

// Register RA (regA)
register reg_A(
    .clk(clk),
    .resetn(resetn),
    .wen(enA),
    .D(regIn),
    .Q(regA)
);

// Register RB (regB)
register reg_B(
    .clk(clk),
    .resetn(resetn),
    .wen(enB),
    .D(regIn),
    .Q(regB)
);

// Register RO (regO)
register reg_O(
    .clk(clk),
    .resetn(resetn),
    .wen(enO),
    .D(regA),
    .Q(regO)
);

// ALU
wire carry;

alu alu_inst(
    .clk(clk),
    .opcode(S),
    .a(regA),
    .b(regB),
    .out(AluOut),
    .carry(carry)
);

// Jump instructions 

assign pc_load = J | (C & carry);

    
endmodule : core