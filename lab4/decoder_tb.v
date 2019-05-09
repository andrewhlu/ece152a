module decoder_tb ();

reg [2:0] sim_in;
wire sim_A;
wire sim_B;
wire sim_C;
wire sim_D;
wire sim_E;
wire sim_F;
wire sim_G;

decoder test(
	.in(sim_in),
	.A(sim_A),
	.B(sim_B),
	.C(sim_C),
	.D(sim_D),
	.E(sim_E),
	.F(sim_F),
	.G(sim_G)
);


initial begin
	sim_in = 3'b000;

	#5;

	$display("Input value: %b", sim_in);
	$display("Output:");
	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	sim_in = 3'b001;

	#5;

	$display("Input value: %b", sim_in);
	$display("Output:");
	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	sim_in = 3'b010;

	#5;

	$display("Input value: %b", sim_in);
	$display("Output:");
	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	sim_in = 3'b011;

	#5;

	$display("Input value: %b", sim_in);
	$display("Output:");
	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	sim_in = 3'b100;

	#5;

	$display("Input value: %b", sim_in);
	$display("Output:");
	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	sim_in = 3'b101;

	#5;

	$display("Input value: %b", sim_in);
	$display("Output:");
	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	sim_in = 3'b110;

	#5;

	$display("Input value: %b", sim_in);
	$display("Output:");
	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	sim_in = 3'b111;

	#5;

	$display("Input value: %b", sim_in);
	$display("Output:");
	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	$stop;
end

endmodule