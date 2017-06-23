clc;

stdImgThin = importdata('stdImgThin.mat');
imgFeature = getFeature3(stdImgThin);

[inputTrainT, outputTrainT, inputTestT, outputTestT, outputLabelT] = getTrainData(imgFeature);

[w1T, b1T, w2T, b2T] = networkTrain(85, inputTrainT, outputTrainT);

outputVector = networkTest(85, inputTestT, w1T, b1T, w2T, b2T);

for i = 1:500
    outAns(i) = find(outputVector(:, i) == max(outputVector(:, i)))-1;
end

stdLabel = outputLabelT;
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

k
errRate = (500-k)/500;

err
errRate
errNum