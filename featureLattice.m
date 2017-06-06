function [ feature ] = featureLattice( stdImg )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

num = length(stdImg);
for i=1:num
    imgTemp = stdImg{i};
    for ii = 0:2
        for jj = 0:2
            tmp = sum(imgTemp( ii*3+1:ii*3+3, jj*3+1:jj*3+3));
            f( ii*3+jj+1 ) = sum(tmp); 
        end
    end
    f = (10-f)/10;
    f = f';
    feature(:, i) = f;
end

end

