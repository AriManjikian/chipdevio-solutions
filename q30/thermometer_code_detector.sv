// Easy
// Prompt
// Thermometer (a.k.a. unary) coding is frequently used in digital systems applications to represent a natural number.  In a thermometer code, a N-bit binary number is represented by a (2 ** N)-bit digital word, which has m zeros followed by (N - m) ones or vice-versa.
// Implement a thermometer code detector.  The module has two ports, codeIn and isThermometer.  The former is a DATA_WIDTH-bit unsigned binary word, and the latter is the signal that indicates whether or not the input is a thermometer code.  The circuit must support both types of thermometer representations.  For instance, for an input word that is N-bit long, the detector must detect thermometer representations that use m zeros followed by (N - m) ones or m ones followed by (N - m) zeros.  Output isThermometer is one when a thermometer word is detected at the input and zero otherwise.
// Input and Output Signals
// codeIn - Thermometer input word
// isThermometer - Output bit that indicates whether or not an input word is a thermometer code

module model #(
    parameter DATA_WIDTH = 8
) (
    input [DATA_WIDTH-1:0] codeIn,
    output reg isThermometer
);

  logic [$clog2(DATA_WIDTH)-1:0] transitions;
  always_comb begin
    transitions = 0;
    for (int i = 1; i < DATA_WIDTH; i++) begin
      transitions = transitions + (codeIn[i] ^ codeIn[i-1]);
    end
  end
  assign isThermometer = transitions == 1;


endmodule
