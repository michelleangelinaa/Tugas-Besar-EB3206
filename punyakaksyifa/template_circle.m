%clear;clc;close all;

%%cari titik tengah dan ukuran bounding box terkecil
% A = imread('drishtiGS_098_ODAvgBoundary_OD_img.png');

% stats = regionprops(bwlabel(A,8), 'BoundingBox', 'Centroid');
% cx = uint16(stats.Centroid(1)); cy = uint16(stats.Centroid(2));
% bx = uint16(stats(1).BoundingBox(3)); by = uint16(stats(1).BoundingBox(4));
% tlx = uint16(stats(1).BoundingBox(1)); tly = uint16(stats(1).BoundingBox(2)); 
 
% B = imread('drishtiGS_098.png');
% tri = uint16(B(cy-514/2:cy+514/2, cx-446/2:cx+446/2, 1));
% tgi = uint16(B(cy-514/2:cy+514/2, cx-446/2:cx+446/2, 2));
% tbi = uint16(B(cy-514/2:cy+514/2, cx-446/2:cx+446/2, 3));

% tr = tr + tri; 
% tg = tg + tgi; 
% tb = tb + tbi;

% tr = tr/20;
% tg = tg/20;
% tb = tb/20;

% baru(:,:,1)=uint8(tr);baru(:,:,2)=uint8(tg);baru(:,:,3)=uint8(tb);
% template = uint8(baru);

% figure; imshow(template);


