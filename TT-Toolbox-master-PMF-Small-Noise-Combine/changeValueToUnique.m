function [res]=changeValueToUnique(data)

parfor k = 1:size(data,2)
    vals = data(:,k)
    uniVals = unique(vals);
    for i = 1:size(uniVals,1)
        idx = find(vals == uniVals(i));
        vals(idx) = i;
    end
    res(:,k) = vals;
end

