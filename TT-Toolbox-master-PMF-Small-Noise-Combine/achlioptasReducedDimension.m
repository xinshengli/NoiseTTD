function dimension = achlioptasReducedDimension(n, error, beta)

dimension = ceil((4 + 2*beta)*log(n) ./ ((error.^2/2) - (error.^3/3)));