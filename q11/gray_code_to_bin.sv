// Medium
// Prompt
// Given a value, output its index in the standard Gray code sequence. This is known as converting a Gray code value to binary.
// Each input value's binary representation is an element in the Gray code sequence, and your circuit should output the index of the Gray code sequence the input value corresponds to.
// In the standard encoding the least significant bit follows a repetitive pattern of 2 on, 2 off ( ... 11001100 ... ); the next digit a pattern of 4 on, 4 off ( ... 1111000011110000 ... ); the nth least significant bit a pattern of 2n on 2n off.
// Input and Output Signals
// gray - Input signal, interpreted as an element of the Gray code sequence
// bin - Index of the Gray code sequence the input corresponds to

module model #(
    parameter DATA_WIDTH = 16
) (
    input  logic [DATA_WIDTH-1:0] gray,
    output logic [DATA_WIDTH-1:0] bin
);

  always_comb begin
    bin[DATA_WIDTH-1] = gray[DATA_WIDTH-1];

    for (int i = DATA_WIDTH - 2; i >= 0; i--) bin[i] = bin[i+1] ^ gray[i];
  end

endmodule
