% Eksplorasi : 3 Section
% Section 1 : Hitung Luas OD
% Section 2 : Display Histogram Overlay RED RGB
% Section 3 : Display Histogram Overlay Intensitas HSI (Penting! : Membutuhkan Install Matlab Apps 
% 'Colorspace Transformations by Pascal G' untuk menjalankan fungsi colorspace (line 25)

% Luas Area OD (Dalam Piksel)
I = imread('drishtiGS_098_ODAvgBoundary_OD_img.png') ;
OD_Area = nnz(I) % total area based on number of white pixels

%%  Histogram Overlay Red Channel
% ref https://www.mathworks.com/matlabcentral/answers/447629-combine-two-images-using-masking
I = imread('drishtiGS_017.png') ;
I1 = I(:,:,2);
I2 = imread('drishtiGS_017_ODAvgBoundary_OD_img.png') ;
[y,x] = find(I2==0) ; 
T = I1;
T(~I2) = 0 ;
I1 = T ;
%figure,imshow(I1);
figure(2),imhist(I1),title('Red Channel - 017'),xlim([0 255]),ylim([0 4000]); 

%% Histogram Overlay Intensity Channel
I = imread('drishtiGS_017.png');
in = colorspace('->hsi',I);
I1 = in(:,:,3);
I2 = imread('drishtiGS_017_ODAvgBoundary_OD_img.png') ;
[y,x] = find(I2==0) ; 
T = I1;
T(~I2) = 0 ;
I1 = T ;
figure,imhist(I1),title('Intensity CH - 017'),xlim([0 1]),ylim([0 4000]); 