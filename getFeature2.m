function [ feature ] = getFeature2( stdImg )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

num = length(stdImg);
feature = zeros(8,5000);
for i = 1;num
    imgTemp = stdImg{i};
    f = zeros(8, 1);
    for j = 1:4
        f(j,1) = length(find(imgTemp(:, 6+(j-1)*2)));
        f(j+4,1) = length(find(imgTemp(6+(j-1)*2, :)));
    end
    f = (18-f)/18;
    feature(:, i) = f;
end

end

