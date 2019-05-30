module statemachine_tb();

reg clock_sim;
reg reset_sim;
reg left_sim;
reg right_sim;
reg hazard_sim;
reg brake_sim;
wire [5:0] out_sim;

statemachine test(
	.clock(clock_sim),
	.reset(reset_sim),
	.left(left_sim),
	.right(right_sim),
	.hazard(hazard_sim),
	.brake(brake_sim),
	.out(out_sim)
);

always begin
	#50000000 clock_sim = ~clock_sim; // Invert clock polarity every .05s (T = 0.1s)
end

initial begin
	clock_sim = 0;

	reset_sim = 1'b0;
	left_sim = 1'b0;
	right_sim = 1'b0;
	hazard_sim = 1'b0;
	brake_sim = 1'b0;

	$display("Case 1: Everything off");

	#5;

	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000

	left_sim = 1'b1;
	$display("Case 2: Left on");

	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000

	left_sim = 1'b0;
	right_sim = 1'b1;
	$display("Case 3: Right on");

	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000

	left_sim = 1'b1;
	$display("Case 4: Left and right on");

	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000

	right_sim = 1'b0;
	hazard_sim = 1'b1;
	$display("Case 5: Left and hazard on");

	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000

	right_sim = 1'b1;
	left_sim = 1'b0;
	$display("Case 6: Right and hazard on");

	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000

	hazard_sim = 1'b0;
	brake_sim = 1'b1;
	right_sim = 1'b0;
	left_sim = 1'b1;
	$display("Case 7: Left and brake on");

	#100000000
	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000

	right_sim = 1'b1;
	left_sim = 1'b0;
	$display("Case 8: Right and brake on");

	#100000000
	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000

	left_sim = 1'b1;
	$display("Case 9: Left, right, and brake on");

	#100000000
	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000

	left_sim = 1'b0;
	right_sim = 1'b0;
	$display("Case 10: Just brake on");

	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000

	brake_sim = 1'b0;
	left_sim = 1'b1;
	reset_sim = 1'b1;
	$display("Case 11: Left and reset on");

	#100000000
	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000

	left_sim = 1'b0;
	right_sim = 1'b1;
	$display("Case 12: Right and reset on");

	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000

	right_sim = 1'b0;
	reset_sim = 1'b0;
	$display("Case 13: Everything off");

	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000
	$display("%b", out_sim);
	#100000000

	$stop;
end

endmodule