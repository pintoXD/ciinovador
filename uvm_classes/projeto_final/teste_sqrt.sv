`timescale 1ns/1ps
module teste_sqrt (
);

real a, b, c;

initial begin
    #10;
    a = 36;
    b = 3.1415;

    c = $sqrt(b);
    #10;
    $display("sqrt(a) = %f", $sqrt(a));
    $display("sqrt(b) = %f", $sqrt(b));
    $display("sqrt(a) = %f", c);
    #10;
end
    
endmodule
