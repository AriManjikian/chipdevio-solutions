// Medium
// Prompt
// A Ripple Carry Adder (RCA) is a multi-bit addition circuit composed of a number of cascaded full adders (FAs).  In an RCA, the carry-out bit of stage i is propagated to the carry-in port, cin, of stage i+1 so that the carry bit ripples through the entire chain of FAs, from the least significant bit (LSB) to the most significant bit (MSB).
// Use the solution to question 22 (Full Adder) and implement a flexible data width RCA.  The RCA module takes two integers a and b, and produces two output words sum and cout_fa1.  Output cout_fa1 corresponds to the carry-out nets of each FA stage.
// Important
// This question must be solved using a multimodule approach.  That is, there must be a module for a single-bit FA that is instantiated DATA_WIDTH times in order to build a multi-bit RCA.  You will be able to use the solution to question 22 (Full Adder) as the single-bit FA module.
// Input and Output Signals
// a - First operand input word
// b - Second operand input word
// sum - Output word corresponding to a plus b operation (note that sum has DATA_WIDTH+1 bits to account for the carry-out/overflow bit)
// cout_int - Internal carry-out nets, ouputs of the full adder instances


`include "full_adder.sv"
module model #(
    parameter DATA_WIDTH = 8
) (
    input [DATA_WIDTH-1:0] a,
    input [DATA_WIDTH-1:0] b,
    output logic [DATA_WIDTH-0:0] sum,
    output logic [DATA_WIDTH-1:0] cout_int
);


  logic [  DATA_WIDTH:0] carry_arr = '0;
  logic [DATA_WIDTH-1:0] res = '0;

  genvar i;
  for (i = 0; i < DATA_WIDTH; i++) begin : g_ripple_adder
    full_adder fa (
        .a(a[i]),
        .b(b[i]),
        .cin(carry_arr[i]),
        .sum(res[i]),
        .cout(carry_arr[i+1])
    );
  end

  assign cout_int = carry_arr[DATA_WIDTH:1];
  assign sum = {carry_arr[DATA_WIDTH], res};
endmodule
