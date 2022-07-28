module assignment3(x,clock,y,a,b,c,d,e,f,g,z);
    
    output a;
    output b;
    output c;
    output d;
    output e;
    output f;
    output g;
    output reg clock;
    wire clk;

qlal4s3b_cell_macro u_qlal4s3b_cell_macro( .Sys_Clk0(clk));
 reg [26:0] delay ;

input x; 
input y; 
output reg z;
parameter  s0=3'b000, 
  s1=3'b001, 
  s2=3'b010, 
  s3=3'b011;
  
  

reg [2:0] currentstate, nextstate; 

function automatic [6:0] seg;

    input [2:0] num_i; 

begin
    case (num_i)   	
        
      s0 : seg =7'b0000001;
      s1 : seg =7'b1001111;
      s2 : seg =7'b0010010;
      s3 : seg =7'b0000110;
      
      endcase
        
    
end
endfunction
always @(posedge clk)
begin
delay=delay+1;
if(delay>20000000) 
begin
clock = !clock;
delay=0;
end
end



 
always @(posedge clock)
begin
 case(currentstate) 
 s0:begin
  if(x==0 && y==0)
   begin
   nextstate = s2;
   currentstate = nextstate;
    {a,b,c,d,e,f,g} = seg(currentstate);
     
    end
   else if(x==0 && y==1)
   begin
   nextstate = s0;
   currentstate = nextstate;
    {a,b,c,d,e,f,g} = seg(currentstate);
    end
    
    else if(x==1 && y==0)
    begin
    nextstate = s3;
   currentstate = nextstate;
    {a,b,c,d,e,f,g} = seg(currentstate);
    end 
  
 
   
   
  else
  begin
   nextstate = s1;
      currentstate = nextstate;
    {a,b,c,d,e,f,g} = seg(currentstate);
   end
 
 end
 
 
 s1:
  begin
  
  if(x==0 && y==0)
   begin
   nextstate = s1;
   currentstate = nextstate;
    {a,b,c,d,e,f,g} = seg(currentstate);
    z = 1;
    
    end
   else if(x==0 && y==1)
   begin
   nextstate = s1;
   currentstate = nextstate;
    {a,b,c,d,e,f,g} = seg(currentstate);
    end
    
    else if(x==1 && y==0)
    begin
    nextstate = s2;
   currentstate = nextstate;
    {a,b,c,d,e,f,g} = seg(currentstate);
    end 
  
 
   
   
  else
  begin
   nextstate = s3;
      currentstate = nextstate;
    {a,b,c,d,e,f,g} = seg(currentstate);
   end
   
 end
 
 
  s2:begin
  if(x==0 && y==0)
   begin
   nextstate = s2;
   currentstate = nextstate;
    {a,b,c,d,e,f,g} = seg(currentstate);
    end
   else if(x==0 && y==1)
   begin
   nextstate = s2;
   currentstate = nextstate;
    {a,b,c,d,e,f,g} = seg(currentstate);
    end
    
    else if(x==1 && y==0)
    begin
    nextstate = s0;
   currentstate = nextstate;
    {a,b,c,d,e,f,g} = seg(currentstate);
    end 
  
 
   
   
  else
  begin
   nextstate = s2;
      currentstate = nextstate;
    {a,b,c,d,e,f,g} = seg(currentstate);
   end
 
 end 
 
  s3:begin
  if(x==0 && y==0)
   begin
   nextstate = s3;
   currentstate = nextstate;
    {a,b,c,d,e,f,g} = seg(currentstate);
    z = 1;
    end
   else if(x==0 && y==1)
   begin
   nextstate = s2;
   currentstate = nextstate;
    {a,b,c,d,e,f,g} = seg(currentstate);
    end
    
    else if(x==1 && y==0)
    begin
    nextstate = s2;
   currentstate = nextstate;
    {a,b,c,d,e,f,g} = seg(currentstate);
    end 
  
 
   
   
  else
  begin
   nextstate = s3;
      currentstate = nextstate;
    {a,b,c,d,e,f,g} = seg(currentstate);
    z = 1;
    
   end
   
 end
 

 default:begin
       nextstate = s0;
    currentstate = nextstate;
    {a,b,c,d,e,f,g} = seg(currentstate);
    end
 
 endcase
end
//assign {a,b,c,d,e,f,g} = seg(nextstate);

 


endmodule
