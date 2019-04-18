module lab2_fa_tb ();

reg sim_A;
reg sim_B;
reg sim_Cin;

wire sim_S;
wire sim_Cout;

fullAdder test (
	.A(sim_A),
	.B(sim_B),
	.Cin(sim_Cin),
	.S(sim_S),
	.Cout(sim_Cout)
);

initial begin
	sim_A = 1'b1;
	sim_B = 1'b1;
	sim_Cin = 1'b1;

	#5;

	$display("Sum is %b, we expected %b", sim_S, 1'b1);
	$display("Cout is %b, we expected %b", sim_Cout, 1'b1);

	sim_A = 1'b0;
	sim_B = 1'b1;
	sim_Cin = 1'b0;

	#5;

	$display("Sum is %b, we expected %b", sim_S, 1'b1);
	$display("Cout is %b, we expected %b", sim_Cout, 1'b0);

	sim_A = 1'b1;
	sim_B = 1'b0;
	sim_Cin = 1'b1;

	#5;

	$display("Sum is %b, we expected %b", sim_S, 1'b0);
	$display("Cout is %b, we expected %b", sim_Cout, 1'b1);

	sim_A = 1'b0;
	sim_B = 1'b0;
	sim_Cin = 1'b0;

	#5;

	$display("Sum is %b, we expected %b", sim_S, 1'b0);
	$display("Cout is %b, we expected %b", sim_Cout, 1'b0);

	$stop;
end

endmodule