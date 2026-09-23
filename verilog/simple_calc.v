module simple_calc (
    input  wire [3:0] X,
    input  wire [3:0] Y,
    input  wire [1:0] op_sel,
    output wire [7:0] magnitude,
    output wire       is_negative,
    output wire       carry_out,
    output wire       overflow
);

    wire is_mult = op_sel[1];
    wire sub     = op_sel[0] & ~op_sel[1];

    wire [3:0] as_result;
    wire       as_carry, as_overflow;

    adder_subtractor U_ADDSUB (
        .X(X),
        .Y(Y),
        .sub(sub),
        .result(as_result),
        .carry_out(as_carry),
        .overflow(as_overflow)
    );

    wire [3:0] abs_X = X[3] ? (~X + 4'b1) : X;
    wire [3:0] abs_Y = Y[3] ? (~Y + 4'b1) : Y;
    wire [7:0] mult_result;

    csa_multiplier U_MULT (
        .X(abs_X), 
        .Y(abs_Y),
        .P(mult_result)
    );

    wire as_negative = as_result[3];

    wire [4:0] extended_as    = {1'b0, as_result};
    wire [4:0] as_magnitude_5 = as_negative ? (~extended_as + 5'b1) : extended_as;

    assign magnitude   = is_mult ? mult_result   : {3'b0, as_magnitude_5};
    assign is_negative = is_mult ? (X[3] ^ Y[3]) : as_negative; // Sign bit XOR for mult
    assign carry_out   = is_mult ? 1'b0          : as_carry;
    assign overflow    = is_mult ? 1'b0          : as_overflow;

endmodule
