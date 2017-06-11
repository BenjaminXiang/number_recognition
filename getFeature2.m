function [ feature ] = getFeature2( stdImg )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

num = length(stdImg);
feature = zeros(6,5000);

for i = 1:num
    imgTemp = stdImg{i};
    
     %充填至 60*60 以增加 不同类间特征的差异程度
    bw60 = imresize(imgTemp, [60, 60]);
    f = zeros(6, 1);
    for j = 2:4
        f(j-1, 1) = sum(sum(bw60(j*10:j*10+1,:)));
        f(j+3-1, 1) = sum(sum(bw60(:, j*10:j*10+1)));
    end
%     f(11,1) = sum(diag(bw60)); %主对角线
%     f(12,1) = sum(diag(flipud(bw60))); %副对角线
    f = (120-f)/120;
    feature(:, i) = f;
end

end

