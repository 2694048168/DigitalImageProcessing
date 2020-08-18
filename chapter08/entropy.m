function h = entropy(x, n)
% ENTROPY Computes a first-order estimate of the entropy of a matrix.
%   H = ENTROPY(X, N) returns the first-order estimate of matrix X
%   with N symbols (N = 256 if omitted) in bits/symbol. The estimate
%   assumes a statistically independent source characterized by the
%   relative frequency of occurrence of the elements in X. 
    
    
error(nargchk(1, 2, nargin));         % Check input arguments
if nargin < 2   
    n = 256;                           % Default for n.
end 
    
x = double(x);                        % Make input double
xh = hist(x(:), n);                   % Compute N-bin histogram
xh = xh / sum(xh(:));                 % Compute probabilities  
    
% Make mask to eliminate 0's since log2(0) = -inf.
i = find(xh);           
    
h = -sum(xh(i) .* log2(xh(i)));       % Compute entropy

end % ending function