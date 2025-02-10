`timescale 1ns/10ps

module mux_8_1_proc (
    input x1, x2, x3, x4,
    input x5, x6, x7, x8,
    input a1, a2, a3, c ,
    output reg y    );
    
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