% Constructs the projection of a given nxd matrix (representing n points
% in R^d) into a subspace R^k, where k is chosen based on the error in
% terms of distance, and the probability of preserving distances within the
% error is 1?n^?beta
function projection = achlioptasRandomProjection(A, error, beta)
 % Number of points
 n = size(A, 1);

 % Reduced dimension size
 % Bound provided by Achlioptas
 k = achlioptasReducedDimension(n, error, beta);

 %disp('Reducing to dimension:')
 %disp(k)

 % Original dimension of the points
 d = size(A, 2);

 % Get the standard Achlioptas random matrix
 R = achlioptasRandomMatrix(d, k);

 projection = randomProjection(A, R);