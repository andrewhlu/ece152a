module fourBitAdder_TwoByTwo (
	input [3:0] A,
	input [3:0] B,
	input Cin,
	output [3:0] S,
	output Cout
);

wire Cout1;

twoBitAdder a0 (
	.A(A[1:0]),
	.B(B[1:0]),
	.Cin(Cin),
	.Cout(Cout1),
	.S(S[1:0])
);

twoBitAdder a1 (
	.A(A[3:2]),
	.B(B[3:2]),
	.Cin(Cout1),
	.Cout(Cout),
	.S(S[3:2])
);

endmodule