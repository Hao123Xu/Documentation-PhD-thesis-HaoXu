% G1

clc
close all
clear

addpath('src')
Files=dir('/data/id19/bones01/bones3/lea/hao/20200613/G1_RO_8bit_preBB/volint/*.mhd');
currentFolder = pwd ;
%for k=1:length(Files)
   
   FileNames1 = sprintf('%s//%s',Files(1).folder,Files(1).name);
   I = read_mhd_new(FileNames1,1);
   [Y,X,Z] = size(I);
   cw = [4,6,8];
   filtStruct = createMonogenicFilters3D(Y,X,Z,cw,cw,'lg',0.55);
   [m1,m2,m3,m4] = monogenicSignal3D(I,filtStruct);
   [FS,FA] = featureSymmetry3D(m1,m2,m3,m4);
   
   suffix = '.mhd';  
   Files(1).name = strrep(Files(1).name,suffix,'') ;
   FileNames=Files(1).name ;
   mkdir(FileNames);
   
  
   
for i=1:1:Z
    dlmwrite(sprintf('%s//%s//%s_cw468_%04d.txt', pwd, Files(1).name,Files(1).name, i), FA(:,:,i));
end
        

%end
