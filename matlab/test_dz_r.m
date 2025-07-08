function dz_vs_r = test_dz_r(Hz,Hx,n,r)

elements = 1:(n-1)^2;
    IdxToRemove = nchoosek(elements, r);
    LL = size(IdxToRemove,1);
    real_dz = 1;
    for i = 1:LL
        Hx_r = rowDeleter(Hx,IdxToRemove(i,:));
        [~,d] = onlyTrueDistancePCM(Hx_r,Hz);
        if d > real_dz
            real_dz = d;
        end
    end
dz_vs_r = real_dz;






