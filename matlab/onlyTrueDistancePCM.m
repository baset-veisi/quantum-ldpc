function [c_key,dz] = onlyTrueDistancePCM(Hx,Hz,rowDeleted,real_dz,min_dis)
if (~exist('min_dis','var'))
    min_dis = 0;
end


[~,n] = size(Hx);
v = 0:n-1;


%deltaZ = gfweight(Hx,'par');
% if ~rowDeleted
%     dz = max([deltaZ,min_dis]);
% elseif min_dis ~= 0
%     dz = min_dis;
% else
%     dz = 1;
% end
dz = inf;
c_key = zeros(1,n);c_key = c_key(:);
flag = false;
for k = 1:real_dz
        v_k = nchoosek(v,k);
        V_k = 2.^v_k;
        C_k = sum(V_k,2);
        C_k = dec2bin(C_k);C_k = (C_k == '1');
        [m_k,~] = size(V_k);
        for i = 1:m_k
            c = C_k(i,:);c = c(:);
            res = my_bin_multiplication(Hx,c);res = sum(res);
            if res == 0
                if isNotInSpan(Hz,c,ceil(sqrt(n)))
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

