function [ Img ] = invertImg( Img )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[row, col] = size(Img);
for i = 1:row
    for j = 1:col
        if Img(i, j) == 1
            Img(i, j) = 0;
        else Img(i, j) = 1;
        end
    end
end

end

