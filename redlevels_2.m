%function [rpix_in, rpix_out, redarea, sev] = redlevels(picname)
pic = imread('num3.jpg');
reds = roipoly(pic);
rreds = pic(reds);
figure(2)
imshow(reds); %should be rreds
title('The fixed pic');
%end