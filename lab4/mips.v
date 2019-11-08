// single-cycle MIPS processor
// instantiates a controller and a datapath module

module mips(
    input clk, reset,
    input [31:0] readdata,
    input [31:0] instr,
    output memwrite,
    output [31:0] aluout, writedata, pc
);

wire memtoreg, pcsrc, zero, alusrc, regdst, regwrite, jump;
wire [2:0] alucontrol;

controller c(instr[31:26], instr[5:0], zero, bne, memtoreg, memwrite, pcsrc, alusrc, regdst, regwrite, jump, ori, alucontrol);
datapath dp(clk, reset, memtoreg, pcsrc, alusrc, regdst, regwrite, jump, ori, alucontrol, zero, pc, instr, aluout, writedata, readdata);

endmodule // mips

module controller(
    input [5:0] op, funct,
    input zero, bne,
    output memtoreg, memwrite,
    output pcsrc, alusrc,
    output regdst, regwrite,
    output jump, ori
    output [2:0] alucontrol
);

wire branch;
wire [1:0] aluop;

maindecoder maindecoder1( //Instantiating maindecoder
    .op(op),
    .memtoreg(memtoreg),
    .memwrite(memwrite),
    .branch(branch),
    .alusrc(alusrc),
    .regdst(regdst),
    .regwrite(regwrite),
    .jump(jump),
    .bne(bne),
    .ori(ori),
    .aluop(aluop)
);

aludecoder aludecoder1( //Instantiating aludecoder
    .aluop(aluop),
    .funct(funct),
    .alucontrol(alucontrol)
);

assign pcsrc = branch & ((bne & ~zero) | (!bne & zero)); //pcrsc = branch & zero

endmodule // controller

module datapath(
    input clk, reset,
    input memtoreg, pcsrc,
    input alusrc, regdst,
    input regwrite, jump, ori
    input [2:0]  alucontrol,
    output zero,
    output [31:0] pc,
    input [31:0] instr,
    output [31:0] aluout, writedata,
    input [31:0] readdata
);

// Declare all wires and regs used
wire [31:0] srca, srcb, result, immext, immextshift, pcbranch, pcplus4, pcjump, pcprime, pcsrcout;
wire [4:0] writereg;

//Instantiate writereg MUX
b5mux writeregmux(
    .a(instr[20:16]),
    .b(instr[15:11]),
    .sel(regdst),
    .y(writereg)
);

// Instantiate registerfile and set inputs/outputs
registerfile rf(
    .a1(instr[25:21]),
    .a2(instr[20:16]),
    .a3(writereg),
    .wd3(result),
    .clk(clk),
    .we3(regwrite),
    .rd1(srca),
    .rd2(writedata)
);

//Instantiate srcb MUX
b32mux srcbmux(
    .a(writedata),
    .b(immext),
    .sel(alusrc),
    .y(srcb)
);

// Instantiate alu and set inputs/outputs
ALU alu(
    .a(srca),
    .b(srcb),
    .f(alucontrol),
    .y(aluout),
    .zero(zero)
);

//Instantiate result MUX
b32mux resultmux(
    .a(aluout),
    .b(readdata),
    .sel(memtoreg),
    .y(result)
);

//Instantiate pcprimemux
b32mux pcprimemux(
    .a(pcsrcout),
    .b({pcplus4[31:28], instr[25:0], 2'b00}),
    .sel(jump),
    .y(pcprime)
);

//Instantiate pcsrcmux
b32mux pcsrcmux(
    .a(pcplus4),
    .b(pcbranch),
    .sel(pcsrc),
    .y(pcsrcout)
);

//Instantiate pc counter
adder pcadd4(
    .a(pc),
    .b(32'b100),
    .y(pcplus4)
);

//Instantiate shifter for immext
b32leftshift shifter(
    .a(immext),
    .y(immextshift)
);

// Instantiate sign extender for immediate
signextend signext(
    .in(instr[15:0]),
    .ori(ori),
    .out(immext)
);

//Instantiate pcbranch adder
adder pcbranchadd(
    .a(immextshift),
    .b(pcplus4),
    .y(pcbranch)
);

//Instantiate PC counter flip flop
flipflop pcflipflop(
    .clk(clk),
    .reset(reset),
    .a(pcprime),
    .b(pc)
);

endmodule // datapath

module adder(
    input [31:0] a, b,
    output [31:0] y
);

assign y = a + b;

endmodule //adder

module b32leftshift(
    input [31:0] a,
    output [31:0] y
);

assign y = {a[29:0], 2'b00};

endmodule //b32leftshift

module flipflop(
    input clk, reset,
    input [31:0] a,
    output reg [31:0] b
);

always @(posedge clk, posedge reset) begin
    if(reset)
        b = 32'b0;
    else
        b = a;
end

endmodule //flipflop

module b32mux( //If sel = 1, choose b, if sel = 0, choose a
    input [31:0] a, b,
    input sel,
    output [31:0] y
);

    assign y = sel ? b : a;

endmodule //b32mux

module b5mux( //If sel = 1, choose b, if sel = 0, choose a
    input [4:0] a, b,
    input sel,
    output [4:0] y
);

    assign y = sel ? b : a;

endmodule //b5mux

module registerfile(
    input [4:0] a1, a2, a3,
    input [31:0] wd3,
    input clk,
    input we3,
    output [31:0] rd1, rd2
);

    // Declare register array to hold register values
    reg [31:0] rf [31:0];

    // Only update register values on positive clock edge
    always @(posedge clk) begin
        // If RegWrite is 1, write wd3 to register a3
        if (we3)
            rf[a3] = wd3;
    end

    // Assign rd1 and rd2 based on input registers a1 and a2
    assign rd1 = (a1 != 0) ? rf[a1] : 0;
    assign rd2 = (a2 != 0) ? rf[a2] : 0;

endmodule // registerfile

module signextend(
    input [15:0] in,
    input ori,
    output reg [31:0] out
);

// Concatenate extended MSB to original input
always @(in) begin
  if(ori == 0) begin
    assign out = {{16{in[15]}}, in};
  end
  else begin
    assign out = {16'b0, in};
  end
end

endmodule // signextend

module maindecoder(
    input [5:0] op,
    output reg memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump, bne, ori
    output reg [1:0] aluop
);

always @(op) begin
    case(op)
        6'b000000: begin //R-type
        assign regwrite = 1;
        assign regdst = 1;
        assign alusrc = 0;
        assign branch = 0;
        assign memwrite = 0;
        assign memtoreg = 0;
        assign aluop = 10;
        assign jump = 0;
        assign bne = 0;
        assign ori = 0;
        end
        6'b100011: begin //lw
        assign regwrite = 1;
        assign regdst = 0;
        assign alusrc = 1;
        assign branch = 0;
        assign memwrite = 0;
        assign memtoreg = 1;
        assign aluop = 00;
        assign jump = 0;
        assign bne = 0;
        assign ori = 0;
        end
        6'b101011: begin //sw
        assign regwrite = 0;
        assign regdst = 0;
        assign alusrc = 1;
        assign branch = 0;
        assign memwrite = 1;
        assign memtoreg = 0;
        assign aluop = 00;
        assign jump = 0;
        assign bne = 0;
        assign ori = 0;
        end
        6'b000100: begin //beq
        assign regwrite = 0;
        assign regdst = 0;
        assign alusrc = 0;
        assign branch = 1;
        assign memwrite = 0;
        assign memtoreg = 0;
        assign aluop = 01;
        assign jump = 0;
        assign bne = 0;
        assign ori = 0;
        end
        6'b001000: begin //addi
        assign regwrite = 1;
        assign regdst = 0;
        assign alusrc = 1;
        assign branch = 0;
        assign memwrite = 0;
        assign memtoreg = 0;
        assign aluop = 00;
        assign jump = 0;
        assign bne = 0;
        assign ori = 0;
        end
        6'b001101: begin //ori
        assign regwrite = 1;
        assign regdst = 0;
        assign alusrc = 1;
        assign branch = 0;
        assign memwrite = 0;
        assign memtoreg = 0;
        assign aluop = 11;
        assign jump = 0;
        assign bne = 0;
        assign ori = 1;
        end
        6'b000010: begin //j
        assign regwrite = 0;
        assign regdst = 0;
        assign alusrc = 0;
        assign branch = 0;
        assign memwrite = 0;
        assign memtoreg = 0;
        assign aluop = 00;
        assign jump = 1;
        assign bne = 0;
        assign ori = 0;
        end
        6'b000101: begin //bne
        assign regwrite = 0;
        assign regdst = 0;
        assign alusrc = 0;
        assign branch = 1;
        assign memwrite = 0;
        assign memtoreg = 0;
        assign aluop = 01;
        assign jump = 0;
        assign bne = 1;
        assign ori = 0;
        end
    endcase
end

endmodule // maindecoder

// Takes aluop from maindecoder and funct from Instr and assigns alucontrol appropriately
module aludecoder(
    input [1:0] aluop,
    input [5:0] funct,
    output reg [2:0] alucontrol
);

always @(aluop, funct)  begin
    case(aluop)
        2'b00: assign alucontrol = 010; //add
        2'b01: assign alucontrol = 110; //subtract
        2'b11: assign alucontrol = 001; //or
        2'b10: begin //aluop is R-type
            case(funct)
                6'b100000: assign alucontrol = 3'b010; //add
                6'b100010: assign alucontrol = 3'b110; //sub
                6'b100100: assign alucontrol = 3'b000; //and
                6'b100101: assign alucontrol = 3'b001; //or
                6'b101010: assign alucontrol = 3'b111; //slt
                default: assign alucontrol = 3'bxxx;
            endcase
        end
    endcase
end

endmodule // aludecoder