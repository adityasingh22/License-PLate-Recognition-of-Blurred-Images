clc
close all;
clear;

load imgfildata;

[file1,path1]=uigetfile({'*.jpg;*.bmp;*.png;*.tif'},'Choose an image to emulate');
s1=[path1,file1];
img1=imread(s1);
wiener_filter_noise(img1);
for i=1:4
    [file,path]=uigetfile({'*.jpg;*.bmp;*.png;*.tif'},'Choose an image to recognize');
    s=[path,file];
    img=imread(s);
    np=license_plate(img);
    if i==1
        disp('License plate of original image');
        disp(np);
    elseif i==2
        disp('License plate of blurred image with no noise');
        disp(np);
    elseif i==3
        disp('License plate of blurred image with Gaussian noise');
        disp(np);
    else
        disp('License plate of blurred image with Quantized noise');
        disp(np);
    end
    
end