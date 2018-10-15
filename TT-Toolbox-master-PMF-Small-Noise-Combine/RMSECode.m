function [res]=RMSECode(u,s,v,sparseMatrix,ep)
tmps=diag(s); 
r1=my_chop2(tmps,ep*norm(tmps));
u=u(:,1:r1);
s=s(1:r1,1:r1);
v=v(:,1:r1);
tmp = u*s*v';

[i,j,s] = find(sparseMatrix);

subs = [i j];
vals = s;

ttVals = zeros(size(subs,1),1);

for i = 1:size(subs,1)
    ttVals(i) = tmp(subs(i,1), subs(i,2));
end

diff = vals - ttVals;

res = sqrt(mean(diff).^2);