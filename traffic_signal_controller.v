`define TRUE 1'b1
`define FALSE 1'b0
`define RED 2'd0
`define YELLOW 2'd1
`define GREEN 2'd2

                  // hwrd    crd 
`define S0 3'd0   // GREEN   RED
`define S1 3'd1   // YELLOW  RED
`define S2 3'd2   // RED     RED
`define S3 3'd3   // RED     GREEN
`define S4 3'd4   // RED     YELLOW

`define Y2RDELAY 2
`define R2GDELAY 3


module traffic_control(hwrd, crd, clk, x, clear);
input clk, clear;
input x;
output reg [1:0] hwrd, crd;

reg [2:0] state, next_state;

initial 
begin
    state = `S0;
    next_state = `S1;
    hwrd = `GREEN;
    crd = `RED;
end
always@(posedge clk)
begin
state = next_state;

end
always@(state)
begin
case (state)
    `S0: begin
         hwrd = `GREEN;
         crd = `RED;
    end
    `S1: begin
         hwrd = `YELLOW;
         crd = `RED;
    end
    `S2:
    begin hwrd = `RED;
          crd = `RED;
    end
    `S3:
    begin hwrd = `RED;
          crd = `GREEN;
    end
    `S4:begin 
        hwrd = `RED;
        crd = `YELLOW;
    end
    
endcase
end

always@(state or clear or x)
begin
    if(clear)
    next_state = `S0;
    else
    case (state) 
        `S0: begin
            if(x)
        next_state = `S1;
        else next_state = `S0;
        end
        `S1 : begin
            repeat(`Y2RDELAY)@(posedge clk);
            next_state = `S2;
        end
        `S2 : begin
            repeat(`R2GDELAY)@(posedge clk);
            next_state = `S3;
        end
        `S3 : begin
            if(x)
            next_state = `S3;
            else next_state = `S4;
        end
        `S4 : begin
            repeat(`R2GDELAY)@(posedge clk);
            next_state = `S0;
        end
        default : next_state = `S0;

endcase
end
endmodule