module add_3 (
    input  wire [3:0] A,
    output wire [3:0] S
);

    assign S = (A >= 4'd5) ? (A + 4'd3) : A;

endmodule
