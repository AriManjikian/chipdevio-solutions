// Easy
//Prompt
// Build a module which controls a stopwatch timer.
// The timer starts counting when the start button (start) is pressed (pulses) and increases by 1 every clock cycle. When the stop button (stop) is pressed, the timer stops counting. When the reset button (reset) is pressed, the count resets to 0 and the timer stops counting.
// If count ever reaches MAX, then it restarts from 0 on the next cycle.
// stop's functionality takes priority over start's functionality, and reset's functionality takes priority over both stop and start's functionality.
// Input and Output Signals
// clk - Clock signal
// reset - Synchronous reset signal
// start - Start signal
// stop - Stop signal
// count - Current count
// Output signals during reset
// count - 0 when reset is active

module model #(
    parameter DATA_WIDTH = 16,
    MAX = 99
) (
    input clk,
    input reset,
    start,
    stop,
    output logic [DATA_WIDTH-1:0] count
);
  logic active;
  logic [DATA_WIDTH-1:0] c;

  always_ff @(posedge clk) begin
    if (reset) begin
      c <= 0;
      active <= 0;
    end else if (stop) begin
      active <= 0;
    end else if (active | start) begin
      if (c == MAX) begin
        c <= 0;
      end else begin
        c <= c + 1;
      end
      active <= 1;
    end
  end

  assign count = c;
endmodule
