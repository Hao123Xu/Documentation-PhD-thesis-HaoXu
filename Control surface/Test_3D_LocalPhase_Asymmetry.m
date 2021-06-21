% G1

clc
close all
clear

addpath('src')
Files=dir('/data/id19/bones01/bones3/lea/hao/20190605-Process_80samples/Group1/volint/*.mhd');
currentFolder = pwd ;
for k=1:length(Files)
   
   FileNames1 = sprintf('%s//%s',Files(k).folder,Files(k).name);
   I = read_mhd_new(FileNames1,1);
   [Y,X,Z] = size(I);
   cw = [4,6,8];
   filtStruct = createMonogenicFilters3D(Y,X,Z,cw,cw,'lg',0.55);
   [m1,m2,m3,m4] = monogenicSignal3D(I,filtStruct);
   [FS,FA] = featureSymmetry3D(m1,m2,m3,m4);
   
   suffix = '.mhd';  
   Files(k).name = strrep(Files(k).name,suffix,'') ;
   FileNames=Files(k).name ;
   mkdir(FileNames);
   
  
   
for i=1:1:Z
    dlmwrite(sprintf('%s//%s//%s_cw468_%04d.txt', pwd, Files(k).name,Files(k).name, i), FA(:,:,i));
end
        

end

% G2

clc
close all
clear

addpath('src')
Files=dir('/data/id19/bones01/bones3/lea/hao/20190605-Process_80samples/Group2/volint/*.mhd');
currentFolder = pwd ;
for k=1:length(Files)
   
   FileNames1 = sprintf('%s//%s',Files(k).folder,Files(k).name);
   I = read_mhd_new(FileNames1,1);
   [Y,X,Z] = size(I);
   cw = [4,6,8];
   filtStruct = createMonogenicFilters3D(Y,X,Z,cw,cw,'lg',0.55);
   [m1,m2,m3,m4] = monogenicSignal3D(I,filtStruct);
   [FS,FA] = featureSymmetry3D(m1,m2,m3,m4);
   
   suffix = '.mhd';  
   Files(k).name = strrep(Files(k).name,suffix,'') ;
   FileNames=Files(k).name ;
   mkdir(FileNames);
   
  
   
for i=1:1:Z
    dlmwrite(sprintf('%s//%s//%s_cw468_%04d.txt', pwd, Files(k).name,Files(k).name, i), FA(:,:,i));
end
        

end

% G3

clc
close all
clear

addpath('src')
Files=dir('/data/id19/bones01/bones3/lea/hao/20190605-Process_80samples/Group3/volint/*.mhd');
currentFolder = pwd ;
for k=1:length(Files)
   
   FileNames1 = sprintf('%s//%s',Files(k).folder,Files(k).name);
   I = read_mhd_new(FileNames1,1);
   [Y,X,Z] = size(I);
   cw = [4,6,8];
   filtStruct = createMonogenicFilters3D(Y,X,Z,cw,cw,'lg',0.55);
   [m1,m2,m3,m4] = monogenicSignal3D(I,filtStruct);
   [FS,FA] = featureSymmetry3D(m1,m2,m3,m4);
   
   suffix = '.mhd';  
   Files(k).name = strrep(Files(k).name,suffix,'') ;
   FileNames=Files(k).name ;
   mkdir(FileNames);
   
  
   
for i=1:1:Z
    dlmwrite(sprintf('%s//%s//%s_cw468_%04d.txt', pwd, Files(k).name,Files(k).name, i), FA(:,:,i));
end
        

end

% G4

clc
close all
clear

addpath('src')
Files=dir('/data/id19/bones01/bones3/lea/hao/20190605-Process_80samples/Group4/volint/*.mhd');
currentFolder = pwd ;
for k=1:length(Files)
   
   FileNames1 = sprintf('%s//%s',Files(k).folder,Files(k).name);
   I = read_mhd_new(FileNames1,1);
   [Y,X,Z] = size(I);
   cw = [4,6,8];
   filtStruct = createMonogenicFilters3D(Y,X,Z,cw,cw,'lg',0.55);
   [m1,m2,m3,m4] = monogenicSignal3D(I,filtStruct);
   [FS,FA] = featureSymmetry3D(m1,m2,m3,m4);
   
   suffix = '.mhd';  
   Files(k).name = strrep(Files(k).name,suffix,'') ;
   FileNames=Files(k).name ;
   mkdir(FileNames);
   
  
   
for i=1:1:Z
    dlmwrite(sprintf('%s//%s//%s_cw468_%04d.txt', pwd, Files(k).name,Files(k).name, i), FA(:,:,i));
end
        

end
