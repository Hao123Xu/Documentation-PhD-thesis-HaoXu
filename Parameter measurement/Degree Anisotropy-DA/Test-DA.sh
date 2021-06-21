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
SMI=/data/id19/bones01/bones/program/linux_debian/bin/SMILibido
SMI1=/data/id19/bones01/bones/program/linux_debian/bin/analyseOsherCC
SMI2=/data/id19/bones01/bones/program/linux_redhat/bin/analyseOsherCC
MIL=/data/id19/bones01/bones/program/linux_debian/bin/mil3d_plus
#################### PRE-PROCESS ################################################################################################################################################################################################
### SMI structure model index

# mhd to acr
$mhdtoacr filein=/data/id19/bones01/bones3/lea/hao/20200617/G1/3-Trabecular/Trabecular/Bone/volint/${f}.mhd fileout=${dirint}/${f}.acr format=UCHAR

$MIL filein=${dirint}/${f}.acr seuil=100 voxsize=3.5 fileout=${dirslice}/${f}_DA_1.xls
















