decoder.v: Takes in a 3-bit binary input and outputs a 
corresponding 7-bit value that we use to control the 7-bit digit display.

counter.v: Takes in 5 inputs (clock input, 3-bit max_count, enable, reset, and direction) and outputs
a 3-bit count that gets fed into the decoder. The counter updates on every rising edge of the clock.
In addition, the max_count controls how high the count is allowed to go. The enable will hold the
current value of the counter if set to low. The reset will reset the counter to either 0 or max_count depending on
the direction bit, and the direction bit will count up if direction is high and count down if direction is low.

main.v: Main just instantiates the two modules and links the inputs and outputs of each module together.