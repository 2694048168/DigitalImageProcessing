% 复原的目的是在预定义的意义上改善给定的图像
% 图像增强主要是主观处理，图像复原大部分是客观的处理
% 复原通过使用退化现象的先验知识试图重建或者恢复一幅退化的图像
% 复原技术趋向于将退化模型化并使用相反的处理来恢复原图像

% 噪声模型，模拟噪声的行为和影响的能力是复原图像的核心
% 1、空间域噪声，使用概率密度函数来描述
% 2、频域噪声，使用各种傅里叶特性来描述

% imnoise 函数添加噪声
g = imnoise(f, type, parameters)

% 周期噪声
% 估计噪声参数

% 仅有噪声的复原： 空间滤波
% 自适应空间滤波器
% 通过频域滤波来降低周期噪声

% 退化函数的建模
% 直接逆滤波
% 维纳滤波，线性图像复原方法
% 约束的最小二乘滤波或者正则滤波，线性复原的方法

% Lucy-Richardson 算法的迭代非线性复原方法

% 盲去卷积算法，图像复原的方法

% 几何变换与图像配准
