# Minifloat_Adder
Implementation for a combinational circuit that performs addition on two numbers represented in the IEEE half-precision floating-point format using 8 bits (called minifloat). 
You can read about minifloat here https://en.wikipedia.org/wiki/Minifloat. 

Here I'll be referring to the significand as the 'mantissa'. Note that 'subnormal numbers' refer to non-zero minifloat values whose exponents are '0000', in which case the 
mantissa is extended on the left with a '0'. Similarly, 'normalized numbers' refer to minifloat values that are neither positive infinity, negative infinity, nor NaN. The mantissa 
of 'normalized numbers' is extended on the left with a '1'. Regardless of whether the minifloat value is 'subnormal' or 'normalized', I'll be referring to the extended bit on the
left as 'the hidden bit'. I also refer to the bit to the left of the radix point as 'the hidden bit'. 

The SomeTestCases_WaveForm.png image displays the waveform results of the design against several test cases. For a given time interval of one nanosecond, the top two rows in 
the image display the input values A and B, and the last row indicates the output value (remember that the input and output values are represented in minifloat!).
The VHDL3_schematic.png diagram represents the framework for the Adder.vhd entity and its main constituents - more on this when I explain the implementation.

This repo also contains some sample test bench code with which to test the project using the software tool of your choice (I used ModelSim).

# The Minifloat Addition Algorithm
Even if you're aware of how to add two minifloats, I suggest reading this section as it sheds light on the particular design choices I make in the following section.

The process is the following:

Step 1. Validate the inputs

The following summarizes six special cases of the input values for which we can immediately determine the result:

1. infinity + (-1)*infinity = NaN
2. (-1)*infinity + (-1)*infinity = (-1)*infinity
3. infinity + infinity = infinity
4. infinity + a finite value = infinity
5. (-1)*infinity + a finite value = (-1)*infinity
6. NaN + anything = NaN

Provided the inputs do not match one of the above cases, continue to the following steps.

Step 2. Aligning the Radix points

Align the radix points of the operands by incrementing the exponent (of the operand with the lower exponent value) until the two exponents are equal, and for every increment
of the exponent, you must shift the bits of that same operand's mantissa to the right by one (or shift the radix point one bit to the left). Shifting the mantissa by one bit
to the right for every increment to the exponent ensures that the value of that operand remains the same. Remember the exponent value that both operands now have - this will 
come up later in step 7.

Step 3. Concatenate some zeroes

Concatenate two zeroes to the MSB position of the expanded mantissas (mantissas after having included the hidden bit) of both operands.

Step 4. Two's Complement Conversion (if necessary)

For each operand, if its sign bit was ‘1’ (i.e. the number was negative), then flip all the bits of its expanded mantissa, and add 1 (convert to its 2s complement representation). 
Notice that the mantissa of the operand with a sign bit of ‘0’ is positive, and is already in its 2s complement form (with 1 bit signed extension) as a result of step 3.

Step 5. Add the Mantissas

Perform 2's complement addition with the 2s complement representations of the expanded mantissas of the operands obtained from step 4. The MSB of the sum obtained from this 
operation is the sign bit of the final result.

Step 6. Convert Result to Sign-Magnitude Representation (if necessary)

If the sign bit of the sum in step 5 was ‘1’, then use the method described at the beginning of step 4 (2s complement conversion) to acquire the magnitude of the result. 
If the sign bit was ‘0’ instead, keep the result as is.

Step 7. Normalization (the most complicated step to explain in this format)

This next step involves shifting the radix point of the result obtained in step 6 using a method similar to that which was used in step 2. If you were keeping track of the radix 
point throughout the addition carried out in step 5, you'd recall that the radix point of the result from step 6 remains between the third and 4th bits (counting from the MSB).
There are now three cases (sort of) which describe what to do next:
    
    Case 1: The Hidden Bit Position is Overflowed (the bit to the left of the hidden bit is '1')
    In this case, shift the radix point one position to the left and increment the exponent I asked you to remember from step 1. If the exponent is now "1111", then set the final result
    to either positive or negative infinity (determined by the sign bit obtained in step 5). Otherwise, the sign bit of the final result is the sign bit obtained from step 5, the
    exponent of the final result is the exponent we just incremented by one, and the mantissa of the final result is given by the three bits to the right of the radix point we 
    just shifted.

    Case 2: The Hidden Bit is not Overflowed, and the Hidden Bit is '1'
    No shifting is necessary. The sign bit of the final result is the sign bit obtained from step 5, the exponent of the final result is the exponent I had you remember from step
    2, and the mantissa of the final result is given by the three bits to the right of the radix point in the result of step 6.

    Case 3: The Hidden Bit is not Overflowed, and the Hidden Bit is '0'
    In this case, shift the radix point to the right and decrement the exponent I asked you to remember from step 2 until one of the two following conditions are met: the hidden bit 
    becomes '1', or the exponent reaches "0000".

        Case 3.1: The Exponent is "0000", and the Hidden Bit is still '0'
        If you're in this case, then set the final result to the representation for zero.

        Case 3.2: The Hidden Bit is now '1' (i.e. you're not in case 3.1)
        The sign bit of the final result is the sign bit obtained from step 5, the exponent of the final result is the exponent we just finished decrementing, and the mantissa of the 
        final result is given by the three bits to the right of the radix point we just shifted.

If you've reached this point, you then have all the eight bits you need to construct the final result.

# Implementation
In this design, the function of the FP_Adder entity is simply to determine whether or not the result could immediately be identified as NaN or infinity by checking the conditions laid
out in step 1 of the previous section. If the operands passed all of these initial tests, they are sent to the Adder entity. This entity is described visually in VHDL3_schematic.png.
Note that the “adj” in “20-bit-A(adj)” and “20-bit-B(adj)” (in the VHDL3_schematic.png) stands for “adjusted”.

The Adder entity is what does the heavy lifting in this design. The Adder entity comprises three main components: the preparator, the Adder1, and the Normalizer. 

The preparator receives the operands A and B, performs the appropriate shifting of the mantissa and incrementing of the exponent described in step 2 of the previous section, and then
outputs these shifted (adjusted) versions of A and B in a 20-bit format. The 20 bits come from the following: the left-most two bits which come from the appended zeroes in step 3 of 
the previous section, 4 bits for the mantissa and hidden bit, and 14 extra bits to account for the maximum amount of shifting performed in step 2.

The Adder1 entity then takes as input the adjusted A and B from the preparator as well as the sign bits of A and B. It carries through with steps 4, 5, and 6 from the previous section,
outputting the sign bit of the sum (turns out also to be the sign bit of the final result) and the magnitude of the sum obtained in two’s complement addition from step 5. 

The normalizer then performs step 7 after taking as input the already determined sign bit of the final result and the magnitude of the sum of the two's complement addition from step 5 (both passed from the Adder1 entity). The normalizer appropriately handles the cases when the final result must be set to zero or infinity, and if one of such cases isn’t triggered, the 
normalizer concatenates the sign bit outputted from the Adder1, the exponent outputted from the preparator after having possibly been incremented or decremented accordingly, and the 
appropriately shifted mantissa it has determined, all to produce the final result.

I think an in-depth explanation of the VHDL code here would take away from the understanding of the implementation I would like to impart. However, I encourage you to look through
the code for a more 'low-level' description of all the entities and their implementations mentioned in this section. 

It’s also worth noting that the preparator has a couple of sub-components. It is comprised of one smaller component named the super-comparator (sup_comp.vhd is its file name), which in
turn was designed using two 4-bit comparators that work to output '1' if the first input is greater than the second, '0' otherwise. However, these components are less significant and 
don’t contribute much to the overall understanding of the design, hence they are not elaborated on any further.
