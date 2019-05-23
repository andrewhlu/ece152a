module statemachine(
	input clock,
	input reset,
	input left,
	input right,
	input hazard,
	input brake,
	output reg [5:0] out
);

reg [5:0] cs = 6'b000000;

always @* begin
	out = cs;
end

always @(posedge clock) begin
	casex ({cs, reset, left, right, hazard, brake})
		11'bxxxxxx1xxxx: cs = 6'b000000;
		11'bxxxxxx00000: cs = 6'b000000;
		11'b00000001000: cs = 6'b001000;
		11'b00100001000: cs = 6'b011000;
		11'b01100001000: cs = 6'b111000;
		11'b11100001000: cs = 6'b000000;
		11'bxxxxxx01000: cs = 6'b000000;
		11'b00000000100: cs = 6'b000100;
		11'b00010000100: cs = 6'b000110;
		11'b00011000100: cs = 6'b000111;
		11'b00011100100: cs = 6'b000000;
		11'bxxxxxx00100: cs = 6'b000000;
		11'bxxxxxx000x1: cs = 6'b111111;
		11'bxxxxxx011x1: cs = 6'b111111;
		11'bxxxxxx0xx11: cs = 6'b111111;
		11'b000000010x1: cs = 6'b001111;
		11'b001000010x1: cs = 6'b011111;
		11'b011000010x1: cs = 6'b111111;
		11'b111000010x1: cs = 6'b000111;
		11'b000000001x1: cs = 6'b111100;
		11'b000100001x1: cs = 6'b111110;
		11'b000110001x1: cs = 6'b111111;
		11'b000111001x1: cs = 6'b111000;
		11'b000111010x1: cs = 6'b001111;
		11'b001111010x1: cs = 6'b011111;
		11'b011111010x1: cs = 6'b111111;
		11'b111111010x1: cs = 6'b000111;
		11'bxxxxxx010x1: cs = 6'b000111;
		11'b111000001x1: cs = 6'b111100;
		11'b111100001x1: cs = 6'b111110;
		11'b111110001x1: cs = 6'b111111;
		11'b111111001x1: cs = 6'b111000;
		11'bxxxxxx001x1: cs = 6'b111000;
		11'b00011101000: cs = 6'b001000;
		11'b00111101000: cs = 6'b011000;
		11'b01111101000: cs = 6'b111000;
		11'b11111101000: cs = 6'b000000;
		11'b11100000100: cs = 6'b000100;
		11'b11110000100: cs = 6'b000110;
		11'b11111000100: cs = 6'b000111;
		11'b11111100100: cs = 6'b000000;
		11'b0000000xx10: cs = 6'b111111;
		11'bxxxxxx0xx10: cs = 6'b000000;
		11'b000000011x0: cs = 6'b111111;
		11'bxxxxxx011x0: cs = 6'b000000;
	endcase
end

endmodule