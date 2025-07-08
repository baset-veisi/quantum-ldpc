function [c_key,dz] = trueDistancePCM(Hx,Hz,oldDeltaZ)
deltaZ = gfweight(Hx,'par');
[~,n] = size(Hx);
v = 0:n-1;
dz = oldDeltaZ;
c_key = zeros(1,n);c_key = c_key(:);
flag = false;

if deltaZ ~= oldDeltaZ
    for k = deltaZ:oldDeltaZ
        v_k = nchoosek(v,k);
        V_k = 2.^v_k;
        C_k = sum(V_k,2);
        C_k = dec2bin(C_k);C_k = (C_k == '1');
        [m_k,~] = size(V_k);
        for i = 1:m_k
            c = C_k(i,:);c = c(:);
            res = mod(Hx*c,2);res = sum(res);
            if res == 0
                H_test = [Hz;c'];
                r = rank(H_test);
                if r > 2*n-1
                    c_key = c;
                    dz = k;
                    flag = true;
                    break
                end
            end
        end
        
        if flag == true
            break
        end
    end
end
end

               