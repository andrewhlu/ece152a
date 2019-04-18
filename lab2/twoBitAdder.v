module twoBitAdder(
	input [1:0] A,
	input [1:0] B,
	input Cin,
	output [1:0] S,
	output Cout
);

assign Cout = (A[1] & A[0] & B[0]) | (A[1] & A[0] & Cin) | (A[1] & B[1]) | (A[1] & B[0] & Cin) | (A[0] & B[1] & B[0]) | (A[0] & B[1] & Cin) | (B[1] & B[0] & Cin);
assign S[1] = (A[1] & A[0] & B[1] & B[0]) | (A[1] & A[0] & B[1] & Cin) | (A[1] & !A[0] & !B[1] & !B[0]) | (A[1] & !A[0] & !B[1] & !Cin) | (A[1] & B[1] & B[0] & Cin) | (A[1] & !B[1] & !B[0] & !Cin) | ( !A[1] & A[0] & !B[1] & B[0]) | ( !A[1] & A[0] & !B[1] & Cin) | ( !A[1] & !A[0] & B[1] & !B[0]) | ( !A[1] & !A[0] & B[1] & !Cin) | ( !A[1] & B[1] & !B[0] & !Cin) | ( !A[1] & !B[1] & B[0] & Cin);
assign S[0] = (A[0] & B[0] & Cin) | (A[0] & !B[0] & !Cin) | ( !A[0] & B[0] & !Cin) | ( !A[0] & !B[0] & Cin);

endmodule