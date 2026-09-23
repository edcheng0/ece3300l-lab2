module csa_multiplier (
    input  wire [3:0] X,
    input  wire [3:0] Y,
    output wire [7:0] P
);

    wire [3:0] pp0 = Y[0] ? X : 4'b0;
    wire [3:0] pp1 = Y[1] ? X : 4'b0;
    wire [3:0] pp2 = Y[2] ? X : 4'b0;
    wire [3:0] pp3 = Y[3] ? X : 4'b0;

    wire [7:0] pp0_ext = {4'b0, pp0};
    wire [7:0] pp1_ext = {3'b0, pp1, 1'b0};
    wire [7:0] pp2_ext = {2'b0, pp2, 2'b0};
    wire [7:0] pp3_ext = {1'b0, pp3, 3'b0};

    wire [7:0] sum1   = pp0_ext ^ pp1_ext ^ pp2_ext;
    wire [7:0] carry1 = ((pp0_ext & pp1_ext) | (pp1_ext & pp2_ext) | (pp0_ext & pp2_ext)) << 1;

    wire [7:0] sum2   = sum1 ^ carry1 ^ pp3_ext;
    wire [7:0] carry2 = ((sum1 & carry1) | (carry1 & pp3_ext) | (sum1 & pp3_ext)) << 1;

    assign P = sum2 + carry2;

endmodule
