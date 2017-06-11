clc;
clear all;

img = importdata('imgList.mat');

% num = length(img);
% for i = 1:num
%      bw1{i} = im2bw(img{i}, graythresh(img{i})); %图像二值化
% %    [row, col] = size(bw);
%     
%     %图像反色
%     %反色是必须的 这样后面的细化操作才不会出错 别问我怎么知道的
%     bw1{i} = invertImg(bw1{i});
% 
%     bw2{i} = bwmorph(bw1{i} ,'spur','inf');%图像去毛刺
%     
%     %确定数字的范围
%     [numRow{i}, numCol{i}] = find(bw2{i} == 1);
%     rowMin{i} = min(numRow{i});
%     rowMax{i} = max(numRow{i});
%     colMin{i} = min(numCol{i});
%     colMax{i} = max(numCol{i});
%    
%     
%     %截取图像中的数字部分
%     bw3{i} = bw2{i}(rowMin{i}:rowMax{i}, colMin{i}:colMax{i});
%     rate{i} = 20/max(size(bw3{i})); %缩放的比例
% end
% 
% for i = 1:num
%      bbw1{i} = im2bw(img{i}); %图像二值化
% %    [row, col] = size(bw);
%     
%     %图像反色
%     %反色是必须的 这样后面的细化操作才不会出错 别问我怎么知道的
%     bbw1{i} = invertImg(bbw1{i});
% 
%     bbw2{i} = bwmorph(bbw1{i} ,'majority','inf');%图像去噪声
%     
%     %确定数字的范围
%     [bnumRow{i}, bnumCol{i}] = find(bbw2{i} == 1);
%     browMin{i} = min(bnumRow{i});
%     browMax{i} = max(bnumRow{i});
%     bcolMin{i} = min(bnumCol{i});
%     bcolMax{i} = max(bnumCol{i});
%    
%     
%     %截取图像中的数字部分
%     bbw3{i} = bbw2{i}(browMin{i}:browMax{i}, bcolMin{i}:bcolMax{i});
%     brate{i} = 20/max(size(bbw3{i})); %缩放的比例
% end
[ beforeThin, stdImgList , stdImgList60] = imgProess( img );

% bw = im2bw(img{559},graythresh(img{559})) ;
% 
% bw = invertImg(bw);
% bw = bwmorph(bw ,'majority','inf');
% 
%  [numRow, numCol] = find(bw == 1);
%     rowMin = min(numRow);
%     rowMax = max(numRow);
%     colMin = min(numCol);
%     colMax = max(numCol);
% 
% 
% bw2 = bw(rowMin:rowMax, colMin:colMax);
%     rate = 20/max(size(bw2)); %缩放的比例
%     bw2 = imresize(bw2, rate);
%     [numRow, numCol] = size(bw2); %numRow = 20, numCol = 20
%     row1 = round((20-numRow)/2);
%     col1 = round((20-numCol)/2);
%     p = zeros(20, 20);
%     p(row1+1:row1+numRow, col1+1:col1+numCol)=bw2;
%     
%    p = bwmorph(p, 'thin', inf);
