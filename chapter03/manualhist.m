function p = manualhist
% MANULAHIST - Generates a bimodal histogram interactively.
%
% Syntax: p = manualhist
%
% P = MANUALHIST generates a bimodal histogram using 
% TWOMODEGAUSS(M1, SIG1, M2, SIG2, A1, A2, K). m1 and m2 are the means of the 
% two modes and must be in the range [0, 1]. sig1 and sig2 are the standard deviations
% of the two modes. A1 and A2 are amplitude values, and k is an offset value that
% raises the "floor" of histogram. The number of elements in the histogram
% vector P is 256 and sum(P) is normalized to 1. MANUALHIST repeatedly prompts
% for the parameters and plots the resulting histogram until the user types 
% an 'x' to quit, and then it returns the last histogram computed.
% 
% A good set of starting values is: (0.15, 0.05, 0.75, 0.05, 1, 0.07, 0.002).

% Initialize.
repeats = true;;
quitnow = 'x';

% Compute a default histogram in case the user quits before
% estimating at least one histogram.
p = twomodegauss(0.15, 0.05, 0.75, 0.05, 1, 0.07, 0.002);

% Cycle until an x is input.
while repeats
    s = input('Enter m1, sig1, m2, sig2, A1, A2, k OR x to quit:', 's');
    if s == quitnow
        break;
    end  % ending if 
    % Convert the input string to a vector of numerical values and verify the number of inputs.
    v = str2num(s);
    if numel(v) ~= 7
        disp('Incorrect number of inputs.')
    end  % ending if
    p = twomodegauss(v(1), v(2), v(3), v(4), v(5), v(6), v(7));
    % Start a new figure and scale the axes.
    % Specifying only xlim leaves ylim on auto.
    figure, plot(p)
    xlim([0 155])
end  % ending while
    
end  % ending function