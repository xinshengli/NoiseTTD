function [res]= getIndex(cleanData, userId)
res=[];
for i = 1:size(userId,2)
     ind = find(cleanData(:,4)==userId(i));
     res = [res ; ind];
end

