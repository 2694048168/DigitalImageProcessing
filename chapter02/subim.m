function s = subim(f, m, n, rx, cy)
% SUBIM - Extracts a subimage, s, from a given image, f.
%
% Syntax: s = subim(f, m, n, rx, cy)
%
% The subimage i s of size m-by-n, and the coordinates of its top, 
% left corner are (rx, cy).

% First implement using for loops.
s = zeros(m, n);
rowhigh = rx + m - 1;
colhigh = cy + n - 1;
xcount = 0;

for r = rx:rowhigh
    xcount = xcount + 1;
    ycount = 0;
    for c = cy:colhigh
        ycount = ycount + 1;
        s(xcount, ycount) = f(r, c);
    end
end

% Now implement using vectorization.
rowhigh = rx + m - 1;
colhigh = cy + n - 1;
s = f(rx:rowhigh, cy:colhigh);


% 从一幅图像中提取一幅矩形字图像
% 输入一幅图像、所提取子图像的大小(行数和列数)以及图像的左上角的坐标
% MATLAB 中图像的原点在 (1, 1)处
% 向量化代码运行速度要比基于for循环的代码的运行速度快 1000 倍
end