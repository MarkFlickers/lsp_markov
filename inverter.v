`timescale 1ns/10ps

module inverter (
    input x,
    output y);

    assign y = ~x;
endmodule