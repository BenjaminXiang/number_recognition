clc;
clear all;

img = importdata('imgList.mat');

% num = length(img);
% for i = 1:num
%      bw1{i} = im2bw(img{i}, graythresh(img{i})); %ͼ���ֵ��
% %    [row, col] = size(bw);
%     
%     %ͼ��ɫ
%     %��ɫ�Ǳ���� ���������ϸ�������Ų������ ��������ô֪����
%     bw1{i} = invertImg(bw1{i});
% 
%     bw2{i} = bwmorph(bw1{i} ,'spur','inf');%ͼ��ȥë��
%     
%     %ȷ�����ֵķ�Χ
%     [numRow{i}, numCol{i}] = find(bw2{i} == 1);
%     rowMin{i} = min(numRow{i});
%     rowMax{i} = max(numRow{i});
%     colMin{i} = min(numCol{i});
%     colMax{i} = max(numCol{i});
%    
%     
%     %��ȡͼ���е����ֲ���
%     bw3{i} = bw2{i}(rowMin{i}:rowMax{i}, colMin{i}:colMax{i});
%     rate{i} = 20/max(size(bw3{i})); %���ŵı���
% end
% 
% for i = 1:num
%      bbw1{i} = im2bw(img{i}); %ͼ���ֵ��
% %    [row, col] = size(bw);
%     
%     %ͼ��ɫ
%     %��ɫ�Ǳ���� ���������ϸ�������Ų������ ��������ô֪����
%     bbw1{i} = invertImg(bbw1{i});
% 
%     bbw2{i} = bwmorph(bbw1{i} ,'majority','inf');%ͼ��ȥ����
%     
%     %ȷ�����ֵķ�Χ
%     [bnumRow{i}, bnumCol{i}] = find(bbw2{i} == 1);
%     browMin{i} = min(bnumRow{i});
%     browMax{i} = max(bnumRow{i});
%     bcolMin{i} = min(bnumCol{i});
%     bcolMax{i} = max(bnumCol{i});
%    
%     
%     %��ȡͼ���е����ֲ���
%     bbw3{i} = bbw2{i}(browMin{i}:browMax{i}, bcolMin{i}:bcolMax{i});
%     brate{i} = 20/max(size(bbw3{i})); %���ŵı���
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
%     rate = 20/max(size(bw2)); %���ŵı���
%     bw2 = imresize(bw2, rate);
%     [numRow, numCol] = size(bw2); %numRow = 20, numCol = 20
%     row1 = round((20-numRow)/2);
%     col1 = round((20-numCol)/2);
%     p = zeros(20, 20);
%     p(row1+1:row1+numRow, col1+1:col1+numCol)=bw2;
%     
%    p = bwmorph(p, 'thin', inf);
