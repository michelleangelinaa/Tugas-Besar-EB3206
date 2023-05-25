% Input : final_loc : citra RGB cropped hasil lokalisasi
% Output : K = citra biner hasil segmentasi & DC1 : Disc Coefficient-1

% Segmentasi - RED 
red = final_loc(:,:,1);                                                 % ekstraksi kanal RED

mask = histeq(red);                                                     % Contrast Enhancement

h=1/15*ones(15,1);                                                      % Spatial Filtering
kernel = h*h'; J=uint8(conv2(mask,kernel,'same')); 

c = imdilate(J,strel('disk',9));                                         % Morphological Operations - BVR

bin = imbinarize(c,'global');                                           % OTSU Thresholding - Binerisasi    

bin = imclearborder(bin,8);                                             % Morphological Operations 
K = imopen(bin,strel('disk',10));
K = imclose(K,strel('disk',15));
K = imerode(K,strel('disk',1));
K = imfill (K,'holes');

figure, imshow(K),title('Output Segmentasi A (Training) - 098');        % Display

% Parameter F-Score I / Disc Metric
TPim = (K & GT) == 1 ; TP = nnz(TPim); %region segmented as Disk that proved to be Disk
FPim = (GT == 0); FPim = FPim & K; FP = nnz(FPim); %region segmented as Disk that proved to be not Disk
FNim = (K == 0); FNim = FNim & GT; FN = nnz(FNim);%region segmented as not Disk that proved to be Disk
DC1 = (2*TP)/((2*TP)+FP+FN)