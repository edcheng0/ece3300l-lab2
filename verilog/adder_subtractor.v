module adder_subtractor (
    input  wire [3:0] X,
    input  wire [3:0] Y,
    input  wire       sub,
    output wire [3:0] result,
    output wire       carry_out,
    output wire       overflow
);

    wire [3:0] Yb = sub ? ~Y : Y;
    wire [4:0] sum5 = X + Yb + sub;

    assign result    = sum5[3:0];
    assign carry_out = sum5[4];

    assign overflow  = sub ? ((X[3] != Y[3]) && (result[3] != X[3])) : ((X[3] == Y[3]) && (result[3] != X[3]));


endmodule
