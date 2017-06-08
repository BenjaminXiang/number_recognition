function [ feature ] = getFeature2( stdImg )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

num = length(stdImg);
feature = zeros(14,5000);
for i = 1:num
    imgTemp = stdImg{i};
    f = zeros(14, 1);
    for j = 1:6
        f(j,1) = length(find(imgTemp(:, 3+j*2)));
        f(j+6,1) = length(find(imgTemp(3+j*2, :)));
    end
    f(13,1) = sum(diag(imgTemp)); %主对角线
    f(14,1) = sum(diag(flipud(imgTemp))); %副对角线
    f = (20-f)/20;
    feature(:, i) = f;
end

end

