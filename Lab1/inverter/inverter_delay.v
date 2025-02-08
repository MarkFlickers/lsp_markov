`timescale 1ns/10ps

module inverter_delay (
    input x,
    output y);
    
    assign #2 y = ~x;
endmodule