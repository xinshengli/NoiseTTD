function R = liRandomMatrix(d, k, s)

 % Our random d x k matrix
 % Entries are from 0, sqrt(s), ?sqrt(s) with probability {1 ? 1/s, 1/2s,
 % 1/2s}
 R_temp = rand(d, k);
 R = zeros(d, k);
 
 R (find (R_temp > 1 - 1/(2*s))) = sqrt(s);
 R (find (R_temp < 1/(2*s))) = -sqrt(s);