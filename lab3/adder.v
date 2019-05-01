module adder(
	input [4:0] A,
	input [4:0] B,
	output [4:0] S,
	output Cout
);

wire Cin = 1'b0;
wire Cout0;
wire Cout1;
wire Cout2;
wire Cout3;

fullAdder a0 (
	.A(A[0]),
	.B(B[0]),
	.Cin(Cin),
	.Cout(Cout0),
	.S(S[0])
);

fullAdder a1 (
	.A(A[1]),
	.B(B[1]),
	.Cin(Cout0),
	.Cout(Cout1),
	.S(S[1])
);

fullAdder a2 (
	.A(A[2]),
	.B(B[2]),
	.Cin(Cout1),
	.Cout(Cout2),
	.S(S[2])
);

fullAdder a3 (
	.A(A[3]),
	.B(B[3]),
	.Cin(Cout2),
	.Cout(Cout3),
	.S(S[3])
);

fullAdder a4 (
	.A(A[4]),
	.B(B[4]),
	.Cin(Cout3),
	.Cout(Cout),
	.S(S[4])
);

endmodule