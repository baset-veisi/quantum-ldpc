% code size n**2
n = 6;
r = 1;
A = repCodePCM(n);
A1 = A; %A1 = rowDeleter(A,3);
A2 = A; %A2 = rowDeleter(A,3);
Hx = kron(A1,A2);
B = spcCodePCM(n);Hz = asymmH(B);
dz_vs_r = test_dz_r(Hz,Hx,n,r)
%Hx = rowDeleter(Hx,[12,8,18,21]);
%[c,d] = onlyTrueDistancePCM(Hx,Hz);
%d
%c