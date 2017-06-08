function [ feature ] = getFeature3( stdImg )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

num = length(stdImg);
feature = zeros(24, 5000);
for i = 1:num
    imgTemp = stdImg{i};
    f = zeros(24, 1);

    bw60 = imresize(imgTemp, [60, 60]);
    for iRow = 0:3
        for jCol = 0:3
            tmp = sum(bw60( iRow*15+1:iRow*15+15, jCol*15+1:jCol*15+15));
            f(iRow*4+jCol+1, 1) = sum(tmp); 
        end
    end
    f = (225-f(1:16 , 1))/255;

    for j = 1:4
       f(j+16,1) = length(find(imgTemp(:, 6+(j-1)*2)));
       f(j+20,1) = length(find(imgTemp(6+(j-1)*2, :)));
    end
    f = (20-f(17:24))/20;
    
    feature(:, i) = f;
end

end

