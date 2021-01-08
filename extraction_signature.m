function [signature,M] = extraction_signature(img,P1,P2,N)

signature = zeros(1,N);
M = zeros(2,N);
for i=1:N
    M(:,i) = P1 + (i-1)*(P2-P1)/(N-1);
    signature(1,i) = img(round(M(2,i)),round(M(1,i)));
end

end