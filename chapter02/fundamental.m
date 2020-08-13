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
imwrite(img, './../image/image0.jpg', 'quality', 25)

% imfinfo 了解所实现的压缩并获取图像文件的详细信息
imfinfo ./../image/image.jpg

% 压缩比 q = ( Width * Height * BitDepth / 8bit ) / FileSize
% 压缩为了储存空间考虑，同时考虑在单位时间内传输的数据量
info = imfinfo('./../image/image.jpg');
image_bytes = info.Width * info.Height * info.BitDepth / 8;
compressed_bytes = info.FileSize;
compressed_ratio = image_bytes / compressed_bytes

