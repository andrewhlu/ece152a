module counter_tb ();

reg clock_sim;
reg [2:0] max_count_sim;
reg enable_sim;
reg reset_sim;
reg direction_sim;
wire [2:0] count_sim;

counter test(
	.clock(clock_sim),
	.max_count(max_count_sim),
	.enable(enable_sim),
	.reset(reset_sim),
	.direction(direction_sim),
	.count(count_sim)
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

	#5;

	$display("Output is %b, we expected %b", count_sim, 3'b000);

	#500000000;

	$display("Output is %b, we expected %b", count_sim, 3'b001);

	#500000000;

	$display("Output is %b, we expected %b", count_sim, 3'b001);

	#500000000;

	$display("Output is %b, we expected %b", count_sim, 3'b010);

	#500000000;

	$display("Output is %b, we expected %b", count_sim, 3'b010);

	#500000000;

	$display("Output is %b, we expected %b", count_sim, 3'b011);

	#500000000;

	$display("Output is %b, we expected %b", count_sim, 3'b011);

	#500000000;

	$display("Output is %b, we expected %b", count_sim, 3'b100);

	#500000000;

	$display("Output is %b, we expected %b", count_sim, 3'b100);

	#500000000;

	$display("Output is %b, we expected %b", count_sim, 3'b101);

	#500000000;

	$display("Output is %b, we expected %b", count_sim, 3'b101);

	#500000000;

	$display("Output is %b, we expected %b", count_sim, 3'b000);

	#500000000;

	$display("Output is %b, we expected %b", count_sim, 3'b000);

	#500000000;

	$display("Output is %b, we expected %b", count_sim, 3'b001);

	$stop;
end

endmodule