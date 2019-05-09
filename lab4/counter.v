module counter (
	input clock,
	input [2:0] max_count,
	input enable,
	input reset,
	input direction,
	output reg [2:0] count
);

reg [2:0] countNext = 3'b000;

always @* begin
	count = countNext;
end

always @(posedge clock) begin
	if(enable)
		begin
			if((reset || countNext == max_count) && direction)
				countNext = 3'b000;
			else if((reset || countNext == 3'b000) && !direction)
				countNext = max_count;
			else if(direction)
				countNext = countNext + 1'b1;
			else if(!direction)
				countNext = countNext - 1'b1;
		end
end

endmodule