clc;

tic;
t1 = clock;

inputTrain = importdata('inputTrain.mat');
outputTrain = importdata('outputTrain.mat');
inputTestData = importdata('inputTest.mat');
stdLabel = importdata('outputLabel.mat');

for midNum = 10:100
    [w1, b1, w2, b2] = networkTrain(midNum, inputTrain, outputTrain);
    w1List{midNum-9} = w1;
    b1List{midNum-9} = b1;
    w2List{midNum-9} = w2;
    b2List{midNum-9} = b2;
    
    outputVector = networkTest(midNum, inputTestData, w1, b1, w2, b2);

    for i = 1:500
        outAns(i) = find(outputVector(:, i) == max(outputVector(:, i)))-1;
    end


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
    errNumList{midNum-9} = errNum;
    rightRate{midNum-9} = (500-k)/500;
end
save errNumList errNumList;
save rightRate rightRate;
save w1List w1List;
save b1List b1List;
save w2List w2List;
save b2List b2List;

disp(['程序总运行时间：',num2str(etime(clock,t1))]);





k
errRate = (500-k)/500;