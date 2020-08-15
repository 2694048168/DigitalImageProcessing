% imread 读取图像进入 MATLAB 环境
% 支持 TIFF、JPEG、GIF、BMP、PNG格式
% .tif/.tiff, .jpg/.jpeg, gif, .bmp, .png
img = imread('./../image/image.jpg');

% size 计算图像的行数和列数
[M, N] = size(img);

% whos 显示图像的附加信息
whos img;

% imshow 显示图像, G 表示灰度级数，默认 256
% imshow(filename, [G])
% imshow(filename, [low, high])
imshow(img)

% imshow 显示会替换覆盖原来的显示
% 保持同时显示图像，使用 figure
figure, imshow('./../image/image.jpg')

% imwrite 保存图像
% imwrite(filename, 'filename.jpg', 'quality', q)
imwrite(img, './../image/image50.jpg', 'quality', 50);
imwrite(img, './../image/image25.jpg', 'quality', 25);
imwrite(img, './../image/image15.jpg', 'quality', 15);
imwrite(img, './../image/image5.jpg', 'quality', 5);
imwrite(img, './../image/image0.jpg', 'quality', 0);


% imfinfo 了解所实现的压缩并获取图像文件的详细信息
imfinfo ./../image/image.jpg

% 压缩比 q = ( Width * Height * BitDepth / 8bit ) / FileSize
% 压缩为了储存空间考虑，同时考虑在单位时间内传输的数据量
info = imfinfo('./../image/image.jpg');
image_bytes = info.Width * info.Height * info.BitDepth / 8;
compressed_bytes = info.FileSize;
compressed_ratio = image_bytes / compressed_bytes

%  这种用法只适用于 tif 图像
% imwrite(img, 'filename.tif', 'compression', 'parameter', 'resolution', [colres rowres])
% 200dpi, 450 * 450 pix, and then size = 450 / 200 = 2.25 英寸
% 以 tif 格式存储为无压缩图像，图像尺寸缩减到 1.5 英寸，像素保持 450pix
% and then colres = rowres = 200dpi * 2.25 / 1.5 = 300dpi
imwrite(img, 'image-tif.tif', 'compression', 'none', 'resolution', [300 300])
% 等价于
res = round(200 * 2.25 / 1.5);
imwrite(img, 'image-tif.tif', 'compression', 'none', 'resolution', res)


% MatLab 保存图像
% 1、图像窗口 File -> Export，选择保存路径，文件名以及格式
% 2、print -fno -dfileformat -rresno filename, resno 的值时 dpi值
% 只键入 print ，默认打印出上一个图像窗口的内容
print -f1 -dtiff -r300 ./../image/hi-res-rose

% 像素的数据类型 double uint8 char logical，使用时查查
% 图像类型
% 1、亮度图像 Intensity images
% 2、二值图像 Binary images
% 3、索引图像 Indexed images
% 4、RGB图像 RGB images

% 像素的数据类型之间转换，注意能表示的范围以及转换取舍
% IPT 中将图像类型和数据类型之间进行转换，注意有效的输入和输出是什么，以及转换规则和取舍问题
% MATLAB 命令可以嵌套使用，简洁得出需要的结果，中间转换结果不需要的舍弃
gbd = im2double(im2bw(mat2gray(f), 0.6));

% 数组 ：一维向量 二维矩阵
% 向量索引与取值
% x = linspace(a, b, n)
% 矩阵索引与取值
matrix = [1 2 3; 4 5 6; 7 8 9];
% 使用数组的索引与取值可以进行简单的图像操作
% dim_num = operation(matrix, dim) 选择数组的维度上的数量
row_num = operation(matrix, 1);
col_num = operation(matrix, 2);
% dims = ndims(matrix) 返回矩阵的维度，大于2
dims = ndims(matrix);

% zeros(M, N) 生成一个大小为M x N的double类矩阵，其元素均为0。
% ones(M, N) 生成大小为M x N的double类矩阵，其元素均为1。
% ture(M, N) 生成大小为M x N的logical类矩阵，其元素为1。
% false(M, N) 生成一个大小为M x N的logical类矩阵，其元素为0。
% magic(M) 生成一个大小为Mx N的“魔术方阵"。在该方阵中,每行中的元素之和、每列中的元素之和以及主对角线中的元素之和均相等。
%         魔术方阵可用于测试目的,因为它们易于生成，且其元素均为整数。
% rand(M, N) 生成大小为M x N的矩阵,矩阵中的元素都是在区间[0, 1]中均匀分布的随机数。
% randn(M,N) 生成大小为MxN的矩阵，矩阵中的元素是正态分布(如高斯分布)的随机数，随机数的均值为0,方差为1。

% M 函数编程和 M 文件
% 1、函数定义行: function [outputs_list] = FunName(input_list)
% 2、H1行：% 注释 function 功能，摘要信息
% 3、帮助文档：% 为 function 提供注释，解释inputs和outputs以及使用方法
% 4、函数体：函数的实现部分，可执行语句
% 5、命令：结束符 end

function [outputs] = FunName(inputs)
% FunName - Description
%
% Syntax: [outputs] = FunName(inputs)
%
% Long description
    
end

% 运算符
% 1、算术运算符，执行数值计算
% 2、关系运算符，在数量上进行比较操作
% 3、逻辑运算符，AND OR NOT 函数


% 使用 for 循环将多幅图像写入文件
% 将图像img，写成一系列的JPEG文件，范围 0-100、增量为 5 的质量因子表示
% JPEG文件用 series_xxx.jpg 命名，xxx 是品质因子
for q = 0:5:100
    filename = sprintf('series_%3d.jpg', q);
    imwrite(img, filename, 'quality', q);
end

% while 循环、switch 分支、break和continue语句
% 代码优化：向量化循环 和 预分配数组
% MATLAB 数组索引不能有 零0 索引，从 1 开始

% 预分配数组
% 加快代码执行时间的方法是在程序中预分配数组的大小。
% 在处理数值或逻辑数组时,预分配只是简单地创建有着适当维数的数组,数组的元素均为0。
% f = zeros (1024) ; g = zeros (1024) ;
% 大处理大数组时,预分配也可帮助我们减少存储器碎片。
% 动态存储器的分配和去分配会使得存储器出现碎片。
% 实际的结果是在计算过程中可能会有足够空间的可用物理存储器,但可能没有足够的连续空间来容纳较大的变量。
% 预分配通过在计算开始时就允许 MATLAB 为大数据构造保留足够的存储空间，来阻止无连续空间的情形出现。

% 交互式 I/O
% disp 函数用来在屏幕上显示信息
% disp(argument)

% input 函数用来将数据输入到 M 函数
% t = input('message')
% str2num 函数用于将串字符转换为 double 数字
% n = str2num(t)
% strread 函数串处理输入中既有字符又有数字
% strread(cstr, 'format', 'param', 'value')
t = '12.6, x2y, z';
[a, b, c] = strread(t, '%f%q%q', 'delimiter', ',')

% 单元数组与结构简介
% 处理混合变量，可以充分利用单元数组
% 大括号 一个整数地址，字符串 + 矩阵 + 标量
c = { 'gauss', [1 0; 0 1], 3}