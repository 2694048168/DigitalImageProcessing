function R = imnoise2(type, M, N, a, b)
% IMNOISE2 - Generates an array of random numbers with specified PDF.
%
% Syntax: R = imnoise2(type, M, N, a, b)
%
% R = IMNOISE2(TYPE, M, N, A, B) generates an array, R, of size M-by-N,
% whose elements are random numbers of the specified TYPE with parameters A and B. 
% If only TYPE is included in the input argument list, a single random number of 
% the specified TYPE adn default parameters shown below is generated.
% If only TYPE, M and N are provided, the default parameters shown below are used.
% If M = N = 1, IMNOISE2 generates a single random number of the specified TYPE and parameters A and B.
% 
% Valid values for TYPE and parameters A and B are:
% 

if nargin == 1
    a = 0;
    b = 1;
    M = 1;
    N = 1;
elseif nargin == 3
    a = 0;
    b = 1;
end  % ending if 

% Begin precessing. Use lower(type) to protect against input being capitalized.
switch lower(type)
case 'uniform'
    R = a + (b - a)*rand(M, N);
case 'gaussian'
    R = a + b*randn(M, N);
case 'salt & pepper'
    if nargin <= 3
        a = 0,05;
        b = 0.05
    end % ending if
    % Check to make sure that Pa + Pb is not > 1.
    if (a + b) > 1
        error('The sum Pa + Pb must not exceed 1.')
    end % ending if
    R(1:M, 1:N) = 0.5;
    ......
end

end  % ending function