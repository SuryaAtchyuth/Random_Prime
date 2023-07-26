// Code your testbench here
// or browse Examples

class primeGen;
  randc bit [6:0]num;
  
  constraint range{
                   num>1  && num<100;
                   num==2 || num%2!=0;
                   num==3 || num%3!=0;
                   num==5 || num%5!=0;
                   num==7 || num%7!=0;
                  };
endclass


module prime;
  primeGen pv=new();
  int range =100/$ln(100);
  int result[$];
  
  initial begin
    repeat (range+3) begin
        pv.randomize();
        result.push_back(pv.num);
    end
  end
  
  final begin
    result.sort();
    $display(result);
  end
  
  
endmodule
