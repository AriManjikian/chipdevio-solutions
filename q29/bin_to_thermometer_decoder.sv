// Easy
// Prompt
// Thermometer (a.k.a. unary) coding is frequently used in digital systems applications to represent a natural number.  In a thermometer code, a N-bit binary number is represented by a (2 ** N)-bit digital word, which has m zeros followed by (N - m) ones or vice-versa.
// In this question, implement a binary to thermometer decoder circuit using Verilog.  The input, din, is an 8-bit unsigned binary word, and the output dout is the thermometer code representation of the input at any time. The output is 256-bit long;  dout has m zeros followed by (256 - m) ones.
// Input and Output Signals
// din - Binary, unsigned input word
// dout - Thermometer output word
module model #(
    parameter DATA_WIDTH = 8
) (
    input [DATA_WIDTH-1:0] codeIn,
    output logic isThermometer
);

  always_comb begin
    if (codeIn == 0 || codeIn == {DATA_WIDTH{1'b1}}) isThermometer = 0;
    else isThermometer = (codeIn & (codeIn + 1)) == 0;
  end

endmodule
