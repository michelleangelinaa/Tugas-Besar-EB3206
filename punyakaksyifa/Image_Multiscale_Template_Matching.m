clear;clear;close all;

A = imread('4.png'); R = A(:,:,1);
B = imread('4OD.png');
load template_circle.mat; load template_red.mat;
tr = template(:,:,1);
skala = [1.2; 1.15; 1.1; 1.05; 1; 0.95; 0.9; 0.85; 0.8; 0.75];
maxc = zeros(size(skala,1),1);
ypeak = zeros(size(skala,1),1); xpeak = zeros(size(skala,1),1);
meanr_hist = zeros(size(skala,1),1);
yoffSet = zeros(size(skala,1),1); xoffSet = zeros(size(skala,1),1);

for i = 1:size(skala,1)
    trup = imresize(tr,skala(i),"bicubic");
    c = normxcorr2(trup,R);
    maxc(i) = max(c(:));
    [ypeak(i),xpeak(i)] = find(c==maxc(i));
    yoffSet(i) = ypeak(i)-size(trup,1); xoffSet(i) = xpeak(i)-size(trup,2);
    %figure; imshow(A(yoffSet(i):ypeak(i), xoffSet(i):xpeak(i),1));
    [counts, binLoc]=imhist(A(yoffSet(i):ypeak(i), xoffSet(i):xpeak(i),1));
    meanr_hist(i)=sum(counts.*binLoc)/(sum(counts));
end

meanr = sum(BBR_hist.*binLoc)/(sum(BBR_hist)); meanr_hist = abs(meanr_hist(:)-meanr)/255;
final = 4*maxc-0.5*meanr_hist;
index = find(final==max(final(:)));

final_loc = A(yoffSet(index):ypeak(index), xoffSet(index):xpeak(index),:);
GT = B(yoffSet(index):ypeak(index), xoffSet(index):xpeak(index),:);

figure; imshow(final_loc); figure; imshow(GT);
final_cy = round((ypeak(index)+yoffSet(index))/2);
final_cx = round((xpeak(index)+xoffSet(index))/2);
roef = 100*sum(GT(:)/255)/(size(final_loc,1)*size(final_loc,2));
imwrite(final_loc, 'drishtiGS_092_A.png');
