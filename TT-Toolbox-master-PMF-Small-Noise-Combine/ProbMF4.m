function [U, V,r_bpmf] = ProbMF4(CTr, CTe, D, tensor, i, randMisPos)

addpath ./export_bptf/lib



pn = 50e-3;
max_iter = 50;
learn_rate = 1e-2;
%n_sample = 100;
total_Sample = 100*3;

total_val = 0;
for j = 1:4
    total_val = total_val+ size(unique(randMisPos(:,j)),1)/tensor.size(j);
end

%percentage = (size(unique(randMisPos(:,i)),1)/tensor.size(i))/total_val;
%n_sample = round(total_Sample*percentage);


percentage1 = total_val/(size(unique(randMisPos(:,1)),1)/tensor.size(1));
percentage2 = total_val/(size(unique(randMisPos(:,2)),1)/tensor.size(2));
percentage3 = total_val/(size(unique(randMisPos(:,3)),1)/tensor.size(3));
percentage4 = total_val/(size(unique(randMisPos(:,4)),1)/tensor.size(4));
if i <3
inverse_Percentage = (total_val/(size(unique(randMisPos(:,i)),1)/tensor.size(i)))/(percentage1+ percentage2+percentage3+percentage4);
else
    inverse_Percentage1 = (total_val/(size(unique(randMisPos(:,i)),1)/tensor.size(i)))/(percentage1+ percentage2+percentage3+percentage4);
    inverse_Percentage2 = (total_val/(size(unique(randMisPos(:,i+1)),1)/tensor.size(i+1)))/(percentage1+ percentage2+percentage3+percentage4);
    inverse_Percentage = inverse_Percentage1+ inverse_Percentage2;
end
n_sample = round(total_Sample*inverse_Percentage)


alpha = 2;
[Us_bpmf, Vs_bpmf] = BPMF(CTr, CTe, D, alpha, [], {rand(D,size(CTr,1)),rand(D,size(CTr,2))}, ...
    struct('max_iter',n_sample,'n_sample',n_sample,'save_sample',false, 'run_name','alpha2'));
[Y_bpmf U V rmse] = BPMF_Predict(Us_bpmf, Vs_bpmf, D, CTe, [1 5]);
U = U';
V = V';
r_bpmf = RMSE(Y_bpmf.vals - CTe.vals);
fprintf('BPMF: %.4f\n', r_bpmf);
