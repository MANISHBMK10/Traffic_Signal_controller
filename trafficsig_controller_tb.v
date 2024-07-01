`define TRUE 1'b1
`define FALSE 1'b0
module traffic_control_test();
wire [1:0] hwrd_sig, crd_sig;
reg car_on_croad, clear, clk;

traffic_control tc1(hwrd_sig, crd_sig, clk, car_on_croad, clear);

initial 
begin
    clk =  `FALSE;
    forever #5 clk = ~clk;
end
initial 
begin
car_on_croad = `FALSE;
clear = `TRUE;
repeat(5) @(negedge clk);
clear = `FALSE;
#200 car_on_croad = `TRUE;
#100 car_on_croad = `FALSE;
#200 car_on_croad = `TRUE;
#200 car_on_croad = `FALSE;
#100 $stop;
end
initial
begin
    $monitor($time, "hwrd = %b, crd = %b x =%b", hwrd_sig, crd_sig, car_on_croad);
end
endmodule