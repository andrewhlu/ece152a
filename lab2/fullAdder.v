module fullAdder (
	input A,
	input B,
	input Cin,
	output S,
	output Cout
);

wire AxB;
// assign AxB = A ^ B;
assign AxB = (A & ~B) | (~A & B);

wire AxBaCin;
// assign AxBaCin = (A ^ B) & Cin;
assign AxBaCin = ((A & ~B) | (~A & B)) & Cin;

wire AaB;
assign AaB = A & B;

assign Cout = AaB | AxBaCin;
// assign S = AxB ^ Cin;
assign S = (AxB & ~Cin) | (~AxB & Cin);

endmodule