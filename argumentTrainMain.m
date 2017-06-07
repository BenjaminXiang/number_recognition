clc;
clear all;
% 读取数据 图片数据都保存在img中 img中的每个元素为28*28的图像矩阵
root = './data';
img = readData(root);

%图像预处理 处理的结果保存在stdImg中
stdImg = imgProess(img);

%特征提取
imgFeature1 = getFeature1(stdImg); %特征一 是统计3*3小格中 1的个数  
imgFeature2 = getFeature2(stdImg); %特征二 6,8,10,12  行列中 1的个数
imgFeature3 = getFeature3(stdImg); %特征三 综合一二




