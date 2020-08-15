% 术语 空间域 ，也就是图像平面本身
% 在空间域内处理图像的方法就是直接对图像的像素进行处理
% 两种空间域处理方法 g(x, y) = T[f(x, y)]
% 1、亮度/灰度级变换
% 2、空间滤波/邻域处理/空间卷积

% imadjust function
% g = imadjust(f, [low_in high_in], [low_out high_out], gamma)
% 获得 负片图像
g1 = imadjust(f, [0 1], [1 0]);
% 获得负片图像 等价于 imcomplement
g = imcomplement(f);

% 灰度级扩展处理突出感兴趣的亮度带
g2 = imadjust(f, [0.5 0.75], [0 1]);

% 压缩灰度级的低端并扩展灰度级的高端
g3 = imadjust(f, [], [], 2);

% 对数变换
% g = c * log(1 + double(f))
% 主要应用于压缩动态范围
gs = im2uint8(mat2gray(g));

% 对比度拉伸变换
% 输入值低于m的灰度级压缩为输出图像中较暗灰度级的较窄范围
% 输入值高于m的灰度级压缩为输出图像中较亮灰度级的较窄范围
% 输出一幅具有高对比度的图像
g = 1./ (1 + (m ./ (double(f) + eps)).^E)
% 通过阈值函数的限制，输出一幅二值图像
% 阈值函数是进行图像分割的一种有效工具

% 使用对数变换减少动态范围
% 取值范围 0-1.5X10^6 傅里叶频谱，显示在线性比例尺的8bit系统上
g = im2uint8(mat2gray(log(1 + double(f))));
imshow(g)

% 处理可变数量的输入和输出
% nargin function 检测输入到 M 函数的参数数量
% nargout function 检测 M 函数输出的参数数量
% neargchk function 检测传递的参数数量是否正确
% error function 用于终止频繁使用 nargchk 程序的执行