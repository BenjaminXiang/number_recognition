function [ imgList ] = readData( root )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

files = dir(root);
imgNum = 1;
imgList = cell(0);
n = length(files);

for i = 1:n
    if strcmp(files(i).name, '.') || strcmp(files(i).name, '..')
    else
        rootPath = strcat(root, '/', files(i).name);
        fileList = dir(rootPath);
        m = length(fileList);
        for j = 1:m
            if strcmp(fileList(j).name, '.') || strcmp(fileList(j).name, '..')
            else
                imgPath = strcat(rootPath, '/', fileList(j).name);
                imgList{imgNum} = imread(imgPath);
                imgNum = imgNum + 1;
            end
        end
    end
end

end

