module simple_calc_bcd (
    input  wire [15:0] SW,
    output wire [15:0] LED
);

    wire [3:0] X      = SW[3:0];
    wire [3:0] Y      = SW[7:4];
    wire [1:0] op_sel = SW[15:14];

    wire [7:0] magnitude;
    wire       is_negative, carry_out, overflow;

    simple_calc U_CALC (
        .X(X),
        .Y(Y),
        .op_sel(op_sel),
        .magnitude(magnitude),
        .is_negative(is_negative),
        .carry_out(carry_out),
        .overflow(overflow)
    );

    wire [11:0] bcd;
    
    reg [7:0] bin_to_bcd;

    always @(X, Y, op_sel, magnitude, is_negative) begin
        if (op_sel == 2'b01) begin

            if (X < Y) begin
                bin_to_bcd = {4'b0, (Y - X)};
            end else begin
                bin_to_bcd = {4'b0, (X - Y)};
            end
        end else begin
            bin_to_bcd = magnitude;
        end
    end

    bin2bcd U_BIN2BCD (
        .bin(bin_to_bcd),
        .bcd(bcd)
    );

    assign LED[11:0] = bcd;
    assign LED[12]   = 1'b0;
    assign LED[13]   = is_negative;
    assign LED[14]   = carry_out;
    assign LED[15]   = overflow;

endmodule
