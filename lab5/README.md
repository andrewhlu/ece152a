# Lab 5

We started this lab by building a state table in Excel listing every possible combination of inputs and their outputs. The full table is in the Excel spreadsheet attached. 

These are the cases we accounted for:
* Reset
* Default (everything off)
* Left turn only sequence
* Right turn only sequence
* Brake only
* Brake (override hazard)
* Left turn brake (override left turn)
* Right turn brake (override right turn)
* Normal left turn brake
* Normal right turn brake
* Left turn only (override brake left)
* Right turn only (override brake right)
* Hazard (triggered by left right)
* Hazard (triggered by hazard input)

We converted the table into a large `casex` statement by converting each line of the state table into code format using the  `Concatenate` function in Excel.

To create the `dim` module, we created an if statement for each bit of the input to check if the input was zero. If it was, we propagated the `dim_clock` input for that bit instead of keeping it at zero. Nothing was changed if the input bit was one, or if lights was zero.

We then linked the two modules together in `main`. 

The test benches consisted of the following cases:
* Case 1: Everything off
* Case 2: Left on
* Case 3: Right on
* Case 4: Left and right on
* Case 5: Left and hazard on
* Case 6: Right and hazard on
* Case 7: Left and brake on
* Case 8: Right and brake on
* Case 9: Left, right, and brake on
* Case 10: Just brake on
* Case 11: Left and reset on
* Case 12: Right and reset on
* Case 13: Everything off

The output of our test bench is located in `simulation_output.txt`, and the wave diagram can be found in `simulation_wave.png`.