// Created by Surya Atchyuth, Veerubhotla
class primeGen;
  randc bit [6:0]num;
  int UL, LL;
  
  function new(int L1, int L2);
    LL=L1;
    UL=L2;
  endfunction
  
  constraint range{
                   num>=LL  && num<=UL;
                   num==2 || num%2!=0;
                   num==3 || num%3!=0;
                   num==5 || num%5!=0;
                   num==7 || num%7!=0;
                  };
endclass


module prime;
  int LL=1, UL=100;   //range
  
  primeGen pv=new(LL,UL);
  int range = UL/$ln(UL);
  int result[$];
  
  initial begin
    repeat (range) begin
        pv.randomize();
        result.push_back(pv.num);
    end
  end
  
  final begin
    result.sort();
    $display(result);
  end
  
  
endmodule
