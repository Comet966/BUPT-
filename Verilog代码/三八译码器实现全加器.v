//使用三八译码器实现全加器.

module fadd(a, b, Cin, Cout, Sum);
input a,b,Cin;
output Cout,Sum;
wire [2:0] c;//in
wire [7:0] r;//out

//例化
decoder3_8 de0(.A0(a),.A1(b),.A2(Cin),.Y_bar(r));


assign Sum  = ~(r[1] & r[2] & r[4] & r[7]);
assign Cout = ~(r[3] & r[5] & r[6] & r[7]);

endmodule
