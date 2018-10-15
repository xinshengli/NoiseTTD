function [res,enginValCell] = checkMatricizationRes(tensor)

n = tensor.size;
sizeProd = n(1)*n(2)*n(3)*n(4);
ep = 0;
res = zeros(2,4);
enginValCell = cell(4,1);
for i = 1:4
    reTensor=reshape(tensor,[n(i),sizeProd/n(i)]);
    matrixSubs = reTensor.subs;
    matrixVals = reTensor.vals;
    sparseMatrix = sparse(matrixSubs(:,1),matrixSubs(:,2),matrixVals,reTensor.size(1),reTensor.size(2));
    rank = min(size(sparseMatrix));
    [u,s,v]=svds(sparseMatrix,rank);
    enginValCell{i} = diag(s);
    res(1,i) = n(i);
    [res(2,i)]=RMSECode(u,s,v,sparseMatrix,ep);
end