function [ w1, b1, w2, b2 ] = networkTrain( midNum, inputData, outputData)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

%
[rowIn, colIn] = size(inputData);
[rowOut, colOut] = size(outputData);
inNum = rowIn;
outNum = rowOut;

%Ȩֵ��ʼ��
w1=rands(inNum, midNum); % ����㵽������
b1=rands(midNum,1);
w2=rands(midNum,outNum); % �����㵽�����
b2=rands(outNum,1);

w2_1=w2;
w2_2=w2_1;
w1_1=w1;
w1_2=w1_1;

b1_1=b1;
b1_2=b1_1;
b2_1=b2;
b2_2=b2_1;

%ѧϰ��
xite=0.1;
alfa=0.01;

[m, n] = size(inputData);

%% ����ѵ��
for ii=1:30
    E(ii)=0;
    for i=1:1:n
       %% ����Ԥ����� 
        x=inputData(:,i); % 28*1
        % ���������
        for j=1:1:midNum
            I(j)=inputData(:,i)'*w1(:, j)+b1(j); 
            Iout(j)=1/(1+exp(-I(j)));
        end
        % ��������
        yn=w2'*Iout'+b2; % 10*1 (35*10)'*(1*35)'+(10*1) 
        
       %% Ȩֵ��ֵ����
        %�������
        e=outputData(:,i)-yn;  %10*1
        E(ii)=E(ii)+sum(abs(e));
        
        %����Ȩֵ�仯��
        dw2=e*Iout; % 10*35
        db2=e'; % 1*10
        
        for j=1:1:midNum
            S=1/(1+exp(-I(j))); % 1*35
            FI(j)=S*(1-S); % 1*35
        end      
        for k=1:1:inNum
            for j=1:1:midNum
                dw1(k,j)=FI(j)*x(k)*(w2(j,:)*e); 
                db1(j)=FI(j)*(w2(j,:)*e);
            end
        end
           
        w1=w1_1+xite*dw1;
        b1=b1_1+xite*db1';
        w2=w2_1+xite*dw2';
        b2=b2_1+xite*db2';
        
        w1_2=w1_1;
        w1_1=w1;
        w2_2=w2_1;
        w2_1=w2;
        
        b1_2=b1_1;
        b1_1=b1;
        b2_2=b2_1;
        b2_1=b2;
    end
end


end

