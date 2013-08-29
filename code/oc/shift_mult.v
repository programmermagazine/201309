module mult8(p,x,y); 
output [15:0]p;
input [7:0]x,y; 
reg [15:0]p;
reg [15:0]a;
integer i; 

always @(x , y)
begin 
  a=x;
  p=0; // needs to zeroed
  for(i=0;i<8;i=i+1)
  begin
    if(y[i])
      p=p+a; // must be a blocking assignment
    a=a<<1;
  end
end
endmodule
