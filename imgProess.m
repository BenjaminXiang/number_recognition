function [ stdImgList ] = imgProess( img )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

num = length(img);
stdImgList = cell(0);
for i = 1:num
    bw = im2bw(img{i}, graythresh(img{i})); %ͼ���ֵ��
%    [row, col] = size(bw);
    
    %ͼ��ɫ
    %��ɫ�Ǳ���� ���������ϸ�������Ų������ ��������ô֪����
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
    
    %ȷ�����ֵķ�Χ
    [numRow, numCol] = find(bw == 1);
    rowMin = min(numRow);
    rowMax = max(numRow);
    colMin = min(numCol);
    colMax = max(numCol);
   
    
    %��ȡͼ���е����ֲ���
    bw2 = bw(rowMin:rowMax, colMin:colMax);
    rate = 20/max(size(bw2)); %���ŵı���
    bw2 = imresize(bw2, rate);
    [numRow, numCol] = size(bw2); %numRow = 20, numCol = 20
    row1 = round((20-numRow)/2);
    col1 = round((20-numCol)/2);
    p = zeros(20, 20);
    p(row1+1:row1+numRow, col1+1:col1+numCol)=bw2;
    
    %ͼ��ϸ��
    p = bwmorph(p, 'thin', inf);
    
    %��׼�����ͼ�񱣴���stDImgList��
    stdImgList{i} = invertImg(p);

end

end

