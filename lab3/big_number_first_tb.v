module big_number_first_tb ();

reg [7:0] sim_aIn, sim_bIn;
wire [7:0] sim_aOut, sim_bOut;

big_number_first test (
	.aIn(sim_aIn),
	.bIn(sim_bIn),
	.aOut(sim_aOut),
	.bOut(sim_bOut)
);

initial begin
	sim_aIn = 8'b00001000;
	sim_bIn = 8'b00000011;
	#5
	$display("Output is %b and %b, we expected %b and %b", sim_aOut, sim_bOut, sim_aIn, sim_bIn);

	sim_aIn = 8'b00000011;
	sim_bIn = 8'b00001000;
	#5
	$display("Output is %b and %b, we expected %b and %b", sim_aOut, sim_bOut, sim_bIn, sim_aIn);

	sim_aIn = 8'b00110001;
	sim_bIn = 8'b00001100;
	#5
	$display("Output is %b and %b, we expected %b and %b", sim_aOut, sim_bOut, sim_aIn, sim_bIn);

	sim_aIn = 8'b00001100;
	sim_bIn = 8'b00110001;
	#5
	$display("Output is %b and %b, we expected %b and %b", sim_aOut, sim_bOut, sim_bIn, sim_aIn);

	sim_aIn = 8'b11111110;
	sim_bIn = 8'b11111111;
	#5
	$display("Output is %b and %b, we expected %b and %b", sim_aOut, sim_bOut, sim_bIn, sim_aIn);

	sim_aIn = 8'b11111111;
	sim_bIn = 8'b11111110;
	#5
	$display("Output is %b and %b, we expected %b and %b", sim_aOut, sim_bOut, sim_aIn, sim_bIn);

	sim_aIn = 8'b11011111;
	sim_bIn = 8'b11111111;
	#5
	$display("Output is %b and %b, we expected %b and %b", sim_aOut, sim_bOut, sim_bIn, sim_aIn);

	sim_aIn = 8'b11111111;
	sim_bIn = 8'b11011111;
	#5
	$display("Output is %b and %b, we expected %b and %b", sim_aOut, sim_bOut, sim_aIn, sim_bIn);

	$stop;
end

endmodule