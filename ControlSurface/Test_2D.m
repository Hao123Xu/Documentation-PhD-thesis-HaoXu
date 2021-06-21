clc
close all
clear

addpath('src')
I = imread('Metangiobone_2A_C2G_Metaphyse_16_median.png');
[Y,X] = size(I);

cw = 10 ;
filtStruct = createMonogenicFilters(Y,X,cw,'lg',0.55);
[m1,m2,m3] = monogenicSignal(I,filtStruct);
LP = localPhase(m1,m2,m3);

figure(1)
imagesc(reshape(LP,Y,[])), axis image, axis off, colormap gray
title('Local Phase Over Scales')

%% write on a file
dlmwrite('LP_2D.txt',LP)



