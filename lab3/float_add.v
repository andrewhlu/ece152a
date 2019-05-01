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

reg [4:0] resultManShift;
reg [2:0] distance3;
wire [4:0] resultManShift2;

reg [2:0] numToShift1;

wire [2:0] resultExpShift;
assign resultExpShift = resultExp - distance3;

shifter step5(
	.in(resultManShift),
	.distance(distance3),
	.direction(1'b0),
	.out(resultManShift2)
);

always @* begin
	case(adderCout)
		1'b0: resultManShift = resultMan;
		1'b1: resultManShift = {1'b1, resultMan[3:0]};
	endcase

	if(bExpShift == 3'b111 && adderCout == 1'b1)
		// Saturation case
		result = 8'b11111111;
	else if(resultManShift == 5'b00000)
		result = 8'b00000000;
	else 
		// Handling the carry bit from the adder
		begin
			if(resultExp != 3'b000 && resultManShift[4] == 1'b0)
				begin 
					// Normalizing - determining how many bits to shift mantissa
					casex(resultManShift)
						5'b00001: numToShift1 = 3'b100;
						5'b0001x:	numToShift1 = 3'b011;
						5'b001xx: numToShift1 = 3'b010;
						5'b01xxx: numToShift1 = 3'b001;
						default: numToShift1 = 3'b000;
					endcase
				end
			else
				numToShift1 = 3'b000;

			// Normalizing - determining how many bits to shift mantissa
			if(resultExp < numToShift1)
				distance3 = resultExp;
			else if (resultExp >= numToShift1)
				distance3 = numToShift1;
			else
				distance3 = 3'b000;

			result = {resultExpShift, resultManShift2};
		end
end

endmodule