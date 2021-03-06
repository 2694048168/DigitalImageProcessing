% 滤波通过傅里叶变换在频域实现
% 傅里叶变换在图形增强、图形复原、图像数据压缩以及实际应用设计和实现中有着重要作用

% 二维傅里叶变换 DFT
% 可视化 二维 DFT
F = fft2(img);
% 频谱
S = abs(F);
imshow(S, [])

Fc = fftshift(F);
imshow(abs(Fc), [])

S2 = log(1 + abs(Fc));
imshow(S2, [])

% 卷积运算 && 卷积定理

% 从空间滤波器获得频域滤波器
% 空间滤波器和频域滤波器的比较
% 频域中直接生成滤波器

% 低通频域滤波器
% 基本高通滤波器

% 高频强调滤波
% 高频强调滤波与直方图均衡化结合起来