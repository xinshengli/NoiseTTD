function [U,S,V] = randomSVD(M, r, p)

Y = GaussianProjection(M, r+p);
[Q,R] = qr(Y);
Q = Q(:,1:r);
B = Q'*M;
[U,S,V] = svd(B);
U = Q*U;
