%function [rpix_in, rpix_out, redarea, sev] = redlevels(picname)
pic = imread('num.jpg');
[rows, cols, colors] = size(pic);
% pre image processing
p
pic = imlocalbrighten(pic);
imshow(pic)
%tried edge detection, didn't work out well so I will use cell detection
pic = rgb2gray(pic);
[~,threshold] = edge(pic, 'sobel');
BWs = edge(pic, 'sobel', threshold * 0.3); %0.3 is fudge factor, 0.5 works for others, how do I determine the best
se90 = strel('line', 3, 90); %only line sizes of 2 and 3 work
se0 = strel('line', 3, 0);
BWsdil = imdilate(BWs, [se90 se0]);
BWdfill = imfill(BWsdil, 'holes');
BWnobord = imclearborder(BWdfill);
seD = strel('diamond', 1);
BWfinal = imerode(BWnobord, seD);
BWfinal = imerode(BWfinal, seD);
%imshow(labeloverlay(pic,BWfinal))
%end