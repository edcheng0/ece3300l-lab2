`timescale 1ns / 1ps

module tb_bin2bcd();

    reg [7:0] bin;
    wire [11:0] bcd;

    bin2bcd uut (
        .bin(bin),
        .bcd(bcd)
    );

    initial begin
        bin = 8'd0;
        #100;
        
        // Test 1: Decimal 8
        bin = 8'd8; 
        #100;
        
        // Test 2: Decimal 15
        bin = 8'd15; 
        #100;
        
        // Test 3: Decimal 143
        bin = 8'd143; 
        #100; 

        $finish;
    end
      
endmodule
