`timescale 1ns/10ps

module mux_8_1_assign (
    input x1, x2, x3, x4,
    input x5, x6, x7, x8,
    input a1, a2, a3, c ,
    output y    );
    
    wire [2:0] adr = {a1, a2, a3};
    //assign adr = {a1, a2, a3};
    assign y = c ? ((adr == 3'd0) ? ~x1 :
                    (adr == 3'd1) ? ~x2 :
                    (adr == 3'd2) ? ~x3 :
                    (adr == 3'd3) ? ~x4 :
                    (adr == 3'd4) ? ~x5 :
                    (adr == 3'd5) ? ~x6 :
                    (adr == 3'd6) ? ~x7 :
                    (adr == 3'd7) ? ~x8 :
                     0                   ) : (1);
endmodule