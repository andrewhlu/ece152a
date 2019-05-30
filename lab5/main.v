module main(
	input clock,
	input reset,
	input left,
	input right,
	input hazard,
	input brake,
	input dim_clock,
	input lights,
	output reg [5:0] out
);

wire [5:0] state_out;
wire [5:0] dim_out;

statemachine step1(
	.clock(clock),
	.reset(reset),
	.left(left),
	.right(right),
	.hazard(hazard),
	.brake(brake),
	.out(state_out)
);

dim step2(
	.in(state_out),
	.clock(dim_clock),
	.lights(lights),
	.out(dim_out)
);

always @* begin
	out = dim_out;
end

endmodule