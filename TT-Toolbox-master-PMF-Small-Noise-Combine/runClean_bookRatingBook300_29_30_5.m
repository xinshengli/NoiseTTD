function [RMSE, rank, time,res,density, uDensity, vDensity] = runClean_bookRatingBook300_29_30_5(inputFileName)


addpath(genpath('./'));



load(inputFileName);


[tt,res,density, uDensity, vDensity]= tt_tensor_sparse(noiseTensor,0.0000001,randMisIdx);

rng('shuffle');

sampleNum = [30 30 30]
A = spComTensor;

eps = [ 0.000001  0.001 0.01    0.1 0.105   0.11    0.15    0.2 0.3 0.4 0.5 1];


totalRMSE = zeros(1,12);
%AtensorApp = cells(1,10);
rank = zeros(5,12);
time = zeros(1,12);
totalTime = zeros(1,12);
res = zeros(4,12);
density = zeros(4,12);
uDensity = zeros(4,12);
vDensity = zeros(4,12);

 RANK = tt.r(2:4);

  RandV = cell(3,1);
  RandU = cell(3,1);
  n = A.size;
  prevSize = 0;
  for k = 1:3
      if(k == 1)
          sizeProd = n(1)*n(2)*n(3)*n(4);
          
          m = n(k);
          r = RANK(k);
          
          RandU{k} = rand(r, m);
          RandV{k} = rand(r, sizeProd/m);
          
          prevSize = r*sizeProd/m;
      else
          m=n(k)*RANK(k-1);
          r = RANK(k);
          RandU{k} = rand(r, m);
          RandV{k} = rand(r, prevSize/m);
          
          prevSize = r*prevSize/m;
      end
      
      
  end

for j = 1:1
    for i =  1: 1

         [RMSE(i),~,rank(:,i),time(i),res(:,i), density(:,i), uDensity(:,i), vDensity(:,i)] =  scriptRun(noiseTensor,eps(i), randMisIdx,A,2,noiseDensity,sampleNum, RandU, RandV,RANK);
          totalRMSE(i) = totalRMSE(i) + RMSE(i);
          totalTime(i) = totalTime(i) + time(i);
    end
end

save('totalResClean_bookRatingBook300_29_30_5_2.mat','totalRMSE', 'totalTime');


clearvars -except inputFileName RandU RandV RANK


addpath(genpath('./'));
load(inputFileName);
A = spComTensor;

sampleNum = [30 30 30]
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

         [RMSE(i),~,rank(:,i),time(i),res(:,i), density(:,i), uDensity(:,i), vDensity(:,i)] = scriptRun(noiseTensor,eps(i), randMisIdx,A,9,noiseDensity,sampleNum, RandU, RandV,RANK);
          totalRMSE(i) = totalRMSE(i) + RMSE(i);
          totalTime(i) = totalTime(i) + time(i);
    end
end

save('totalResClean_bookRatingBook300_29_30_5_9.mat','totalRMSE', 'totalTime');



clearvars -except inputFileName RandU RandV RANK




addpath(genpath('./'));
load(inputFileName);
sampleNum = [30 30 30]
A = spComTensor;

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

         [RMSE(i),~,rank(:,i),time(i),res(:,i), density(:,i), uDensity(:,i), vDensity(:,i)] = scriptRun(noiseTensor,eps(i), randMisIdx,A,10,noiseDensity,sampleNum, RandU, RandV,RANK);
          totalRMSE(i) = totalRMSE(i) + RMSE(i);
          totalTime(i) = totalTime(i) + time(i);
    end
end

save('totalResClean_bookRatingBook300_29_30_5_10.mat','totalRMSE', 'totalTime');



clearvars -except inputFileName RandU RandV RANK



addpath(genpath('./'));
load(inputFileName);
sampleNum = [30 30 30]
A = spComTensor;

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

         [RMSE(i),~,rank(:,i),time(i),res(:,i), density(:,i), uDensity(:,i), vDensity(:,i)] = scriptRun(noiseTensor,eps(i), randMisIdx,A,11,noiseDensity,sampleNum, RandU, RandV,RANK);
          totalRMSE(i) = totalRMSE(i) + RMSE(i);
          totalTime(i) = totalTime(i) + time(i);
    end
end

save('totalResClean_bookRatingBook300_29_30_5_11.mat','totalRMSE', 'totalTime');
