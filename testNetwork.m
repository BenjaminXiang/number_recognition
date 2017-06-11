% 测试 网络
clc;

tic;
t1 = clock;

midNum = 35;

%root = './trainedData';
% inputTrainData = importdata(strcat(root, '/', 'inputTrain.mat'));
% outputTrainData = importdata(strcat(root, '/', 'outputTrain.mat'));

inputTrain = importdata('inputTrain.mat');
outputTrain = importdata('outputTrain.mat');

t2 = clock;
[w1, b1, w2, b2] = networkTrain(midNum, inputTrain, outputTrain);
disp(['网络训练时间：',num2str(etime(clock,t2))]);

% inputTestData = importdata(strcat(root, '/', 'inputTest.mat'));
% outputTestData = importdata(strcat(root, '/', 'outputTest.mat'));
% 
% w1 = importdata(strcat(root, '/', 'w1.mat'));
% b1 = importdata(strcat(root, '/', 'b1.mat'));
% w2 = importdata(strcat(root, '/', 'w2.mat'));
% b2 = importdata(strcat(root, '/', 'b2.mat'));

inputTestData = importdata('inputTest.mat');
outputVector = networkTest(midNum, inputTestData, w1, b1, w2, b2);

for i = 1:500
    outAns(i) = find(outputVector(:, i) == max(outputVector(:, i)))-1;
end

stdLabel = importdata('outputLabel.mat');
err = outAns - stdLabel;

k = 0;
errNum = zeros(1, 10);
for i = 1:500
    if err(i) ~= 0
        k = k+1;
        numK(k) = int32(stdLabel(1, i));
        errNum(1, numK(k)+1) = errNum(1, numK(k)+1)+1;
    end
end

disp(['程序总运行时间：',num2str(etime(clock,t1))]);

k
errRate = (500-k)/500;

err
errRate
errNum

