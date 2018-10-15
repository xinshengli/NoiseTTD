function [RMSEGroup, rankGroup, timeGroup,resGroup,densityGroup, uDensityGroup, vDensityGroup,candidate] = batchRun(A)

modeNum = [1 2 3 4];

candidate = perms(modeNum);

dim = A.size;

RMSEGroup = zeros(size(candidate,1), 12);
timeGroup = zeros(size(candidate,1), 12);
rankGroup = cell(size(candidate,1));
resGroup = cell(size(candidate,1));
densityGroup = cell(size(candidate,1));
uDensityGroup = cell(size(candidate,1));
vDensityGroup = cell(size(candidate,1));
dimGroup = zeros(size(candidate,1),4);


for i = 1:size(candidate,1)
    if candidate(i,1) == 2 && candidate(i,2) == 1 && candidate(i,3) ==3 && candidate(i,4) ==4 
        dimOrder = [dim(candidate(i,1)) dim(candidate(i,2)) dim(candidate(i,3)) dim(candidate(i,4))];
        order = candidate(i,:);
        dimGroup(i,:) = [dim(order(1)) dim(order(2)) dim(order(3)) dim(order(4))];
        spTensor = sptensor([A.subs(:,order(1)) A.subs(:,order(2)) A.subs(:,order(3)) A.subs(:,order(4))], A.vals, [dim(order(1)) dim(order(2)) dim(order(3)) dim(order(4))]);
        [RMSEGroup(i,:), rankGroup{i}, timeGroup(i,:),resGroup{i},densityGroup{i}, uDensityGroup{i}, vDensityGroup{i}] = run(spTensor);
    end
end



