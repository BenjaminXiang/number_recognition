function [ inputTrain, outputTrain, inputTest, outputTest] = getTrainData( imgFeature )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

output = zeros(10, 5000);
for i = 1:10
    for j = 1:500
        output(i, (i-1)*500+j)=1;
    end
end

k = rand(1, 5000);
[m, n] = sort(k);

inputTrain = imgFeature(:, n(1:4500));
outputTrain = output(:, n(1:4500));
inputTest = imgFeature(:, n(4501:5000));
outputTest = output(:, n(4501:5000));

end

