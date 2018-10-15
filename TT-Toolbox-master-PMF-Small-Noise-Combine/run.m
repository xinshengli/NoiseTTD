function [RMSE, rank, time,res,density, uDensity, vDensity] = run()
addpath(genpath('./'));
load('SwitchInputData.mat');

A = noiTensor4;

eps = [ 0.000001  0.001 0.01    0.1 0.105   0.11    0.15    0.2 0.3 0.4 0.5 1];

RMSE = zeros(1,12);
totalRMSE = zeros(1,12);
%AtensorApp = cells(1,10);
rank = zeros(5,12);
time = zeros(1,12);
totalTime = zeros(1,12);
res = zeros(4,12);
density = zeros(4,12);
uDensity = zeros(4,12);
vDensity = zeros(4,12);

for j = 1:1
    for i =  1: 1

         [RMSE(i),~,rank(:,i),time(i),res(:,i), density(:,i), uDensity(:,i), vDensity(:,i)] = script(A,eps(i), randMisPos4,ssTensor,2);
          totalRMSE(i) = totalRMSE(i) + RMSE(i);
          totalTime(i) = totalTime(i) + time(i);
    end
end

save('totalRes4.mat','totalRMSE', 'totalTime');
