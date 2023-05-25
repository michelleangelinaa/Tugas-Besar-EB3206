% Input : final_loc : citra RGB cropped hasil lokalisasi
% Output : m2 = citra biner hasil segmentasi & DC1 : Disc Coefficient-1

% Penting : Membutuhkan Install Matlab Apps 'Colorspace Transformations by Pascal G' untuk
% menjalankan fungsi colorspace (line 8)

% Segmentasi - HSI - Sopharak
in = colorspace('->hsi',final_loc);                                     % ekstraksi channel Intensity (HSI)
ins = in(:,:,3);

sop = histeq(ins);                                                      % Contrast Enhancement

sop = medfilt2(sop,[3 3]);                                              % Spatial Filtering

c = imclose(J,strel('disk',2));                                       % Morphological Operations
im = imopen(c,strel('disk',30));

bi = imbinarize(im,'global');                                           % OTSU Thresholding & Binerisasi

bin = imclose(bi,strel('disk',30));                                     % Morphological Operations II
bin = imfill(bin,'holes');
m2 = imopen(bin,strel('disk',40));

figure; imshow(sop), title('Output Segmentasi (Citra Biner) - 017');     % Display

% Parameter F-Score I / Disc Metric
TPim = (m2 & GT) == 1 ; TP = nnz(TPim); %region segmented as Disk that proved to be Disk
FPim = (GT == 0); FPim = FPim & m2; FP = nnz(FPim); %region segmented as Disk that proved to be not Disk
FNim = (m2 == 0); FNim = FNim & GT; FN = nnz(FNim);%region segmented as not Disk that proved to be Disk
DC1 = (2*TP)/((2*TP)+FP+FN)