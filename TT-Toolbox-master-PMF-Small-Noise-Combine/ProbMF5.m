function [U, V,r_bpmf] = ProbMF5(CTr, CTe, D, tensor, i, randMisPos)

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

tmpNum= 0;
total_val = 1;

if i <3
    total_val = 1;
    for j = 1:4
        if j > i
         total_val = total_val *size(unique(randMisPos(:,j)),1)/tensor.size(j);
        end
    end

     dimSize = tensor.size(i);
     tmpNum = total_val*dimSize;
else
    
    total_val = 1;
    for j = 1:4
        if j > i
         total_val = total_val *size(unique(randMisPos(:,j)),1)/tensor.size(j);
        end
    end

     dimSize = tensor.size(i);
     tmpNum1 = total_val*dimSize;
    
    total_val = 1; 
      for j = 1:4
        if j > i+1
         total_val = total_val *size(unique(randMisPos(:,j)),1)/tensor.size(j);
        end
      end

     dimSize = tensor.size(i+1);
     tmpNum2 = total_val*dimSize;
    
     tmpNum = tmpNum1+tmpNum2;
    
end

tmpSum = 0;

for k = 1:4
       total_val = 1; 
       for j = 1:4
            if j > k
             total_val = total_val *size(unique(randMisPos(:,j)),1)/tensor.size(j);
            end
          
       end 
       dimSize = tensor.size(k);
       tmpSum = tmpSum + total_val*dimSize;
end

percentage = tmpNum/tmpSum;

n_sample = round(total_Sample*percentage)


alpha = 2;
[Us_bpmf, Vs_bpmf] = BPMF(CTr, CTe, D, alpha, [], {rand(D,size(CTr,1)),rand(D,size(CTr,2))}, ...
    struct('max_iter',n_sample,'n_sample',n_sample,'save_sample',false, 'run_name','alpha2'));
[Y_bpmf U V rmse] = BPMF_Predict(Us_bpmf, Vs_bpmf, D, CTe, [1 5]);
U = U';
V = V';
r_bpmf = RMSE(Y_bpmf.vals - CTe.vals);
fprintf('BPMF: %.4f\n', r_bpmf);
