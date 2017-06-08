function [ feature ] = getFeature3( stdImg )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

num = length(stdImg);
feature = zeros(28, 5000);
for i = 1:num
    imgTemp = stdImg{i};
    bw60 = imresize(imgTemp, [60, 60]);
    f = zeros(28, 1);
    
    for iRow = 0:3
        for jCol = 0:3
            tmp = sum(bw60( iRow*15+1:iRow*15+15, jCol*15+1:jCol*15+15));
            f(iRow*4+jCol+1, 1) = sum(tmp); 
        end
    end
    f = (225-f(1:16, 1))/225;
    
    for j = 1:5
        f(j+16, 1) = sum(bw60(j*10,:));
        f(j+21, 1) = sum(bw60(:, j*10));
    end
    f(27,1) = sum(diag(bw60)); %主对角线
    f(28,1) = sum(diag(flipud(bw60))); %副对角线
    for j=17:28
        f(j , 1) = (60-f(j, 1))/60;
    end
    feature(:, i) = f;
end

end

