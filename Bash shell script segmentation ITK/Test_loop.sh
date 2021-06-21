#!/bin/bash

#68
for file in /data/id19/bones01/bones3/lea/hao/20200613/G1_RO_8bit_preBB/volint/*.mhd
do
 
oarsub -l cpu=4,walltime=24 "./Test_new_final_3.sh filein=$file target=./ inter1=3 inter2=45" 

done



