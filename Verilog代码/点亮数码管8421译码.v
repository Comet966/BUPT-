//点亮七段数码管（8421码进行译码

module fpga_prj3(seg1,seg2,sw,clk);
output [8:0]seg1;
output [8:0]seg2;
input [3:0] sw;
input clk;
reg [8:0]seg1_value;
reg [8:0]seg2_value;
reg [3:0] num1;
reg [3:0] num2;

assign seg1=seg1_value;
assign seg2=seg2_value;

initial begin
num1=4'b0010;
num2=4'b0100;
end

always@(clk)begin
num1 <= sw;
num2 <= sw;
case(num2)
4'h0:seg1_value<=9'h3f;
4'h1:seg1_value<=9'h06; 
4'h2:seg1_value<=9'h5b;
4'h3:seg1_value<=9'h4f;
4'h4:seg1_value<=9'h66;   
4'h5:seg1_value<=9'h6d;  
4'h6:seg1_value<=9'h7d;
4'h7:seg1_value<=9'h07;
4'h8:seg1_value<=9'h7f;
4'h9:seg1_value<=9'h6f;
default:seg1_value <= seg1_value;
endcase

case(num1)
4'h0:seg2_value<=9'h3f;
4'h1:seg2_value<=9'h06; 
4'h2:seg2_value<=9'h5b;
4'h3:seg2_value<=9'h4f;
4'h4:seg2_value<=9'h66;   
4'h5:seg2_value<=9'h6d;  
4'h6:seg2_value<=9'h7d;
4'h7:seg2_value<=9'h07;
4'h8:seg2_value<=9'h7f;
4'h9:seg2_value<=9'h6f;
default:seg2_value <= seg2_value;
endcase
end

endmodule
