% ²âÊÔ ÍøÂç

midNum = 35;

inputTrainData = importdata('inputTrainData.mat');
outputTrainData = importdata('outputTrainData.mat');

%[w1, b1, w2, b2] = networkTrain(midNum, inputTrainData, outputTrainData);

inputTestData = importdata('inputTestData.mat');
outputTestData = importdata('outputTestData.mat');

w1 = importdata('w1.mat');
b1 = importdata('b1.mat');
w2 = importdata('w2.mat');
b2 = importdata('b2.mat');

outputVector = networkTest(midNum, inputTestData, w1, b1, w2, b2);