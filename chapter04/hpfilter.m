function H = hpfilter(type, M, N, D0, n)
% HPFILTER Computes frequency domain highpass filters.
%   H = LPFILTER(TYPE, M, N, D0, n) creates the transfer function of
%   a lowpass filter, H, of the specified TYPE and size (M-by-N). 
%   Valid values for TYPE, D0, and n are:
%
%   'ideal'    Ideal highpass filter with cutoff frequency D0. n need
%              not be supplied.  D0 must be positive.
%
%   'btw'      Butterworth highpass filter of order n, and cutoff
%              D0.  The default value for n is 1.0.  D0 must be positive.
%
%   'gaussian' Gaussian highpass filter with cutoff (standard deviation) D0. 
%              n need not be supplied.  D0 must be positive. 
% The transfer function Hhp of a highpass filter is 1 - Hlp,
% where Hlp is the transfer function of the corresponding lowpass filter.
% Thus, we can use function lpfilter to generate highpass filters

if nargin == 4
    n = 1
end % ending if

% Generate highpass filter.
Hlp = lpfilter(type, M, N, D0, N);
H = 1 - Hlp;
    
end  % ending function
    