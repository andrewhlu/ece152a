module test(
	input [7:0] aIn,
	output [7:0] aOut
);

wire [2:0] aExp;
wire [4:0] aMan;

assign aExp = aIn[7:5];
assign aMan = aIn[4:0];

assign aOut = {aExp, aMan};

endmodule