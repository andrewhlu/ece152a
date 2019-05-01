module float_add_tb ();

reg [7:0] sim_aIn;
reg [7:0] sim_bIn;
wire [7:0] sim_result;

float_add test(
	.aIn(sim_aIn),
	.bIn(sim_bIn),
	.result(sim_result)
);

initial begin
	sim_aIn = 8'b00000000;
	sim_bIn = 8'b00000000;
	#5
	$display("Output is %b, we expected %b", sim_result, 8'b00000000);

	sim_aIn = 8'b00001000;
	sim_bIn = 8'b00000011;
	#5
	$display("Output is %b, we expected %b", sim_result, 8'b00001011);

	sim_aIn = 8'b00110001;
	sim_bIn = 8'b00001100;
	#5
	$display("Output is %b, we expected %b", sim_result, 8'b00110111);

	sim_aIn = 8'b10010010;
	sim_bIn = 8'b01011111;
	#5
	$display("Output is %b, we expected %b", sim_result, 8'b10011001);

	sim_aIn = 8'b00011110;
	sim_bIn = 8'b00011000;
	#5
	$display("Output is %b, we expected %b", sim_result, 8'b00111011);

	sim_aIn = 8'b11111110;
	sim_bIn = 8'b11111000;
	#5
	$display("Output is %b, we expected %b", sim_result, 8'b11111111);

	sim_aIn = 8'b11111111;
	sim_bIn = 8'b00111111;
	#5
	$display("Output is %b, we expected %b", sim_result, 8'b11111111);

	sim_aIn = 8'b11111110;
	sim_bIn = 8'b00111111;
	#5
	$display("Output is %b, we expected %b", sim_result, 8'b11111110);

	$stop;
end

endmodule