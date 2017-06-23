clc;

root = './data';
img = readData(root);

[stdImg, stdImg60] = imgProess(img);

imgFeature = getFeature3(stdImg);

for midNum = 91:110
    midNum
    rightRateM(midNum)=0;
    w1m{midNum}=0;
    b1m{midNum}=0;
    w2m{midNum}=0;
    b2m{midNum}=0;
    for  ii= 1:10
        [inputTrain, outputTrain, inputTest, outputTest, outputLabel] = getTrainData(imgFeature);
        [w1, b1, w2, b2] = networkTrain(midNum, inputTrain, outputTrain);
        w1m{midNum}= w1m{midNum}+w1;
        b1m{midNum}= b1m{midNum}+b1;
        w2m{midNum}= w2m{midNum}+w2;
        b2m{midNum}= b2m{midNum}+b2;
        outputVector = networkTest(midNum, inputTest, w1, b1, w2, b2);
        
        for i = 1:500
            outAns(i) = find(outputVector(:, i) == max(outputVector(:, i)))-1;
        end
        
        err = outAns - outputLabel;
        
        k = 0;
        errNum = zeros(1, 10);
        for i = 1:500
            if err(i) ~= 0
                k = k+1;
                numK(k) = int32(outputLabel(1, i));
                errNum(1, numK(k)+1) = errNum(1, numK(k)+1)+1;
            end
        end
        rightRateM(midNum) = rightRateM(midNum) + (500-k)/500;
    end
    rightRateM(midNum)= rightRateM(midNum)/10;
    w1m{midNum}= w1m{midNum}/10;
    b1m{midNum}= b1m{midNum}/10;
    w2m{midNum}= w2m{midNum}/10;
    b2m{midNum}= b2m{midNum}/10;
    
end