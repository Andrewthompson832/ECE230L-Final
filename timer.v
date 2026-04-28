//Timer: Mod-60 downcounter with synchronous load
module timer(
    input clk,
    input rst,
    input en,               //Enables or Disables clock
    input load,             //If load=1, load the counter with "load_value"
    input [5:0] load_value, //Value to load into counter register. Counter will then start counting from this value
    output [5:0] state    //6-bits to represent the highest number 59
);

    reg [5:0] current;
    wire D0, D1, D2, D3, D4, D5;
    
    always @(posedge load) begin
        current <= load_value;
    end
    
    always @(posedge clk) begin
        if (en)
            if(current[0] | current[1] | current[2] | current[3] | current[4] | current[5]) 
                current[0] <= ~current[0];
     end
     
     assign D0 = current[0];
     assign D1 = current[1] ^ current[0];
     assign D2 = current[2] ^ (~current[1] & current[0]);    
     assign D3 = current[3] ^ (~current[2] & ~current[1] & current[0]);
     assign D4 = current[4] ^ (~current[3] & ~current[2] & ~current[1] & current[0]);
     assign D5 = current[5] ^ (~current[4] & ~current[3] & ~current[2] & ~current[1] & current[0]);

    dff d0(
        .Default(1'b0),
        .D(D0),
        .clk(clk),
        .reset(rst),
        .Q(state[0])
    );

    dff d1(
        .Default(1'b0),
        .D(D1),
        .clk(clk),
        .reset(rst),
        .Q(state[1])
    );

    dff d2(
        .Default(1'b0),
        .D(D2),
        .clk(clk),
        .reset(rst),
        .Q(state[2])
    );

    dff d3(
        .Default(1'b0),
        .D(D3),
        .clk(clk),
        .reset(rst),
        .Q(state[3])
    );

    dff d4(
        .Default(1'b0),
        .D(D4),
        .clk(clk),
        .reset(rst),
        .Q(state[4])
    );

    dff d5(
        .Default(1'b0),
        .D(D5),
        .clk(clk),
        .reset(rst),
        .Q(state[5])
    );
            

endmodule
