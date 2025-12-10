//使用三目运算符实现三态门
module fpga_prj2(sw,key,led);
input [3:0]sw;
input [3:0] key;
output [7:0] led;

assign led[7:4] = 4'b1111;
//使用sw[0]作为使能信号
assign led[3:0] = sw[0] ? key[3:0] : 4'bzzzz;//等价于4'bz

endmodule
