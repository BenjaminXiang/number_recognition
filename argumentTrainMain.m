clc;
clear all;
% 读取数据 图片数据都保存在img中 img中的每个元素为28*28的图像矩阵
root = './data';
img = readData(root);

%图像预处理 处理的结果保存在stdImg中
stdImg = imgProess(img);




