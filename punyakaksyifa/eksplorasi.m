clear;clc;close all;

%%cari titik tengah dan ukuran bounding box terkecil
A = imread('drishtiGS_017_ODAvgBoundary_OD_img.png');
figure
imshow(A)
hold on
stats = regionprops(bwlabel(A,8), 'BoundingBox', 'Centroid');
cx = uint16(stats.Centroid(1)); cy = uint16(stats.Centroid(2));
bx = uint16(stats(1).BoundingBox(3)); by = uint16(stats(1).BoundingBox(4));
tlx = uint16(stats(1).BoundingBox(1)); tly = uint16(stats(1).BoundingBox(2)); 
rectangle('Position',stats(1).BoundingBox,'EdgeColor','r','LineWidth',2);
plot(cx,cy, '-m+');
hold off


B = imread('drishtiGS_017.png');

BR = B(:,:,1);
A = A/255;
overlay = BR.*A;

[OD_hist, nOD_hist] = imhist(overlay(overlay > 0));
[BB_hist, nBB_hist] = imhist(BR(tly:tly+by-1, tlx:tlx+bx-1));
BB_hist = logical(OD_hist).*BB_hist;

%%histogram OD retina
figure
bar(nOD_hist,OD_hist, 0.5);
xlim([0 255])
ylim([0 3500])
title('red channel');

%%histogram objek dengan intensitas yang sama dengan OD retina yang ada di dalam
%%bounding box
figure
bar(nBB_hist,BB_hist-OD_hist, 0.5); 
xlim([0 255])
ylim([0 3500])
title('red channel')

BR = B(:,:,2);
overlay = BR.*A;

[OD_hist, nOD_hist] = imhist(overlay(overlay > 0));
[BB_hist, nBB_hist] = imhist(BR(tly:tly+by-1, tlx:tlx+bx-1));
BB_hist = logical(OD_hist).*BB_hist;

%%histogram OD retina
figure
bar(nOD_hist,OD_hist, 0.5);
xlim([0 255])
ylim([0 3500])
title('green channel');

%%histogram objek dengan intensitas yang sama dengan OD retina yang ada di dalam
%%bounding box
figure
bar(nBB_hist,BB_hist-OD_hist, 0.5); 
xlim([0 255])
ylim([0 3500])
title('green channel')
