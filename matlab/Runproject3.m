j = 0;
for n = 2:30
    A = repCodePCM(n);
    A1 = A; %A1 = rowDeleter(A,3);
    A2 = A; %A2 = rowDeleter(A,3);
    Hx = kron(A1,A2);
    B = spcCodePCM(n);Hz = asymmH(B);
    c_s = [1;zeros(n^2-n,1);ones(n-1,1)];
    for i = n:n^2-n
        if mod(i,n) == 1
            c_s(i) = 1;
        end
    end
    if mod(sum(Hx*c_s),2) ~= 0
        j = j+1;
    end
end
j
