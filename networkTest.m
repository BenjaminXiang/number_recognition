function [ yn ] = networkTest( midNum, inputData, w1, b1, w2, b2)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[rowIn, colIn] = size(inputData);
n = colIn;

for i = 1:n
    for j = 1:midNum
        I(j) = inputData(:, i)'*w1(:, j) + b1(j);
        Iout(j) = 1/(1+exp(-I(j)));
    end
    yn(:, i) = w2'*Iout' + b2;
end

end

