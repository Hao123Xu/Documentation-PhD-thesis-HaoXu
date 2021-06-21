clc
close all
clear

Files3=dir('/data/id19/bones01/bones3/lea/hao/20200515/FD_Matlab/MeanValue_Subvol_G5_trabecular/*.xlsx');
data = cell(1,length(Files3));
for k=1:length(Files3)
   
   FileNames3 = sprintf('%s/%s',Files3(k).folder,Files3(k).name);
   
   C = xlsread(FileNames3) ;
   data{k} = C ;
   %C(7,7) = 0 ; % extend the size of metrix to match.
   %Z(:,k)=C(:,6) ;% colume 6 is MCC
   
end

mat = vertcat(data{:});

dlmwrite(sprintf('%s//G5_Mean_FD.csv',pwd),mat)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
close all
clear

Files3=dir('/data/id19/bones01/bones3/lea/hao/20200515/FD_Matlab/MeanValue_Subvol_G8_trabecular/*.xlsx');
data = cell(1,length(Files3));
for k=1:length(Files3)
   
   FileNames3 = sprintf('%s/%s',Files3(k).folder,Files3(k).name);
   
   C = xlsread(FileNames3) ;
   data{k} = C ;
   %C(7,7) = 0 ; % extend the size of metrix to match.
   %Z(:,k)=C(:,6) ;% colume 6 is MCC
   
end

mat = vertcat(data{:});

dlmwrite(sprintf('%s//G8_Mean_FD.csv',pwd),mat)


