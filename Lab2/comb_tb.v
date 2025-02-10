`timescale 1ns/10ps

module mux_tb;
    reg [7:0] x = 8'd0;
    reg [2:0] a = 3'd0;
    reg c;
    wire y_a, y_p;

    mux_8_1_assign mux_a(
        x[0], x[1], x[2], x[3],
        x[4], x[5], x[6], x[7],
        a[0], a[1], a[2], c   , 
        y_a);

    mux_8_1_proc mux_p(
        x[0], x[1], x[2], x[3],
        x[4], x[5], x[6], x[7],
        a[0], a[1], a[2], c   , 
        y_p);

    initial begin
        $dumpfile(`DUMPFILE);
        $dumpvars(1, mux_tb);
        c = 1;
        for(integer adr = 0; adr < 8; adr++) begin
            a = adr;
            for(integer xi = 0; xi < 9; xi++)
                #10 x = (1 << xi);
        end

        c = 0;
        for(integer adr = 0; adr < 8; adr++) begin
            a = adr;
            for(integer xi = 0; xi < 8; xi++)
                #10 x = (1 << xi);
        end

        #10 $finish;
    end
endmodule