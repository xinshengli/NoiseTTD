function [res]=RMSECode1(subs, vals, tmp)

ttVals = zeros(size(subs,1),1);

for i = 1:size(subs,1)
    ttVals(i) = tmp(subs(i,1), subs(i,2));
end

diff = vals - ttVals;

res = sqrt(mean(diff).^2);