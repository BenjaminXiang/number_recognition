function [ stdImgList ] = imgProess( img )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

num = length(img);
stdImgList = cell(0);
for i = 1:num
    bw = im2bw(img{i}, graythresh(img{i})); %图像二值化
%    [row, col] = size(bw);
    
    %图像反色
    %反色是必须的 这样后面的细化操作才不会出错 别问我怎么知道的
    bw = invertImg(bw);
%     for ii = 1:row
%         for jj = 1:col
%             if bw(ii, jj) == 0
%                 bw(ii, jj) = 1;
%             else 
%                 bw(ii, jj) =0;
%             end
%         end
%     end
    
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
    
    %图像细化
    p = bwmorph(p, 'thin', inf);
    
    %标准化后的图像保存在stDImgList中
    stdImgList{i} = invertImg(p);

end

end

