clear;clc;close all;

load template_circle.mat;

[BBR_hist, binLoc] = imhist(template(:,:,1));
meanr = (sum(BBR_hist.*binLoc)/(sum(BBR_hist)))/255; 
A = imread('30.png'); R = A(:,:,1); G = A(:,:,2);
B = imread('30OD.png');
bx = 550; by = 550;

Rb = imbinarize(R, meanr);
Rb = bwareaopen(Rb, 1000);
% figure, imshow(Rb)
% title('tR')

er = bwdist((~Rb));
maxer= max(er(:));
[yc,xc] = find(er>0.75*maxer);

cr = zeros(size(yc,1),1);

for k = 1:size(yc,1)
    y1 = yc(k)-514/2; y2 = yc(k)+514/2;
    x1 = xc(k)-446/2; x2 = xc(k)+446/2;
    if (y1 > 0 && x1 > 0 && y2 <= size(R,1) && x2 <= size(R,2))
        histn = imhist(R(y1:y2, x1:x2));
        cr(k) = 1/(1+sum((histn-BBR_hist).^2));
    else
        cr(k) = -1;
    end
end

index = find(cr == max(cr(:)));
cx = uint16(xc(index)); cy = uint16(yc(index));

final_loc = A(cy-by/2:cy+cy/2, cx-bx/2:cx+cx/2,:);
GT = B(cy-by/2:cy+cy/2, cx-bx/2:cx+cx/2,:);

%figure; imshow(final_loc); figure; imshow(GT);
od = 100*sum(GT(:))/sum(B(:));
roef = 100*sum(GT(:)/255)/(bx*by);
imwrite(final_loc, 'drishtiGS_092_A.png');

