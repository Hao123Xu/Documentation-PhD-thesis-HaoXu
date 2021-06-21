clc
close all
clear

addpath('src')

I = read_mhd_new('C:\Users\hxu\Desktop\20200207\000_Final_Markers_InputImages\000_final-InputImages\Originals\27_Sigma_Tree_255_Knots_208.mhd',1);
[Y,X,Z] = size(I);
cw = [4,6,8];
filtStruct = createMonogenicFilters3D(Y,X,Z,cw,cw,'lg',0.55);
[m1,m2,m3,m4] = monogenicSignal3D(I,filtStruct);
[FS,FA] = featureSymmetry3D(m1,m2,m3,m4);

for i=1:1:304
    dlmwrite(sprintf('C:/Users/hxu/Desktop/20200207/000_Final_Markers_InputImages/000_final-InputImages/27_Sigma_Tree_255_Knots_208/FA_27_Sigma_Tree_255_Knots_208_cw468_%04d.txt', i), FA(:,:,i));
end

