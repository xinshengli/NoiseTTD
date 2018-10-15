function [C] = srht(A, s)

n = size(A, 2)
sgn = randi(2,[1,n])*2-3;
A =bsxfun(@times, A, sgn);
n = 2^(ceil(log2(n)));
C = (fwht(A',n))';
idx = sort(randsample(n,s));
C = C(:, idx);
C = C*(n/sqrt(s));