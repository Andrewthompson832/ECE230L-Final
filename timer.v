//Timer: Mod-60 downcounter with synchronous load
module timer(
    input clk,
    input rst,
    input en,               //Enables or Disables clock
    input load,             //If load=1, load the counter with "load_value"
    input [5:0] load_value, //Value to load into counter register. Counter will then start counting from this value
    output [5:0] state     //6-bits to represent the highest number 59
);
    wire [5:0] current;
    wire [5:0] next;
    
    initial begin
        current = 6'b000000;
    
    always (@posedge load)
        current = load_value;
        next = current - 1;

    always (@posedge rst)
          current = 6'b000000;  
    always (@posedge clk)
        if (en)
            current = next;
            next = current - 1;

    dff d0(
        .Default(1'b0),
        .D(current[0]),
        .clk(clk),
        .reset(rst),
        .Q(state[0])
    );

    dff d1(
        .Default(1'b0),
        .D(current[1]),
        .clk(clk),
        .reset(rst),
        .Q(state[1])
    );

    dff d2(
        .Default(1'b0),
        .D(current[2]),
        .clk(clk),
        .reset(rst),
        .Q(state[2])
    );

    dff d3(
        .Default(1'b0),
        .D(current[3]),
        .clk(clk),
        .reset(rst),
        .Q(state[3])
    );

    dff d4(
        .Default(1'b0),
        .D(current[4]),
        .clk(clk),
        .reset(rst),
        .Q(state[4])
    );

    dff d5(
        .Default(1'b0),
        .D(current[5]),
        .clk(clk),
        .reset(rst),
        .Q(state[5])
    );

    assign state = current;
            

endmodule
