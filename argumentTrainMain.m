clc;
clear all;
% ��ȡ���� ͼƬ���ݶ�������img�� img�е�ÿ��Ԫ��Ϊ28*28��ͼ�����
root = './data';
img = readData(root);

%ͼ��Ԥ���� ����Ľ��������stdImg��
stdImg = imgProess(img);

%stdImg = load('stdImg.mat');

%������ȡ
imgFeature1 = getFeature1(stdImg); %����һ ��ͳ��3*3С���� 1�ĸ���  
imgFeature2 = getFeature2(stdImg); %������ 6,8,10,12  ������ 1�ĸ���
imgFeature3 = getFeature3(stdImg); %������ �ۺ�һ��

%������Լ� 
[inputTrain1, outputTrain1, inputTest1, outputTest1] = getTrainData(imgFeature1);
[inputTrain2, outputTrain2, inputTest2, outputTest2] = getTrainData(imgFeature2);
[inputTrain3, outputTrain3, inputTest3, outputTest3] = getTrainData(imgFeature3);



