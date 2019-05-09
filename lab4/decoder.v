module decoder (
	input [2:0] in,
	output reg A,
	output reg B,
	output reg C,
	output reg D,
	output reg E,
	output reg F,
	output reg G
);

always @* begin
	A = (in[2] & in[0]) | (!in[2] & !in[0]) | in[1];
	B = !in[2] | (in[1] & in[0]) | (!in[1] & !in[0]);
	C = in[2] | !in[1] | in[0];
	D = (in[2] & !in[1] & in[0]) | (!in[2] & in[1]) | (!in[2] & !in[0]) | (in[1] & !in[0]);
	E = (!in[2] & !in[0]) | (in[1] & !in[0]);
	F = (in[2] & !in[1]) | (in[2] & !in[0]) | (!in[1] & !in[0]);
	G = (in[2] & !in[1]) | (!in[2] & in[1]) | (in[1] & !in[0]);
end

endmodule