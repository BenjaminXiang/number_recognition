function [ beforeThin, stdImgList , stdImgList60] = imgProess( img )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

num = length(img);
stdImgList = cell(0);
for i = 1:num
    bw = im2bw(img{i}); %图像二值化
%    [row, col] = size(bw);
    
    %图像反色
    %反色是必须的 这样后面的细化操作才不会出错 别问我怎么知道的
    bw = invertImg(bw);
    
    bw = bwmorph(bw ,'spur','inf');%图像去毛刺
    %确定数字的范围
    [numRow, numCol] = find(bw == 1);
    rowMin = min(numRow);
    rowMax = max(numRow);
    colMin = min(numCol);
    colMax = max(numCol);  
   
    
    %截取图像中的数字部分
    bw2 = bw(rowMin:rowMax, colMin:colMax);
    rate = 20/max(size(bw2)); %缩放的比例
    bw2 = imresize(bw2, rate);
    [numRow, numCol] = size(bw2); %numRow = 20, numCol = 20
    row1 = round((20-numRow)/2);
    col1 = round((20-numCol)/2);
    p = zeros(20, 20);
    p(row1+1:row1+numRow, col1+1:col1+numCol)=bw2;
    
    beforeThin{i} = invertImg(p);
    
    %图像细化
    p = bwmorph(p, 'thin', 3);
    
    
    %标准化后的图像保存在stDImgList中
    stdImgList{i} = invertImg(p);
    stdImgList60{i} = imresize(stdImgList{i}, [60, 60]);
    %stdImgList60{i} = bwmorph(imresize(stdImgList{i}, [60, 60]), 'fill', 'inf');
end

end

