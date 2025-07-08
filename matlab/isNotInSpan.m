function flag = isNotInSpan(Hz,c,n)
c = c(:);
 H_test = gf([gf(Hz,2);c'],2);
 r = rank(H_test);
 if r > 2*n-1
    flag =  true;
 else
     flag = false;
 end
end