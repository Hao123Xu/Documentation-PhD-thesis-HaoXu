#!/bin/bash



## CURRENT VERSION ONLY AUTOMATIC MASK GENERATION

E_NOPARAM=64
E_WRONGPARAM=65
E_FILE=66
E_NOFILE=67
E_FILETYPE=68
E_TWOPARAM=69

usage () 
{
  ERROR_CODE=$1
  case $ERROR_CODE in
    $E_NOPARAM    ) echo "No parameters gBVen!" >&2 ;;
    $E_TWOPARAM   ) echo "Parameter gBVen twice!" >&2 ;;
    $E_FILE       ) echo "$2 does not exist!" >&2 ;;
    $E_FILETYPE   ) echo "$fname does not end with .mhd!" >&2 ;;
    $E_WRONGPARAM ) echo "incorrect argument" >&2 ;;
    $E_NOFILE     ) echo "no input file specified" >&2 ;;
    *             ) echo "unspecified error" >&2 ;;
  esac

  echo "Extract bone and vessel volumes from tomographic data"
  echo
  echo "Usage:"
  echo 
  echo "./Test-Hysteresis.sh filein= volume to treat (.mhd)"
  echo "                   target= result directory (default .)"
  #echo "                     mask= mask file (full path)" 
  #echo "                    inter= save intermediary volumes (default (0)) (not implemented)"

  exit $ERROR_CODE
}

## CHECK INPUT PARAMETERS #########################

[ "$#" -le 0 ] && usage $E_NOPARAM  #  If too few parameters

while [ $# -ge 1 ]; do # Read through input parameters
  case "$1" in 
    filein=*) 
      [ -n "$f" ] && usage $E_TWOPARAM                    # Check dual parameter
      fname=${1:7}                                        # Remove prefix
      [ ! -e $fname ] && usage $E_FILE $fname             # exists?
      [ ${fname##*.} != mhd ] && usage $E_FILETYPE $fname # is .mhd?
      dir=${fname%/*} # read path from fname (strip shortest match to /* from end
      f=${fname##*/}  # read filename (strip longest match to */ from start
      f=${f%.mhd};;   # Remove suffix
 
    target=*) 
      [ -n "$targetdir" ] && usage $E_TWOPARAM # check dual parameter
      targetdir=${1:7};;                       # Strip target directory name

    # mask=*) 
     # [ -n "$maskfile" ] && usage $E_TWOPARAM # check dual parameter
     # maskfile=${1:5} #  
     # [ ! -e $maskfile ] && usage $E_FILE $maskfile ;; #exist?

    # inter=*) 
     # [ -n "$save_int" ] && usage $E_TWOPARAM # check dual parameter
     #  save_int=${1:6};;   # TODO: Check if correct value
                          # TODO: Implement cleanup if =1
    inter1=*) 
      [ -n "$save_int1" ] && usage $E_TWOPARAM # check dual parameter
       save_int1=${1:7};;   # TODO: Check if correct value
                          # TODO: Implement cleanup if =1
    inter2=*) 
      [ -n "$save_int2" ] && usage $E_TWOPARAM # check dual parameter
       save_int2=${1:7};;   # TODO: Check if correct value
                          # TODO: Implement cleanup if =1

    *) usage $E_WRONGPARAM;;
  esac
  shift
done

[ -z $f ] && usage $E_NOFILE            # Check that a file name is gBVen
[ -z $targetdir ] && targetdir=$PWD     # if no target directory gBVen, set to current
[ ! -e $targetdir ] && mkdir $targetdir # if target dir doesn't exist,create it
[ ! -e $targetdir/volint ] && mkdir $targetdir/volint # if intermediary result dir doesnt exist
[ ! -e $targetdir/volres ] && mkdir $targetdir/volres # if result dir doesn't exist, create it
[ ! -e $targetdir/ExtractWatershedFinal ] && mkdir $targetdir/ExtractWatershedFinal  # if result dir doesn't exist, create it
[ ! -e $targetdir/volstat ] && mkdir $targetdir/volstat  # if result dir doesn't exist, create it
[ ! -e $targetdir/volstat/result ] && mkdir $targetdir/volstat/result  # if result dir doesn't exist, create it

[ ! -e $targetdir/volstat/result/vv ] && mkdir $targetdir/volstat/result/vv
[ ! -e $targetdir/volstat/result/bv ] && mkdir $targetdir/volstat/result/bv
[ ! -e $targetdir/volstat/result/tv ] && mkdir $targetdir/volstat/result/tv
[ ! -e $targetdir/volstat/result/boneth ] && mkdir $targetdir/volstat/result/boneth
[ ! -e $targetdir/volstat/result/vesselth ] && mkdir $targetdir/volstat/result/vesselth

[ ! -e $targetdir/volres/tv ] && mkdir $targetdir/volres/tv
[ ! -e $targetdir/volres/bone ] && mkdir $targetdir/volres/bone
[ ! -e $targetdir/volres/vessel ] && mkdir $targetdir/volres/vessel

dirint=$targetdir/volint # set working directories
dirres=$targetdir/volres
dirslice=$targetdir/ExtractWatershedFinal
dirstat=$targetdir/volstat

dirrestv=$targetdir/volres/tv
dirresbone=$targetdir/volres/bone
dirresvessel=$targetdir/volres/vessel

dirvv=$targetdir/volstat/result/vv
dirbv=$targetdir/volstat/result/bv
dirtv=$targetdir/volstat/result/tv
dirboneth=$targetdir/volstat/result/boneth
dirvesselth=$targetdir/volstat/result/vesselth

volinvert=/data/id19/bones01/bones/program/linux_debian/bin/volInvertITK
volbinopen=/data/id19/bones01/bones3/lea/hao/Core-4/build/Test-volBinOpenITK/volBinOpenITK
volerode=/data/id19/bones01/bones/program/linux_debian/bin/volErodeITK
volsubstract=/data/id19/bones01/bones/program/linux_debian/bin/volSubstractITK      ## when the result is <0, then give the pixel 1, not 0/255.---> solution:thresholding
hysteresis=/data/id19/bones01/bones/program/linux_debian/bin/volHysteresisITK
voldilat=/data/id19/bones01/bones/program/linux_debian/bin/volDilateITK 
voladd=/data/id19/bones01/bones/program/linux_debian/bin/volAddITK 
watershed=/data/id19/bones01/bones3/lea/hao/Core-4/build/watershedtest
volcompconnnew=/data/id19/bones01/bones3/lea/hao/Core-4/build/volCompConnITK-short-new
AddConstant=/data/id19/bones01/bones3/lea/hao/Core-4/build/Test-AddConstantToImageFilter/New/AddConstantToImageFilter
mask=/data/id19/bones01/bones3/lea/hao/Core-4/build/Test-mask/unsigned_short/vessel/volMaskITK
add=/data/id19/bones01/bones3/lea/hao/Core-4/build/Test-add-16bit/volAddITK16bit
IntensityWindowing=/data/id19/bones01/bones3/lea/hao/Core-4/build/Test-IntensityWindowimage/IntensityWindowingImage
volmedian=/data/id19/bones01/bones/program/linux_debian/bin/volMedianITK
volbin=/data/id19/bones01/bones/program/linux_debian/bin/volBinITK
volMultConst=/data/id19/bones01/bones/program/linux_debian/bin/volMultConstITK	
volbv=/data/id19/bones01/bones/program/linux_debian/bin/volHistoITK
volmult=/data/id19/bones01/bones/program/linux_debian/bin/volMultITK
mhdtoacr=/data/id19/bones01/bones3/lea/hao/Core-4/build/mhdtoacr-1
epaisseurseq=/data/id19/bones01/bones/program/linux_debian/bin/epaisseurseq
acrtomhd=/data/id19/bones01/bones/program/linux_debian/bin/acrtomhd
fillhole=/data/id19/bones01/bones3/lea/hao/Core-4/build/fillhole_slicebyslice-modify2
OR=/data/id19/bones01/bones3/lea/hao/Core-4/build/LogicOR
AND=/data/id19/bones01/bones3/lea/hao/Core-4/build/LogicAND
Bilateral=/data/id19/bones01/bones3/lea/hao/Core-4/build/BilateralImageFilter
Canny=/data/id19/bones01/bones3/lea/hao/Core-4/build/CannyEdgeDetectionImageFilter
Gradient=/data/id19/bones01/bones3/lea/hao/Core-4/build/GradientMagnitudeImageFilter
Skeleton=/data/id19/bones01/bones3/lea/hao/Core-4/build/itkBinaryThinningImageFilterTest
Fillhole1=/data/id19/bones01/bones3/lea/hao/Core-4/build/volFillHolesITKmodify-3
Skeleton3d=/data/id19/bones01/bones3/lea/hao/Core-4/build/CanaliSkeletonize3D
Expand=/data/id19/bones01/bones/program/linux_debian/bin/volExpandITK
Crop=/data/id19/bones01/bones/program/linux_debian/bin/volCropITK
Slicesxyz=/data/id19/bones01/bones/program/linux_debian/bin/slicesxyz
SkeletonModify=/data/id19/bones01/bones3/lea/hao/Core-4/build/BinaryThinning3D
#################### PRE-PROCESS ################################################################################################################################################################################################
## Marker
#################### Prepare #####
#################### Marker Bone #####
echo "10"
## Vessels, Hysteresis from original image
$hysteresis filein=${f}.mhd fileout=${dirint}/${f}rg_vaiss_.mhd format=UCHAR inter=HAUT max=250 min=240
echo "20"
$voldilat filein=${dirint}/${f}rg_vaiss_.mhd fileout=${dirint}/${f}rg_vaiss_dilate.mhd size=1 topology=2
echo "30"
## Bone, Hysteresis from original image
$hysteresis filein=${f}.mhd fileout=${dirint}/${f}rg_bone_vaiss_.mhd format=UCHAR inter=HAUT max=200 min=115
echo "40"
## Substract for bone
$volsubstract filein1=${dirint}/${f}rg_bone_vaiss_.mhd filein2=${dirint}/${f}rg_vaiss_dilate.mhd fileout=${dirint}/${f}rg_diff_bone_.mhd thread=0
echo "50"
$hysteresis filein=${dirint}/${f}rg_diff_bone_.mhd fileout=${dirint}/${f}rg_diff_bone_hys_.mhd format=UCHAR inter=HAUT max=200 min=150
echo "60"
$volbinopen filein=${dirint}/${f}rg_diff_bone_hys_.mhd fileout=${dirint}/${f}rg_bone_.mhd radius=1

###
###improve the bone with deleting
###
echo "70"
$voldilat filein=${dirint}/${f}rg_vaiss_.mhd fileout=${dirint}/${f}rg_vaiss_dilate5.mhd size=5 topology=2

echo "close size 2"
echo "1"
$voldilat filein=${dirint}/${f}rg_vaiss_dilate5.mhd fileout=${dirint}/${f}rg_vaiss_dilate_c3.mhd size=3 topology=2 
echo "2"
$volerode filein=${dirint}/${f}rg_vaiss_dilate_c3.mhd fileout=${dirint}/${f}rg_close3.mhd size=3 topology=2

echo "Process with bone"
$volinvert filein=${dirint}/${f}rg_close3.mhd fileout=${dirint}/${f}rg_close3_invert.mhd format=UCHAR maximum=255
$AND filein1=${dirint}/${f}rg_close3_invert.mhd filein2=${dirint}/${f}rg_bone_.mhd fileout=${dirint}/${f}rg_bone_first.mhd

###
###
###
#####################################################
#####################################################
####################
#################### Marker Vessel #####
echo "70"
## Vessels, Hysteresis from original image
$hysteresis filein=${f}.mhd fileout=${dirint}/${f}rg_vaiss_marker.mhd format=UCHAR inter=HAUT max=250 min=245

#################### Marker Background #####
echo "Background-1"
$volinvert filein=${f}.mhd fileout=${dirint}/${f}rg_original_invert.mhd format=UCHAR maximum=255
echo "Background-2"
$voladd filein1=${dirint}/${f}rg_bone_.mhd filein2=${dirint}/${f}rg_vaiss_marker.mhd fileout=${dirint}/${f}rg_bond_vessel_final.mhd
$volinvert filein=${dirint}/${f}rg_bond_vessel_final.mhd fileout=${dirint}/${f}rg_bond_vessel_final_invert.mhd format=UCHAR maximum=255
echo "Background-3"
$mask filein=${dirint}/${f}rg_original_invert.mhd filemask=${dirint}/${f}rg_bond_vessel_final_invert.mhd fileout=${dirint}/${f}rg_mask_background.mhd format=UCHAR outside=0
echo "Background-4"
$hysteresis filein=${dirint}/${f}rg_mask_background.mhd fileout=${dirint}/${f}rg_background_marker.mhd format=UCHAR inter=HAUT max=200 min=145

####################${dirint}/${f}rg_background_marker.mhd
echo "100-bakcground 2 fill"
$volinvert filein=${dirint}/${f}rg_background_marker.mhd fileout=${dirint}/${f}rg_background_marker_invert.mhd format=UCHAR maximum=255

$Fillhole1 filein=${dirint}/${f}rg_background_marker_invert.mhd fileout=${dirint}/${f}rg_background_marker_inver_fill.mhd majoritythreshold=1 numberofiteration=1 radiu=1

$volinvert filein=${dirint}/${f}rg_background_marker_inver_fill.mhd fileout=${dirint}/${f}rg_background_markerx1.mhd format=UCHAR maximum=255
#######################
####################### skeleton
echo "skeleton"
echo "1"
# SkeletonModify
$Expand filein=${dirint}/${f}rg_background_markerx1.mhd fileout=${dirint}/${f}_BackgroundMarker_2.mhd format=UCHAR nbpixels=1 value=255
$Expand filein=${dirint}/${f}rg_bone_first.mhd fileout=${dirint}/${f}_BoneMarker_2.mhd format=UCHAR nbpixels=1 value=255
$Expand filein=${dirint}/${f}rg_vaiss_marker.mhd fileout=${dirint}/${f}_VesselMarker_2.mhd format=UCHAR nbpixels=1 value=255
echo "2"
$SkeletonModify ${dirint}/${f}_BackgroundMarker_2.mhd ${dirint}/${f}_BackgroundMarker_2_s.mhd
$SkeletonModify ${dirint}/${f}_BoneMarker_2.mhd ${dirint}/${f}_BoneMarker_2_s.mhd
$SkeletonModify ${dirint}/${f}_VesselMarker_2.mhd ${dirint}/${f}_VesselMarker_2_s.mhd
echo "3"
$Crop debX=1 debY=1 debZ=1 filein=${dirint}/${f}_BackgroundMarker_2_s.mhd fileout=${dirint}/${f}_BackgroundMarker_2_s1.mhd finX=1 finY=1 finZ=1 format=UCHAR
$Crop debX=1 debY=1 debZ=1 filein=${dirint}/${f}_BoneMarker_2_s.mhd fileout=${dirint}/${f}_BoneMarker_2_s1.mhd finX=1 finY=1 finZ=1 format=UCHAR
$Crop debX=1 debY=1 debZ=1 filein=${dirint}/${f}_VesselMarker_2_s.mhd fileout=${dirint}/${f}_VesselMarker_2_s1.mhd finX=1 finY=1 finZ=1 format=UCHAR
echo "4"
$volMultConst constant=255 filein1=${dirint}/${f}_BackgroundMarker_2_s1.mhd fileout=${dirint}/${f}_BackgroundMarker_final.mhd thread=0
$volMultConst constant=255 filein1=${dirint}/${f}_BoneMarker_2_s1.mhd fileout=${dirint}/${f}_BoneMarker_final.mhd thread=0
$volMultConst constant=255 filein1=${dirint}/${f}_VesselMarker_2_s1.mhd fileout=${dirint}/${f}_VesselMarker_final.mhd thread=0

## Input image : control surface


#################### Marker Label ###############################################################################################################################################################################################
 
echo "100"       
## Vessel marker connected component from vessel marker preparation (number of lables:2131) (16bit unsigned short)
$volcompconnnew elimbord=0 filein=${dirint}/${f}_VesselMarker_final.mhd filelong=${dirint}/${f}rg_vessel1 fileout=${dirint}/${f}rg_vaiss_ero_label.mhd fileshort=${dirint}/${f}rg_vessel2 labels=50000 maxVoxels=10000000000000 minVoxels=0

echo "110" 
## Bone marker connected component from bone marker preparation (number of lable:1) (16bit unsigned short)
$volcompconnnew elimbord=0 filein=${dirint}/${f}_BoneMarker_final.mhd filelong=${dirint}/${f}rg_bone1 fileout=${dirint}/${f}rg_Remove_particle_label.mhd fileshort=${dirint}/${f}rg_bone2 labels=50000 maxVoxels=10000000000000 minVoxels=0

echo "120"
## Background marker connected component from background marker preparation (number of lable:15368) (16bit unsigned short)
$volcompconnnew elimbord=0 filein=${dirint}/${f}_BackgroundMarker_final.mhd filelong=${dirint}/${f}rg_background1 fileout=${dirint}/${f}rg_invert_label.mhd fileshort=${dirint}/${f}rg_background2 labels=50000 maxVoxels=10000000000000 minVoxels=0

#################### Fix the specific gray level on the labels(vessel,bone,background) ##########################################################################################################################################

#################### Add constant value on the lables(vessel,bone;background keeps retaining)###
#Read number of connected components values from the files 
backgroundvalue=$(<${dirint}/${f}rg_background2) #get the value number from the file
declare -i backgroundvalue # treat it as number not string
bonevalue=$(<${dirint}/${f}rg_bone2)
declare -i bonevalue
vesselvalue=$(<${dirint}/${f}rg_vessel2)
declare -i vesselvalue

echo "background $backgroundvalue"
echo "vessel $vesselvalue"
echo "bone $bonevalue"

echo "130"
## Background keeps it´s original gray level range(1~15368) ( gray level 0: gap)

echo "140"
## Bone range: 15369 (1 lable)

$AddConstant Value=$backgroundvalue filein=${dirint}/${f}rg_Remove_particle_label.mhd fileout=${dirint}/${f}rg_lable_bone_value.mhd

echo "150"
## Vessel range: 15370~17500 (2131 lables)
(( a = $backgroundvalue + $bonevalue ))
#a=$backgroundvalue+$bonevalue
#declare -i a
echo "$a"
$AddConstant Value=$a filein=${dirint}/${f}rg_vaiss_ero_label.mhd fileout=${dirint}/${f}rg_lable_vessel_value.mhd

#################### Mask process the vessel with specific gray level, mask process the bone with specific gray level###

echo "160"
## Make the background of VESSEL keep 0 gray level.
$mask filein=${dirint}/${f}rg_lable_vessel_value.mhd filemask=${dirint}/${f}_VesselMarker_final.mhd fileout=${dirint}/${f}rg_vaiss_ero_mask.mhd format=USHORT outside=0


echo "170-0"
$volbin filein=${dirint}/${f}rg_Remove_particle_label.mhd fileout=${dirint}/${f}rg_bone_pick.mhd max=70000 min=1 thread=0

echo "170-1"
## Make the background of BONE keep 0 gray level.
$mask filein=${dirint}/${f}rg_lable_bone_value.mhd filemask=${dirint}/${f}rg_bone_pick.mhd fileout=${dirint}/${f}rg_Remove_particle_mask.mhd format=USHORT outside=0

#################### Add the BONE, VESSEL and BACKGROUND from mask result###

echo "180"
## Add the BONE, VESSEL and BACKGROUND from mask result
$add filein1=${dirint}/${f}rg_vaiss_ero_mask.mhd filein2=${dirint}/${f}rg_Remove_particle_mask.mhd fileout=${dirint}/${f}rg_add_bone_vessel_mask.mhd

echo "190"
$add filein1=${dirint}/${f}rg_add_bone_vessel_mask.mhd filein2=${dirint}/${f}rg_invert_label.mhd fileout=${dirint}/${f}rg_add_bone_vessel_background_mask.mhd

#################### Marker Controlled Watershed Segmentation ###################################################################################################################################################################

echo "200"
$watershed filein=/data/id19/bones01/bones3/lea/hao/20200613/ControlSurface_G1/EdgeDetections/${f}.mhd filemarker=${dirint}/${f}rg_add_bone_vessel_background_mask.mhd fileout=${dirint}/${f}rg_watershed_.mhd    

#################### BONE,VESSEL segmentation result extract ###################################################################################################################################################################

echo "210"
## IntensityWindowingImageFilter.h  extract bone and vessel depending on the gray level 
##WindowMaximum=15380 WindowMinimum=15378
(( BoneLow = $backgroundvalue + 11 ))
(( BoneHigh = $a + 10))
echo "$BoneLow"
echo "$BoneHigh"

(( VesselLow = $a + 11  ))
(( VesselHigh = 65535 ))
echo "$VesselLow"
echo "$VesselHigh"
#BONE EXTRACT RESULT      [BoneLow,BoneHigh]
$volbin filein=${dirint}/${f}rg_watershed_.mhd fileout=${dirint}/${f}rg_watershed_Extractbone.mhd max=$BoneHigh min=$BoneLow thread=0
#VESSEL EXTRACT RESULT    [VesselLow,VesselHigh]
$volbin filein=${dirint}/${f}rg_watershed_.mhd fileout=${dirint}/${f}rg_watershed_Extractvessel.mhd max=$VesselHigh min=$VesselLow thread=0

#echo "220"
#$volMultConst constant=0.5 filein1=${dirint}/${f}rg_watershed_Extractbone.mhd fileout=${dirint}/${f}rg_watershed_Extractbone_mult.mhd thread=0                 
#$voladd filein1=${dirint}/${f}rg_watershed_Extractbone_mult.mhd filein2=${dirint}/${f}rg_watershed_Extractvessel.mhd fileout=${dirslice}/${f}rg_Extract_final_.mhd

$Fillhole1 filein=${dirint}/${f}rg_watershed_Extractbone.mhd fileout=${dirint}/${f}rg_watershed_Extractbone_0.mhd majoritythreshold=1 numberofiteration=1 radiu=1

$volinvert filein=${dirint}/${f}rg_watershed_Extractvessel.mhd fileout=${dirint}/${f}rg_watershed_Extractvessel_1.mhd format=UCHAR maximum=255

$AND filein1=${dirint}/${f}rg_watershed_Extractvessel_1.mhd filein2=${dirint}/${f}rg_watershed_Extractbone_0.mhd fileout=${dirint}/${f}rg_watershed_Extractbone_1.mhd

$volbinopen filein=${dirint}/${f}rg_watershed_Extractbone_1.mhd fileout=${dirresbone}/${f}rg_watershed_Extractbone_2.mhd radius=1

echo "220"
$volMultConst constant=0.5 filein1=${dirresbone}/${f}rg_watershed_Extractbone_2.mhd fileout=${dirint}/${f}rg_watershed_Extractbone_mult.mhd thread=0                 
$voladd filein1=${dirint}/${f}rg_watershed_Extractbone_mult.mhd filein2=${dirint}/${f}rg_watershed_Extractvessel.mhd fileout=${dirslice}/${f}rg_Extract_final_.mhd

#######################################################
$volinvert filein=${dirresbone}/${f}rg_watershed_Extractbone_2.mhd fileout=${dirint}/${f}rg_watershed_Extractbone_2_invert.mhd format=UCHAR maximum=255

$volMultConst constant=0.004 filein1=${dirint}/${f}rg_watershed_Extractbone_2_invert.mhd fileout=${dirint}/${f}rg_watershed_Extractbone_2_invert_1.mhd thread=0

$volmult filein1=${dirint}/${f}rg_watershed_Extractbone_2_invert_1.mhd filein2=${f}.mhd fileout=${dirint}/${f}rg_vessel_original.mhd thread=0

#################### min=110 is a good choice ###### 
echo "hys, min=110"
$hysteresis filein=${dirint}/${f}rg_vessel_original.mhd fileout=${dirresvessel}/${f}rg_vessel_original_background_110.mhd format=UCHAR inter=HAUT max=250 min=110
$voladd filein1=${dirresvessel}/${f}rg_vessel_original_background_110.mhd filein2=${dirint}/${f}rg_watershed_Extractbone_mult.mhd fileout=${dirslice}/${f}rg_Extract_final_110.mhd

##### reslice ####
###segment result bone and vessel

##################### Measurement ####################

## BV (bone volume)
echo "230"
$volbv bins=1 filein=${dirresbone}/${f}rg_watershed_Extractbone_2.mhd fileout=${dirbv}/${f}rg_watershed_Extractbone_BV.xls format=UCHAR max=255 min=254

#################################################################################################################################################################################################################################

## TV (tissue volume, not include the vessels that is out of bone)
## Bone closing
echo "240 Bone closing"
echo "1-size7"
$voldilat filein=${dirresbone}/${f}rg_watershed_Extractbone_2.mhd fileout=${dirint}/${f}rg_Remove_particle_dil_size7.mhd size=7 topology=2 
echo "2-size7"
$volerode filein=${dirint}/${f}rg_Remove_particle_dil_size7.mhd fileout=${dirint}/${f}rg_Remove_particle_dil_ero_size7.mhd size=7 topology=2

echo "250" 
## Fillholes
$fillhole filein=${dirint}/${f}rg_Remove_particle_dil_ero_size7.mhd fileout=${dirint}/${f}rg_fillhole_TV.mhd

echo "260" 
## Delete small particles                                   ${dirrestv}/${f}rg_bone_vaiss_.mhd
#$volmedian2d filein=${dirint}/${f}rg_fillhole_TV.mhd fileout=${dirint}/${f}rg_fillhole_TV_4.mhd format=UCHAR radius=4 thread=0
$volmedian filein=${dirint}/${f}rg_fillhole_TV.mhd fileout=${dirrestv}/${f}rg_fillhole_TV_4.mhd format=UCHAR radius=4 thread=0
## Measure TV
$volbv bins=1 filein=${dirrestv}/${f}rg_fillhole_TV_4.mhd fileout=${dirtv}/${f}rg_fillhole_TV.xls format=UCHAR max=255 min=254

#################################################################################################################################################################################################################################

## VV (vessel volume, not include the outside)
echo "270"
#$volmult filein1=${dirresvessel}/${f}rg_vessel_original_background_110.mhd filein2=${dirrestv}/${f}rg_fillhole_TV_4.mhd fileout=${dirint}/${f}rg_watershed_Extractvessel_1_0.mhd thread=0

#$volMultConst constant=255 filein1=${dirint}/${f}rg_watershed_Extractvessel_1_0.mhd fileout=${dirint}/${f}rg_watershed_Extractvessel_1_255.mhd thread=0

$volbv bins=1 filein=${dirresvessel}/${f}rg_vessel_original_background_110.mhd fileout=${dirvv}/${f}rg_watershed_Extractvessel_1_VV.xls format=UCHAR max=255 min=254

#################################################################################################################################################################################################################################
## Thickness
## VTh (Vessel Thickness)
echo "280"
## mhd to acr
$mhdtoacr filein=${dirresvessel}/${f}rg_vessel_original_background_110.mhd fileout=${dirint}/${f}rg_watershed_Extractvessel_1_255.acr format=UCHAR
echo "290"
## thickness process
$epaisseurseq filein=${dirint}/${f}rg_watershed_Extractvessel_1_255.acr voxsize=3.5 voisinage=3 fileout=${dirvesselth}/${f}rg_thickness_VTh.xls fileout2=${dirstat}/${f}rg_thickness_hist_VTh.xls fileoutcarted=${dirint}/${f}rg_exp_cadi_VTh.acr fileoutaxemed=${dirint}/${f}rg_exp_am_VTh.acr fileoutepaiss=${dirint}/${f}rg_exp_ep_VTh.acr
echo "300"
## acr to mhd
$acrtomhd infile=${dirint}/${f}rg_exp_cadi_VTh.acr outfile=${dirint}/${f}rg_exp_cadi_VTh.mhd
$acrtomhd infile=${dirint}/${f}rg_exp_am_VTh.acr outfile=${dirint}/${f}rg_exp_am_VTh.mhd
$acrtomhd infile=${dirint}/${f}rg_exp_ep_VTh.acr outfile=${dirint}/${f}rg_exp_ep_VTh.mhd

#################################################################################################################################################################################################################################
## Thickness
## BTh (Bone Thickness)
echo "310"
## mhd to acr
$mhdtoacr filein=${dirresbone}/${f}rg_watershed_Extractbone_2.mhd fileout=${dirint}/${f}rg_watershed_Extractbone.acr format=UCHAR
echo "320"
## thickness process
$epaisseurseq filein=${dirint}/${f}rg_watershed_Extractbone.acr voxsize=3.5 voisinage=3 fileout=${dirboneth}/${f}rg_thickness_BTh.xls fileout2=${dirstat}/${f}rg_thickness_hist_BTh.xls fileoutcarted=${dirint}/${f}rg_exp_cadi_BTh.acr fileoutaxemed=${dirint}/${f}rg_exp_am_BTh.acr fileoutepaiss=${dirint}/${f}rg_exp_ep_BTh.acr
echo "330"
## acr to mhd   
$acrtomhd infile=${dirint}/${f}rg_exp_cadi_BTh.acr outfile=${dirint}/${f}rg_exp_cadi_BTh.mhd
$acrtomhd infile=${dirint}/${f}rg_exp_am_BTh.acr outfile=${dirint}/${f}rg_exp_am_BTh.mhd
$acrtomhd infile=${dirint}/${f}rg_exp_ep_BTh.acr outfile=${dirint}/${f}rg_exp_ep_BTh.mhd

