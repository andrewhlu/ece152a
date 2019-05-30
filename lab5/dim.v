module dim(
	input [5:0] in,
	input clock,
	input lights,
	output reg [5:0] out
);

always @* begin
	if(!lights)
		out = in;
	else begin
		if(!in[5])
			out[5] = clock;
		else
			out[5] = 1'b1;

		if(!in[4])
			out[4] = clock;
		else
			out[4] = 1'b1;

		if(!in[3])
			out[3] = clock;
		else
			out[3] = 1'b1;

		if(!in[2])
			out[2] = clock;
		else
			out[2] = 1'b1;

		if(!in[1])
			out[1] = clock;
		else
			out[1] = 1'b1;

		if(!in[0])
			out[0] = clock;
		else
			out[0] = 1'b1;
	end
end

endmodule