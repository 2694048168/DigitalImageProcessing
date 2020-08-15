function [p, pmax, pmin, pn] = improd(f, g)
% IMPROD - Compute the preduct of two images.
%
% Syntax: [p, pmax, pmin, pn] = improd(f, g)
% 
% outputs the element-by-element product of two input images, F and G,
% the product maximum and minimum values, and a normalized product array
% with values in the range [0, 1]. The input images must be of the same size.
% They can be of class uint8, uint16, or double.
% The outpus are of class double.
% 
fd = double(f);
gd = double(g);
p = fd.*gd;
pmax = max(p(:));
pmin = min(p(:));
pn = mat2gray(p);

% 将两幅图像相乘，并输出图像的乘积、乘积的最大值与最小值、
% 以及一幅归一化的乘积图像(其取值范围为 [0,1] )
end