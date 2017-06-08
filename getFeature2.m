function [ feature ] = getFeature2( stdImg )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

num = length(stdImg);
feature = zeros(12,5000);

for i = 1:num
    imgTemp = stdImg{i};
    
     %充填至 60*60 以增加 不同类间特征的差异程度
    bw60 = imresize(imgTemp, [60, 60]);
    f = zeros(12, 1);
    for j = 1:5
        f(j, 1) = sum(bw60(j*10,:));
        f(j+5, 1) = sum(bw60(:, j*10));
    end
    f(11,1) = sum(diag(bw60)); %主对角线
    f(12,1) = sum(diag(flipud(bw60))); %副对角线
    f = (60-f)/60;
    feature(:, i) = f;
end

end

