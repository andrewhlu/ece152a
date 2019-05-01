module float_add (
	input [7:0] aIn,
	input [7:0] bIn,
	output reg [7:0] result
);

wire [7:0] big_aOut, big_bOut;

big_number_first step1 (
	.aIn(aIn),
	.bIn(bIn),
	.aOut(big_aOut),
	.bOut(big_bOut)
);

wire [2:0] aExp;
wire [4:0] aMan;
wire [2:0] bExp;
wire [4:0] bMan;

assign aExp = big_aOut[7:5];
assign aMan = big_aOut[4:0];
assign bExp = big_bOut[7:5];
assign bMan = big_bOut[4:0];

wire [2:0] distance1;
assign distance1 = aExp - bExp;

wire [2:0] bExpShift;
wire [4:0] bManShift;

assign bExpShift = bExp + distance1;

shifter step2 (
	.in(bMan),
	.distance(distance1),
	.direction(1'b1),
	.out(bManShift)
);

wire [4:0] adderSum;
wire adderCout;

adder step3 (
	.A(aMan),
	.B(bManShift),
	.S(adderSum),
	.Cout(adderCout)
);

wire [2:0] distance2;
assign distance2 = {2'b00, adderCout};

wire [2:0] resultExp;
wire [4:0] resultMan;

assign resultExp = bExpShift + adderCout;

shifter step4 (
	.in(adderSum),
	.distance(distance2),
	.direction(1'b1),
	.out(resultMan)
);

always @* begin
	if(bExpShift == 3'b111 && adderCout == 1'b1)
		result = 8'b11111111;
	else 
		begin
			case(adderCout)
				1'b0: result = {resultExp, resultMan};
				1'b1: result = {resultExp, 1'b1, resultMan[3:0]};
			endcase
		end
end

endmodule