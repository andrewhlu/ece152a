module main_tb();

reg clock_sim;
reg [2:0] max_count_sim;
reg enable_sim;
reg reset_sim;
reg direction_sim;
wire sim_A;
wire sim_B;
wire sim_C;
wire sim_D;
wire sim_E;
wire sim_F;
wire sim_G;

main test(
	.clock(clock_sim),
	.max_count(max_count_sim),
	.enable(enable_sim),
	.reset(reset_sim),
	.direction(direction_sim),
	.A(sim_A),
	.B(sim_B),
	.C(sim_C),
	.D(sim_D),
	.E(sim_E),
	.F(sim_F),
	.G(sim_G)
);

always begin
	#500000000 clock_sim = ~clock_sim; // Invert clock polarity every .5s (T = 1s)
end

initial begin
	clock_sim = 0;

	max_count_sim = 3'b101; //Max count is 5
	direction_sim = 1'b1; //Counting up
	enable_sim = 1'b1; //Enabled
	reset_sim = 1'b0; //No reset

	$display("Case 1: Max Count 5, counting up, enabled and no reset");

	#5;

	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	#1000000000;

	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	#1000000000;

	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	#1000000000;

	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	#1000000000;

	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	#1000000000;

	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	#1000000000;

	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	#1000000000;

	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	reset_sim = 1'b1;
	$display("Case 2: Reset on");

	#1000000000;

	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	max_count_sim = 3'b110; //Max count is 6
	direction_sim = 1'b0; //Counting down
	enable_sim = 1'b1; //Enabled
	reset_sim = 1'b0; //No reset

	$display("Case 3: Max Count 6, counting down, enabled and no reset");

	#1000000000;

	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	#1000000000;

	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	#1000000000;

	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	#1000000000;

	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	#1000000000;

	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	#1000000000;

	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	#1000000000;

	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	#1000000000;

	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	#1000000000;

	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	enable_sim = 1'b0;
	$display("Case 4: Enable off, reset on, enable on, reset off");

	$display("Enable off");
	enable_sim = 1'b0;
	#1000000000;

	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	#1000000000;

	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	$display("Reset on");
	reset_sim = 1'b1;
	#1000000000;

	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	#1000000000;

	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	$display("Enable on");
	enable_sim = 1'b1;
	#1000000000;

	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	$display("Reset off");
	reset_sim = 1'b0;
	#1000000000;

	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	$display("Case 5: Flip direction in middle of counting");
	$display("Direction is currently down (zero)");

	#1000000000;

	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	#1000000000;

	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	$display("Direction up (one)");
	direction_sim = 1'b1;
	#1000000000;

	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	#1000000000;

	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	#1000000000;

	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	#1000000000;

	$display("%b %b %b", sim_A | sim_F, sim_A, sim_A | sim_B);
	$display("%b   %b", sim_F, sim_B);
	$display("%b %b %b", sim_E | sim_F | sim_G, sim_G, sim_B | sim_C | sim_G);
	$display("%b   %b", sim_E, sim_C);
	$display("%b %b %b", sim_D | sim_E, sim_D, sim_C | sim_D);
	$display(" ");

	#1000000000;
	
	$stop;
end

endmodule