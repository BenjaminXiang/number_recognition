function [ stdImgList ] = imgProess( img )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

num = length(img);
stdImgList = cell(0);
for i = 1:num
    bw = im2bw(img{i}, graythresh(img{i})); %图像二值化
    [col, row] = size(bw);
    
    %图像反色
    for ii = 1:col
        for jj = 1:row
            if bw(ii, jj) == 0
                bw(ii, jj) = 1;
            else 
                bw(ii, jj) =0;
            end
        end
    end
    
    %确定数字的范围
    [numCol, numRow] = find(bw == 1);
    colMin = min(numCol);
    colMax = max(numCol);
    rowMin = min(numRow);
    rowMax = max(numRow);
    
    %截取图像中的数字部分
    bw2 = bw(colMin:colMax, rowMin:rowMax);
    rate = 18/max(size(bw2));
    bw2 = imresize(bw2, rate);
    [numCol, numRow] = size(bw2); %numCol = 18, numRow = 18
    col1 = round((18-numCol)/2);
    row1 = round((18-numRow)/2);
    p = zeros(18, 18);
    p(col1+1:col1+numCol, row1+1:row1+numRow)=bw2;
    
    %图像细化
    p = bwmorph(p, 'thin', inf);
    
    %标准化后的图像保存在STDImgList中
    stdImgList{i} = p;

end

end

