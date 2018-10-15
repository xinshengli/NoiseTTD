function [U, V,r_bpmf] = ProbMF8(CTr, CTe, RANK, tensor, i, randMisPos)

addpath ./export_bptf/lib

D = RANK(i);

pn = 50e-3;
max_iter = 50;
learn_rate = 1e-2;
%n_sample = 100;
total_Sample = 15*3;

total_val = 0;
for j = 1:3
    total_val = total_val+ tensor.size(j)*RANK(j)+tensor.size(j+1)*RANK(j);
end

%percentage = (size(unique(randMisPos(:,i)),1)/tensor.size(i))/total_val;
%n_sample = round(total_Sample*percentage);

tmpNum =  tensor.size(i)*RANK(i)+tensor.size(i+1)*RANK(i);
percentage = tmpNum/total_val;

n_sample = round(total_Sample*percentage)
n_sample = 15+n_sample;

alpha = 2;
[Us_bpmf, Vs_bpmf] = BPMF(CTr, CTe, D, alpha, [], {rand(D,size(CTr,1)),rand(D,size(CTr,2))}, ...
    struct('max_iter',n_sample,'n_sample',n_sample,'save_sample',false, 'run_name','alpha2'));
[Y_bpmf U V rmse] = BPMF_Predict(Us_bpmf, Vs_bpmf, D, CTe, [1 5]);
U = U';
V = V';
r_bpmf = RMSE(Y_bpmf.vals - CTe.vals);
fprintf('BPMF: %.4f\n', r_bpmf);
