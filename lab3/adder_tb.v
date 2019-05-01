module adder_tb ();

reg [4:0] sim_A;
reg [4:0] sim_B;

wire [4:0] sim_S;
wire sim_Cout;

adder test (
	.A(sim_A),
	.B(sim_B),
	.Cout(sim_Cout),
	.S(sim_S)
);

initial begin
	sim_A = 5'b0;
	sim_B = 5'b0;

	#5;

	$display("Sum is %b, we expected %b", sim_S, 5'b0);
	$display("Cout is %b, we expected %b", sim_Cout, 1'b0);

	sim_A = 5'b00001;
	sim_B = 5'b00010;

	#5;

	$display("Sum is %b, we expected %b", sim_S, 5'b00011);
	$display("Cout is %b, we expected %b", sim_Cout, 1'b0);

	sim_A = 5'b00111;
	sim_B = 5'b00111;

	#5;

	$display("Sum is %b, we expected %b", sim_S, 5'b01110);
	$display("Cout is %b, we expected %b", sim_Cout, 1'b0);

	sim_A = 5'b10000;
	sim_B = 5'b11000;

	#5;

	$display("Sum is %b, we expected %b", sim_S, 5'b01000);
	$display("Cout is %b, we expected %b", sim_Cout, 1'b1);

	$stop;
end

endmodule