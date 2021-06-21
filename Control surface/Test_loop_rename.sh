#!/bin/bash

for file in /data/id19/bones01/bones3/lea/hao/20200613/ControlSurface/EdgeDetections/*.mhd
do
    
f=${file%_cw468_0001.txt.mhd};

/data/id19/bones01/bones/program/linux_debian/bin/volCropITK debX=0 debY=0 debZ=0 filein=$file fileout=${f}.mhd finX=0 finY=0 finZ=0 format=UCHAR

done


