function [RMSE,tt,rank,time,res,density, uDensity, vDensity] = scriptRun(A,eps,randMisPos,ssTensor, para, noiseDensity,sampleNum, RandU, RandV,RANK)

x = size(A,1);
y = size(A,2);
z = size(A,3);
%m = size(A,4);
% n = size(A,5);
% k = size(A,6);

%tt = tt_tensor(full(A),eps);
rTime = tic;
[tt,res,density, uDensity, vDensity]= tt_tensor_sparse_PMF(A,eps,randMisPos, para,noiseDensity, sampleNum, RandU, RandV,RANK);
time = toc(rTime);
%tt = tt_tensor_sparse(A,eps);
rank = tt.r

% ttVals = zeros(size(A.subs,1),1);
% 
% parfor i = 1:size(ttVals,1)
%     ttVals(i) = tt(A.subs(i,:));
% end
% 
% diff = A.vals - ttVals;
% 
% RMSE = sqrt(mean(diff).^2);



ttVals = zeros(size(randMisPos,1),1);

parfor i = 1:size(ttVals,1)
    ttVals(i) = tt(randMisPos(i,:));
end

diff = ssTensor(randMisPos) - ttVals;

RMSE = sqrt(mean(diff).^2);


