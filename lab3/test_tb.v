module test_tb ();

reg [7:0] sim_aIn;
wire [7:0] sim_aOut;

test tb(
	.aIn(sim_aIn),
	.aOut(sim_aOut)
);

initial begin
	sim_aIn = 8'b00011111;
  #5
  $display("Output is %b, expected %b", sim_aOut, sim_aIn);

  $stop;
end

endmodule