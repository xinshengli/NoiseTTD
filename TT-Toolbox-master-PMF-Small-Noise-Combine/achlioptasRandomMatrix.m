function R = achlioptasRandomMatrix(d, k)
R_temp = rand(d, k);
R = zeros(d, k);

R (find (R_temp > 5/6)) = sqrt(3);
R (find (R_temp < 1/6)) = -sqrt(3);