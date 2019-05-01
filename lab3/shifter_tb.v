module shifter_tb ();

reg [4:0] sim_in;
reg [2:0] sim_distance;
reg sim_direction;
wire [4:0] sim_out;

shifter test (
	.in(sim_in),
	.distance(sim_distance),
	.direction(sim_direction),
	.out(sim_out)
);

initial begin
	sim_in = 5'b11001;
	sim_distance = 3'b000;
	sim_direction = 1'b0;
	#5
	$display("Output is %b, we expected %b", sim_out, 5'b11001);

	sim_in = 5'b11001;
	sim_distance = 3'b001;
	sim_direction = 1'b0;
	#5
	$display("Output is %b, we expected %b", sim_out, 5'b10010);

	sim_in = 5'b11001;
	sim_distance = 3'b010;
	sim_direction = 1'b0;
	#5
	$display("Output is %b, we expected %b", sim_out, 5'b00100);

	sim_in = 5'b11001;
	sim_distance = 3'b011;
	sim_direction = 1'b0;
	#5
	$display("Output is %b, we expected %b", sim_out, 5'b01000);

	sim_in = 5'b11001;
	sim_distance = 3'b100;
	sim_direction = 1'b0;
	#5
	$display("Output is %b, we expected %b", sim_out, 5'b10000);

	sim_in = 5'b11001;
	sim_distance = 3'b101;
	sim_direction = 1'b0;
	#5
	$display("Output is %b, we expected %b", sim_out, 5'b00000);

	sim_in = 5'b11001;
	sim_distance = 3'b000;
	sim_direction = 1'b1;
	#5
	$display("Output is %b, we expected %b", sim_out, 5'b11001);

	sim_in = 5'b11001;
	sim_distance = 3'b001;
	sim_direction = 1'b1;
	#5
	$display("Output is %b, we expected %b", sim_out, 5'b01100);

	sim_in = 5'b11001;
	sim_distance = 3'b010;
	sim_direction = 1'b1;
	#5
	$display("Output is %b, we expected %b", sim_out, 5'b00110);

	sim_in = 5'b11001;
	sim_distance = 3'b011;
	sim_direction = 1'b1;
	#5
	$display("Output is %b, we expected %b", sim_out, 5'b00011);

	sim_in = 5'b11001;
	sim_distance = 3'b100;
	sim_direction = 1'b1;
	#5
	$display("Output is %b, we expected %b", sim_out, 5'b00001);

	sim_in = 5'b11001;
	sim_distance = 3'b101;
	sim_direction = 1'b1;
	#5
	$display("Output is %b, we expected %b", sim_out, 5'b00000);

	$stop;
end

endmodule