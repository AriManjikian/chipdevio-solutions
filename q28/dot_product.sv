// Medium
// Prompt
// In this question, implement a module that produces the dot product (scalar product) of two equal-length, single dimensional vectors, A = [a1, a2, a3] and B = [b1, b2, b3].  The module has one 8-bit port, din, that is used for entering the input sequences of numbers.  It also has two outputs, run, and dout, which return computation status and dot product of the inputs, respectively.
// Assume the sequence is read in the following order: a1, a2, a3, b1, b2, b3.  A counter can be used to keep track of the sequence of numbers.  Once the 6th number has been registered, output run is asserted, and output dout returns a scalar 18-b unsigned number corresponding to the dot product of the inputs.  In the next cycles, run is de-asserted whereas dout sustains its previous valid value til the next six numbers of input vectors A and B are entered.  At any rising edge of clk, if resetn is logic low, then zero is written to the module's internal registers.  When resetn transitions back from zero to one, run is asserted and dout is produces zero as A · B = 0.
// Input and Output Signals
// din - 8-bit unsigned data input word
// clk - Clock signal
// resetn - Synchronous, active low, reset signal
// dout - Output word corresponding to a dot b operation
// run - Single-bit output signal to indicate a new dot product operation
// Output signals during reset
// dout - 0
// run - 1

module model (
    input [7:0] din,
    input clk,
    input resetn,
    output reg [17:0] dout,
    output reg run
);
  logic [7:0] a[3];
  logic [7:0] b[3];
  logic [2:0] count;
  logic [17:0] product;

  always_ff @(posedge clk) begin
    if (~resetn) begin
      a[0]  <= 0;
      a[1]  <= 0;
      a[2]  <= 0;
      b[0]  <= 0;
      b[1]  <= 0;
      b[2]  <= 0;
      count <= 0;
      run   <= 1;
    end else begin
      if (run) begin
        product <= a[0] * b[0] + a[1] * b[1] + a[2] * b[2];
      end
      if (count < 3) begin
        a[count] <= din;
      end else if (count < 6) begin
        b[count-3] <= din;
      end
      count <= (count == 5) ? 0 : count + 1;
      run   <= (count == 5) ? 1 : 0;
    end
  end

  assign dout = run ? a[0] * b[0] + a[1] * b[1] + a[2] * b[2] : product;

endmodule
