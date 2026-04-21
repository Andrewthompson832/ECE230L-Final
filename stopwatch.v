//StopWatch: Modulo-60 Counter
module stopwatch(
    input clk,
    input rst,
    input en,
    output [5:0] state     //6-bits to represent the highest number 59
);
    
    wire [5:0] current;
    wire [5:0] next;
    wire c1, c2, c3, c4, c5;
    
    fadd a0(
    .A(current[0]),
    .B(en),
    .Cin(1'b0),
    .Y(next[0]),
    .Cout(c1)
    );
    
    fadd a1(
    .A(current[1]),
    .B(1'b0),
    .Cin(c1),
    .Y(next[1]),
    .Cout(c2)
    );
    
    fadd a2(
    .A(current[2]),
    .B(1'b0),
    .Cin(c2),
    .Y(next[2]),
    .Cout(c3)
    );
   
   fadd a3(
    .A(current[3]),
    .B(1'b0),
    .Cin(c3),
    .Y(next[3]),
    .Cout(c4)
    );
    
    fadd a4(
    .A(current[4]),
    .B(1'b0),
    .Cin(c4),
    .Y(next[4]),
    .Cout(c5)
    );
    
    fadd a5(
    .A(current[5]),
    .B(1'b0),
    .Cin(c5),
    .Y(next[5])
    );
    
    wire count_reset = state[5] & state[4] & state[3] & state[2] & state[1] & ~state[0];
    wire full_reset = count_reset | rst;
    
    dff d0(
    .Default(1'b0),
    .clk(clk),
    .reset(full_reset),
    .D(next[0]),
    .Q(current[0])
    );
    
    dff d1(
    .Default(1'b0),
    .clk(clk),
    .reset(full_reset),
    .D(next[1]),
    .Q(current[1])
    );
    
    dff d2(
    .Default(1'b0),
    .clk(clk),
    .reset(full_reset),
    .D(next[2]),
    .Q(current[2])
    );
    
    dff d3(
    .Default(1'b0),
    .clk(clk),
    .reset(full_reset),
    .D(next[3]),
    .Q(current[3])
    );
    
    dff d4(
    .Default(1'b0),
    .clk(clk),
    .reset(full_reset),
    .D(next[4]),
    .Q(current[4])
    );
    
    dff d5(
    .Default(1'b0),
    .clk(clk),
    .reset(full_reset),
    .D(next[5]),
    .Q(current[5])
    );
    
    assign state = current;
    
    
endmodule




