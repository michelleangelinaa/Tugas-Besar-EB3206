% Input : K (Citra Biner Hasil Segmentasi)
% Output : Display citra RGB cropped dengan contour OD & Dice-Coefficient-2
% Penting : Fungsi DrawSegmentedArea2D (line 26) merupakan fungsi dari Matlab Apps
% 'Snake Active Contour'

% Ellips-Fitting
BW = K;
% Extract the maximum area
BW = imclearborder(BW);
BW = bwareafilt(BW,1);
% Calculate centroid, orientation and major/minor axis length of the ellipse
s = regionprops(BW,{'Centroid','Orientation','MajorAxisLength','MinorAxisLength'});
% Calculate the ellipse line
theta = linspace(0,2*pi);
col = (s.MajorAxisLength/2)*cos(theta);
row = (s.MinorAxisLength/2)*sin(theta);
M = makehgtform('translate',[s.Centroid, 0],'zrotate',deg2rad(-1*s.Orientation));
D = M*[col;row;zeros(1,numel(row));ones(1,numel(row))];
% Visualize the result
figure
imshow(final_loc),title('Output EF (Testing) - 092');
hold on
plot(D(1,:),D(2,:),'g','LineWidth',2)

P=D';
v = P(:, 1); P(:, 1) = P(:, 2); P(:, 2) = v;
EF=DrawSegmentedArea2D(P,[size(final_loc,1) size(final_loc,2)]);
% figure, imshow(EF);
% hold on; plot([P(:,2);P(1,2)],[P(:,1);P(1,1)]);
% Param
TPim2 = (EF & GT) == 1 ; TP2 = nnz(TPim2); %region segmented as Disk that proved to be Disk
FPim2 = (GT == 0); FPim2 = FPim2 & EF; FP2 = nnz(FPim2); %region segmented as Disk that proved to be not Disk
FNim2 = (EF == 0); FNim2 = FNim2 & GT; FN2 = nnz(FNim2);%region segmented as not Disk that proved to be Disk
DC2 = (2*TP2)/((2*TP2)+FP2+FN2)