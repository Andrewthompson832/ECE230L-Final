module fadd(

input A, B, Cin,
output Y, Cout
);

assign Y = (A ^ B) ^ Cin;
assign Cout = (A & B) | ((A | B) & Cin);

endmodule
