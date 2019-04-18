module lab2_2ba_tb ();

reg [1:0] sim_A;
reg [1:0] sim_B;
reg sim_Cin;

wire [1:0] sim_S;
wire sim_Cout;

twoBitAdder test (
	.A(sim_A),
	.B(sim_B),
	.Cin(sim_Cin),
	.Cout(sim_Cout),
	.S(sim_S)
);

initial begin
	sim_A = 2'b01;
	sim_B = 2'b11;
	sim_Cin = 1'b0;

	#5;

	$display("Sum is %b, we expected %b", sim_S, 2'b00);
	$display("Cout is %b, we expected %b", sim_Cout, 1'b1);

	sim_A = 2'b00;
	sim_B = 2'b00;
	sim_Cin = 1'b0;

	#5;

	$display("Sum is %b, we expected %b", sim_S, 2'b00);
	$display("Cout is %b, we expected %b", sim_Cout, 1'b0);

	sim_A = 2'b01;
	sim_B = 2'b10;
	sim_Cin = 1'b1;

	#5;

	$display("Sum is %b, we expected %b", sim_S, 2'b00);
	$display("Cout is %b, we expected %b", sim_Cout, 1'b1);

	sim_A = 2'b11;
	sim_B = 2'b11;
	sim_Cin = 1'b0;

	#5;

	$display("Sum is %b, we expected %b", sim_S, 2'b10);
	$display("Cout is %b, we expected %b", sim_Cout, 1'b1);

	sim_A = 2'b11;
	sim_B = 2'b11;
	sim_Cin = 1'b1;

	#5;

	$display("Sum is %b, we expected %b", sim_S, 2'b11);
	$display("Cout is %b, we expected %b", sim_Cout, 1'b1);

	sim_A = 2'b11;
	sim_B = 2'b01;
	sim_Cin = 1'b1;

	#5;

	$display("Sum is %b, we expected %b", sim_S, 2'b01);
	$display("Cout is %b, we expected %b", sim_Cout, 1'b1);

	sim_A = 2'b10;
	sim_B = 2'b01;
	sim_Cin = 1'b0;

	#5;

	$display("Sum is %b, we expected %b", sim_S, 2'b11);
	$display("Cout is %b, we expected %b", sim_Cout, 1'b0);

	$stop;
end

endmodule