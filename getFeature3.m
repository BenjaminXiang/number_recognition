function [ feature ] = getFeature3( stdImg )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

num = length(stdImg);
feature = zeros(17, 5000);
for i = 1:num
    imgTemp = stdImg{i};
    f = zeros(17, 1);
    for ii = 0:2
        for jj = 0:2
            tmp = sum(imgTemp( ii*3+1:ii*3+3, jj*3+1:jj*3+3));
            f(ii*3+jj+1,1) = sum(tmp); 
        end
    end
    f = (10-f(1:9 ,1))/10;
    for j = 1:4
       f(j+9,1) = length(find(imgTemp(:, 6+(j-1)*2)));
       f(j+13,1) = length(find(imgTemp(6+(j-1)*2, :)));
    end
    f = (18-f(10:17))/18;
    feature(:, i) = f;
end

end

