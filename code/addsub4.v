module fulladder (input a, b, c_in, output sum, c_out);
wire s1, c1, c2;

xor g1(s1, a, b);
xor g2(sum, s1, c_in);
and g3(c1, a,b);
and g4(c2, s1, c_in) ;
xor g5(c_out, c2, c1) ;

endmodule

module adder4(input signed [3:0] a, input signed [3:0] b, input c_in, 
              output signed [3:0] sum, output c_out);
wire [3:0] c;

fulladder fa1(a[0],b[0], c_in, sum[0], c[1]) ;
fulladder fa2(a[1],b[1], c[1], sum[1], c[2]) ;
fulladder fa3(a[2],b[2], c[2], sum[2], c[3]) ;
fulladder fa4(a[3],b[3], c[3], sum[3], c_out) ;

endmodule

module xor4(input [3:0] a, input [3:0] b, output [3:0] y);
  assign y = a ^ b;
endmodule

module addSub4(input op, input signed [3:0] a, input signed [3:0] b, 
               output signed [3:0] sum, output c_out);

wire [3:0] bop;

xor4 x1(b, {op,op,op,op}, bop);
adder4 a1(a, bop, op, sum, c_out);

endmodule

module main;
reg signed [3:0] a;
reg signed [3:0] b;
wire signed [3:0] sum;
reg op;
wire c_out;

addSub4 DUT (op, a, b, sum, c_out);

initial
begin
  a = 4'b0101;
  b = 4'b0000;
  op = 1'b0;
end

always #50 begin
  op=op+1;
  $monitor("%dns monitor: op=%d a=%d b=%d sum=%d", $stime, op, a, b, sum);
end

always #100 begin
  b=b+1;
end

initial #2000 $finish;

endmodule
