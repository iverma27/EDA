%function [rpix_in, rpix_out, redarea, sev] = redlevels(picname)
img = imread('num3.jpg');
img = img(:, :, 1);
section = roipoly(img);
red_vals = img(section);
red_sum = sum(red_vals, 1);
red_mean = sum(red_vals, 1) / sum(red_vals~=0, 1);