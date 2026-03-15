// Easy
// Prompt
// Given an input (din), output (dout) a 1 if its binary representation is a palindrome and a 0 otherwise.
// A palindrome binary representation means that the binary representation has the same sequence of bits whether you read it from left to right or right to left. Leading 0s are considered part of the input binary representation.
// Input and Output Signals
// din - Input value
// dout - 1 if the binary representation is a palindrome, 0 otherwise

module model #(
    parameter DATA_WIDTH = 32
) (
    input [DATA_WIDTH-1:0] din,
    output logic dout
);

  logic [DATA_WIDTH-1:0] reversed;

  assign reversed = {<<{din}};

  assign dout = din == reversed;
endmodule
