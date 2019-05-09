module main(
	input clock,
	input [2:0] max_count,
	input enable,
	input reset,
	input direction,
	output A,
	output B,
	output C,
	output D,
	output E,
	output F,
	output G
);

wire [2:0] count;

counter step1(
	.clock(clock),
	.max_count(max_count),
	.enable(enable),
	.reset(reset),
	.direction(direction),
	.count(count)
);

decoder step2(
	.in(count),
	.A(A),
	.B(B),
	.C(C),
	.D(D),
	.E(E),
	.F(F),
	.G(G)
);

endmodule