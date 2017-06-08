function [ feature ] = getFeature1( stdImg )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

num = length(stdImg);
feature = zeros(16, 5000);
for i=1:num
    imgTemp = stdImg{i};
    %充填至 60*60 以增加 不同类间特征的差异程度
    bw60 = imresize(imgTemp, [60, 60]);
    
%     for ii=1:60
%         for jj=1:60
%             if bw60(ii, jj) == 1
%                 bw60(ii, jj) = 0;
%             else
%                 bw60(ii, jj) = 1;
%             end
%         end
%     end
  
    f = zeros(16,1);
    for iRow = 0:3
        for jCol = 0:3
            tmp = sum(bw60( iRow*15+1:iRow*15+15, jCol*15+1:jCol*15+15));
            f(iRow*4+jCol+1, 1) = sum(tmp); 
        end
    end
    f = (225-f)/225;
    feature(:, i) = f;
end

end

