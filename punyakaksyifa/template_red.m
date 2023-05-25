%clear;clc;close all;

%cari titik tengah dan ukuran bounding box terkecil
% A = imread('drishtiGS_098_ODAvgBoundary_OD_img.png');
% stats = regionprops(bwlabel(A,8), 'BoundingBox', 'Centroid');
% cx = uint16(stats.Centroid(1)); cy = uint16(stats.Centroid(2));
% bx = uint16(stats(1).BoundingBox(3)); by = uint16(stats(1).BoundingBox(4));
% tlx = uint16(stats(1).BoundingBox(1)); tly = uint16(stats(1).BoundingBox(2)); 
% 
% B = imread('drishtiGS_098.png');
% 
% BR = B(:,:,1); BG = B(:,:,2); BB = B(:,:,3);

% [BBR_hist, nBBR_hist] = imhist(BR(tly:tly+404-1, tlx:tlx+378-1));
% [BBG_hist, nBBG_hist] = imhist(BG(tly:tly+404-1, tlx:tlx+378-1));
% [BBB_hist, nBBB_hist] = imhist(BB(tly:tly+404-1, tlx:tlx+378-1));

% [BBRu_hist, nBBRu_hist] = imhist(BR(tly:tly+404-1, tlx:tlx+378-1));
% [BBGu_hist, nBBGu_hist] = imhist(BG(tly:tly+404-1, tlx:tlx+378-1));
% [BBBu_hist, nBBBu_hist] = imhist(BB(tly:tly+404-1, tlx:tlx+378-1));
% 
% BBR_hist = (BBRu_hist+BBR_hist);
% BBG_hist = (BBGu_hist+BBG_hist);
% BBB_hist = (BBBu_hist+BBB_hist);

% BBR_hist = (BBRu_hist+BBR_hist)/20;
% BBG_hist = (BBGu_hist+BBG_hist)/20;
% BBB_hist = (BBBu_hist+BBB_hist)/20;

% figure
% bar(nBBRu_hist,BBR_hist, 0.5);
% xlim([0 255])
% ylim([0 3500])
% title('Template kanal merah');
% 
% figure
% bar(nBBGu_hist,BBG_hist, 0.5);
% xlim([0 255])
% ylim([0 3500])
% title('Template kanal hijau');
% 
% figure
% bar(nBBBu_hist,BBB_hist, 0.5);
% xlim([0 255])
% ylim([0 3500])
% title('Template kanal Biru');

% BBR_hist = BBR_hist/20;
% BBG_hist = BBG_hist/20;
% BBB_hist = BBB_hist/20;










