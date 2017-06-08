function [ iImg ] = invertImg( Img )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[row, col] = size(Img);
iImg = zeros(row, col);
for i = 1:row
    for j = 1:col
        if Img(i, j) == 1
            iImg(i, j) = 0;
        else iImg(i, j) = 1;
        end
    end
end

end

