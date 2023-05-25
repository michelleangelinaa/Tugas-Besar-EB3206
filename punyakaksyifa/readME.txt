readME
1. "template_red.m" digunakan untuk menghitung parameter mean intensitas untuk metode lokalisasi dengan multi scale template matching.
 Keluaran dari file ini adalah "template_red.mat" yang berisi rata-rata intensitas citra training retina asli yang berukuran 
(378 x 404) (x x y) yang berpusat di titik pusat bounding box hasil dari eksplorasi citra training.

2. "template_circle.m" digunakan untuk menghitung parameter mean dan histogram intensitas untuk metode lokalisasi histogram template matching 
dan untuk template imgae bagi metode lokalisasi dengan multi scale imgae template matching.  
Keluaran dari file ini adalah "template_circle.mat" yang berisi rata-rata intensitas citra training retina asli yang berukuran (447 x 515) (x x y)
 yang berpusat di titik pusat bounding box hasil dari eksplorasi citra training 

3. "eksplorasi.m" digunakan untuk menghitung bounding box terkecil dari citra hasil segmentasi manual oleh dokter, beserta titik pusatnya. 
Dan untuk menghitung histogram kanal merah dan hijau dari OD.

4. "Image_Multiscale_Template_Matching" berisi program untuk lokalisasi OD dengan metode multiscale image template matching. 
Keluaran utama dari file ini berupa citra OD RGB hasil lokalisasi. Input pada file ini, yaitu "template_red.m" dan "template_circle.m".

5. "Hist_Template_Matching" berisi program untuk lokalisasi OD dengan metode histogram template matching. 
Keluaran utama dari file ini berupa citra OD RGB hasil lokalisasi. Input pada file ini, yaitu "template_circle.m".

6. "Lokalisasi_analisis.xlsx" berisi data %OD, %efisiensi, panjang serta lebar bounding box, dan rata-rata dari ketiga parameter yang disebutkan.

7. "segment_red.m" merupakan program segmentasi kanal R RGB.
Input : final_loc : citra RGB cropped hasil lokalisasi
Output : K = citra biner hasil segmentasi & DC1 : Disc Coefficient-1

8. "segment_intensity.m" merupakan program segmentasi kanal I HSI.
Input : final_loc : citra RGB cropped hasil lokalisasi
Output : m2 = citra biner hasil segmentasi & DC1 : Disc Coefficient-1
PENTING : Penting : Membutuhkan Install Matlab Apps 'Colorspace Transformations by Pascal G' untuk menjalankan fungsi colorspace (line 8)

9. "eksplorasi2.m" merupakan program eksplorasi perhitungan luas area OD dan display histogram
PENTING : Penting : Membutuhkan Install Matlab Apps 'Colorspace Transformations by Pascal G' untuk menjalankan fungsi colorspace (konversi RGB -> HSI)

10. "ef.m" merupakan program yang menghasilkan kontur OD pada citra retina RGB cropped
Input : K (Citra Biner Hasil Segmentasi)
Output : Display citra RGB cropped dengan contour OD & Dice-Coefficient-2
Penting : Fungsi DrawSegmentedArea2D (line 26) merupakan fungsi dari Matlab Apps
'Snake Active Contour'


10. 