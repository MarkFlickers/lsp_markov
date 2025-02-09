`timescale 1ns/1ns

module mux_8_1 (
    input x1, x2, x3, x4,
    input x5, x6, x7, x8,
    input a1, a2, a3, c ,
    output reg y    );
    
    //wire [2:0] adr = {a1, a2, a3};
    //assign adr = {a1, a2, a3};
    //assign y = c?
    always @(*) begin
        if(c == 1) begin
            case ({a1, a2, a3})
                3'd0: y = ~x1;
                3'd1: y = ~x2;
                3'd2: y = ~x3;
                3'd3: y = ~x4;
                3'd4: y = ~x5;
                3'd5: y = ~x6;
                3'd6: y = ~x7;
                3'd7: y = ~x8;
                default: y = 0;
            endcase
        end
        else y = 1;
    end
endmodule

module mux_tb;
    reg [7:0] x = 8'd0;
    reg [2:0] a = 3'd0;
    reg c;
    wire y;

    mux_8_1 mux(
        x[0], x[1], x[2], x[3],
        x[4], x[5], x[6], x[7],
        a[0], a[1], a[2], c   , 
        y);

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