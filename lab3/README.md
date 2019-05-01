# Lab 3

### Mason Corey, Andrew Lu

We believe that this design meets the assignment's specifications and made sure that the outputs were normalized properly.

We tested the above with the following cases:

* Normal Cases

```
	sim_aIn = 8'b00011110;
	sim_bIn = 8'b00011000;
	#5
	$display("Output is %b, we expected %b", sim_result, 8'b00111011);
```

* Saturation

```
	sim_aIn = 8'b11111111;
	sim_bIn = 8'b00111111;
	#5
	$display("Output is %b, we expected %b", sim_result, 8'b11111111);
```

* Zero Inputs

```
	sim_aIn = 8'b00000000;
	sim_bIn = 8'b00000000;
	#5
	$display("Output is %b, we expected %b", sim_result, 8'b00000000);
```

* Precision of Outputs (high exponent plus small exponent)

```
	sim_aIn = 8'b11111110;
	sim_bIn = 8'b00111111;
	#5
	$display("Output is %b, we expected %b", sim_result, 8'b11111110);
```

* All exponents maxed, all mantissas zero

```
	sim_aIn = 8'b11100000;
	sim_bIn = 8'b11100000;
	#5
	$display("Output is %b, we expected %b", sim_result, 8'b00000000);
```

* One input is zero but with a non-zero exponent

```
	sim_aIn = 8'b00100000;
	sim_bIn = 8'b00000100;
	#5
	$display("Output is %b, we expected %b", sim_result, 8'b00000100);
```
