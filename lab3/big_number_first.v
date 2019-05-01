module big_number_first (
	input [7:0] aIn,
	input [7:0] bIn,
	output reg [7:0] aOut,
	output reg [7:0] bOut
);

wire [2:0] aExp;
wire [4:0] aMan;
wire [2:0] bExp;
wire [4:0] bMan;

assign aExp = aIn[7:5];
assign aMan = aIn[4:0];
assign bExp = bIn[7:5];
assign bMan = bIn[4:0];

always @* begin
	if((aExp < bExp) || (aExp == bExp && aMan < bMan))
		begin
			aOut = {bExp, bMan};
			bOut = {aExp, aMan};
		end
	else
		begin
			aOut = {aExp, aMan};
			bOut = {bExp, bMan};
		end
end

endmodule