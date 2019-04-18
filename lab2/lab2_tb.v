module lab2_tb ();

reg [3:0] sim_A;
reg [3:0] sim_B;
reg sim_Cin;

wire [3:0] sim_S;
wire sim_Cout;

fourBitAdder_FourByOne test (
	.A(sim_A),
	.B(sim_B),
	.Cin(sim_Cin),
	.Cout(sim_Cout),
	.S(sim_S)
);

initial begin
	sim_A = 4'b0;
	sim_B = 4'b0;
	sim_Cin = 1'b0;

	#5;

	$display("Sum is %b, we expected %b", sim_S, 4'b0);
	$display("Cout is %b, we expected %b", sim_Cout, 1'b0);

	sim_A = 4'b0001;
	sim_B = 4'b0010;
	sim_Cin = 1'b0;

	#5;

	$display("Sum is %b, we expected %b", sim_S, 4'b0011);
	$display("Cout is %b, we expected %b", sim_Cout, 1'b0);

	sim_A = 4'b0111;
	sim_B = 4'b0111;
	sim_Cin = 1'b0;

	#5;

	$display("Sum is %b, we expected %b", sim_S, 4'b1110);
	$display("Cout is %b, we expected %b", sim_Cout, 1'b0);

	sim_A = 4'b1000;
	sim_B = 4'b1100;
	sim_Cin = 1'b0;

	#5;

	$display("Sum is %b, we expected %b", sim_S, 4'b0100);
	$display("Cout is %b, we expected %b", sim_Cout, 1'b1);

	$stop;
end

endmodule