function [res,resMode] = postprocess(RMSEGroup, rankGroup, timeGroup,resGroup,densityGroup, uDensityGroup, vDensityGroup)

dim = size(RMSEGroup,1);

resMode = zeros(dim,4);

res = cell(dim);

modeNum = [1 2 3 4];

candidate = perms(modeNum);
mode = [200   500    28     7];

for i = 1:dim
    order = candidate(i,:);
    resMode(i,:) = [mode(order(1)) mode(order(2)) mode(order(3)) mode(order(4))]
    res{i} = [RMSEGroup(i,:);timeGroup(i,:);rankGroup{i};resGroup{i};densityGroup{i}; uDensityGroup{i}; vDensityGroup{i}];
    
end
