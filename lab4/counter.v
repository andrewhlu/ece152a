module counter (
	input clock,
	input [2:0] max_count,
	input enable,
	input reset,
	input direction,
	output reg [2:0] count
);

reg [2:0] countNext = 3'b000;

always @(posedge clock, posedge reset) begin
	if(reset || countNext == max_count)
		countNext = 3'b000;
	else
		countNext = countNext + 1'b1;

	count = countNext;
end

// always @* begin
// 	if(enable)
// 		countNext = count + 3'b001;
// end

// if(enable == 1 && reset == 1)
// 	count = max_count*(!direction); //Resets the count to 0 or max_count depending on direction
// else if(direction == 1 && enable == 1)
// 	begin
// 		if(count == max_count)
// 			count = 3'b000;
// 		else
// 			count = count + 1'b1;
// 	end
// else if(direction == 0 && enable == 1)
// 	begin
// 		if(count == 3'b000)
// 			count = max_count;
// 		else
// 			count = count - 1'b1;
// 	end


endmodule