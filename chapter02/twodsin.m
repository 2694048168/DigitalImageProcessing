function [rt, f, g] = twodsin(A, u0, v0, M, N)
% TWODSIN - Compares for loops vs. vectorization.
%
% Syntax: [rt, f, g] = twodsin(A, u0, v0, M, N)
% 
% The comparison is based on implementing the functin 
% f(x, y) = A * sin(u0 * x + v0 * y) for x = 0, 1, 2, ..., M-1 and
% y = 0, 1, 2, ..., N - 1. The inputs to the function are M and N and the constants in the function.

% First implement using for loops.
tic % Start timing.
for r = 1:M
    u0x = u0 * (r - 1);
    for c = 1:N
        v0y = v0 * (c - 1);
        f(r, c) = A * sin(u0x + v0y);
    end
end
t1 = toc; % End timing.

% Now implement using vectorization. Call the image g.
tic % Start timing.
r = 0:M-1;
c = 0:N-1;
[C, R] = meshgrid(c, r);
g = A * sin(u0 * R + v0 * C);
t2 = toc; % End timing.

% Compute the ratio of the two times.
rt = t1/(t2 + eps); % Use eps in case t2 is close to 0.
  
% 向量化的计算效率以及计时函数 tic 和 toc
% 两种方法生成的图像是相同的
% for循环实现所用时间与向量化实现所用时间之比 近似 30倍
end