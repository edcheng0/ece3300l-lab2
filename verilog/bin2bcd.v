module bin2bcd (
    input  wire [7:0]  bin,
    output wire [11:0] bcd
);

    wire [19:0] stage [0:8];

    assign stage[0] = {12'b0, bin};

    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : dabble_stage
            wire [3:0] h_corr, t_corr, o_corr;

            add_3 add3_hundreds (.A(stage[i][19:16]), .S(h_corr));
            add_3 add3_tens     (.A(stage[i][15:12]), .S(t_corr));
            add_3 add3_ones     (.A(stage[i][11:8]),  .S(o_corr));

            assign stage[i+1] = {h_corr[2:0], t_corr[3:0], o_corr[3:0], stage[i][7:0], 1'b0};
        end
    endgenerate

    assign bcd = stage[8][19:8];

endmodule
