
%%%%%%%% Trabecular bone G5
%%%%%%%%%%%%%   

clc
close all
clear

addpath('boxcount')
Files=dir('/data/id19/bones01/bones3/lea/hao/20200617/G5/3-Trabecular/Trabecular/Bone/volint/*.mhd');

currentFolder = pwd ;
mkdir(['MeanValue_G5_trabecular'])
mkdir(['StandardDeviationValue_G5_trabecular'])
for k=1:length(Files)

   FileNames1 = sprintf('%s//%s',Files(k).folder,Files(k).name);
   I = read_mhd_new(FileNames1,1);
   
   [n, r] = boxcount(I) ;
   
   df = -diff(log(n))./diff(log(r));
   df_mean = mean(df(1:8));
   df_StandardDeviation= std(df(1:8)) ;
   
   suffix = '.mhd';  
   Files(k).name = strrep(Files(k).name,suffix,'') ;
   FileNames=Files(k).name ;
   
   headers = {FileNames};
   info_to_write1 = [headers , df_mean];
   info_to_write2 = [headers , df_StandardDeviation];
   
   Mean = cell2table(info_to_write1);
   StandardDeviation = cell2table(info_to_write2);
   
   writetable(Mean,sprintf('%s//MeanValue_G5_trabecular//%s_Mean_FD.xlsx',pwd,Files(k).name));
   writetable(StandardDeviation,sprintf('%s//StandardDeviationValue_G5_trabecular//%s_StandardDeviation_FD.xlsx',pwd,Files(k).name));
    
end
