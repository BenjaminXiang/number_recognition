clc;
clear all;
% ��ȡ���� ͼƬ���ݶ�������img�� img�е�ÿ��Ԫ��Ϊ28*28��ͼ�����
root = './data';
img = readData(root);

%ͼ��Ԥ���� ����Ľ��������stdImg��
stdImg = imgProess(img);

%������ȡ
imgFeature1 = getFeature1(stdImg); %����һ ��ͳ��3*3С���� 1�ĸ���  
imgFeature2 = getFeature2(stdImg); %������ 6,8,10,12  ������ 1�ĸ���
imgFeature3 = getFeature3(stdImg); %������ �ۺ�һ��




