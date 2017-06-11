function [ feature ] = getFeature3( stdImg )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

num = length(stdImg);
feature = zeros(22, 5000);
for i = 1:num
    imgTemp = stdImg{i};
    bw60 = imresize(imgTemp, [60, 60]);
    f = zeros(22, 1);
    
    for iRow = 0:3
        for jCol = 0:3
            tmp = sum(bw60( iRow*15+1:iRow*15+15, jCol*15+1:jCol*15+15));
            f(iRow*4+jCol+1, 1) = sum(tmp); 
        end
    end
    f = (225-f(1:16, 1))/225;
    
    for j = 2:4
        f(j+16-1, 1) = sum(sum(bw60(j*10:j*10+1,:)));
        f(j+18, 1) = sum(sum(bw60(:, j*10:j*10+1)));
    end
%     f(27,1) = sum(diag(bw60)); %主对角线
%     f(28,1) = sum(diag(flipud(bw60))); %副对角线
    for j=17:22
        f(j , 1) = (120-f(j, 1))/120;
    end
    feature(:, i) = f;
end

end

