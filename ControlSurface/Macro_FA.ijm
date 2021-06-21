//1 Convolution 3D with imagej.
// filter 1  
  dir = "C:/Users/hxu/Desktop/20200207/000_Final_Markers_InputImages/000_final-InputImages/27_Sigma_Tree_255_Knots_28/";
  list = getFileList(dir);
//  run("Close All");
  setBatchMode(true);
  for (i=0; i<list.length; i++) {
     file = dir + list[i];
     run("Text Image... ", "open=&file");
  }
  run("Images to Stack", "name=Stack1 title=[] use");

  setBatchMode(false);

run("Rotate 90 Degrees Right");
run("Flip Horizontally", "stack");
run("8-bit");
run("MHD/MHA ...", "save=C:\\Users\\hxu\\Desktop\\20200207\\000_Final_Markers_InputImages\\000_final-InputImages\\EdgeDetections\\FA_27_Sigma_Tree_255_Knots_28_cw468.mhd");

//1 Convolution 3D with imagej.
// filter 1
  
  dir = "C:/Users/hxu/Desktop/20200207/000_Final_Markers_InputImages/000_final-InputImages/27_Sigma_Tree_255_Knots_88/";
  list = getFileList(dir);
//  run("Close All");
  setBatchMode(true);
  for (i=0; i<list.length; i++) {
     file = dir + list[i];
     run("Text Image... ", "open=&file");
  }
  run("Images to Stack", "name=Stack1 title=[] use");

  setBatchMode(false);

run("Rotate 90 Degrees Right");
run("Flip Horizontally", "stack");
run("8-bit");
run("MHD/MHA ...", "save=C:\\Users\\hxu\\Desktop\\20200207\\000_Final_Markers_InputImages\\000_final-InputImages\\EdgeDetections\\FA_27_Sigma_Tree_255_Knots_88_cw468.mhd");

//1 Convolution 3D with imagej.
// filter 1
  
  dir = "C:/Users/hxu/Desktop/20200207/000_Final_Markers_InputImages/000_final-InputImages/27_Sigma_Tree_255_Knots_128/";
  list = getFileList(dir);
//  run("Close All");
  setBatchMode(true);
  for (i=0; i<list.length; i++) {
     file = dir + list[i];
     run("Text Image... ", "open=&file");
  }
  run("Images to Stack", "name=Stack1 title=[] use");

  setBatchMode(false);

run("Rotate 90 Degrees Right");
run("Flip Horizontally", "stack");
run("8-bit");
run("MHD/MHA ...", "save=C:\\Users\\hxu\\Desktop\\20200207\\000_Final_Markers_InputImages\\000_final-InputImages\\EdgeDetections\\FA_27_Sigma_Tree_255_Knots_128_cw468.mhd");

//1 Convolution 3D with imagej.
// filter 1
  
  dir = "C:/Users/hxu/Desktop/20200207/000_Final_Markers_InputImages/000_final-InputImages/27_Sigma_Tree_255_Knots_168/";
  list = getFileList(dir);
//  run("Close All");
  setBatchMode(true);
  for (i=0; i<list.length; i++) {
     file = dir + list[i];
     run("Text Image... ", "open=&file");
  }
  run("Images to Stack", "name=Stack1 title=[] use");

  setBatchMode(false);

run("Rotate 90 Degrees Right");
run("Flip Horizontally", "stack");
run("8-bit");
run("MHD/MHA ...", "save=C:\\Users\\hxu\\Desktop\\20200207\\000_Final_Markers_InputImages\\000_final-InputImages\\EdgeDetections\\FA_27_Sigma_Tree_255_Knots_168_cw468.mhd");

//1 Convolution 3D with imagej.
// filter 1
  
  dir = "C:/Users/hxu/Desktop/20200207/000_Final_Markers_InputImages/000_final-InputImages/27_Sigma_Tree_255_Knots_208/";
  list = getFileList(dir);
//  run("Close All");
  setBatchMode(true);
  for (i=0; i<list.length; i++) {
     file = dir + list[i];
     run("Text Image... ", "open=&file");
  }
  run("Images to Stack", "name=Stack1 title=[] use");

  setBatchMode(false);

run("Rotate 90 Degrees Right");
run("Flip Horizontally", "stack");
run("8-bit");
run("MHD/MHA ...", "save=C:\\Users\\hxu\\Desktop\\20200207\\000_Final_Markers_InputImages\\000_final-InputImages\\EdgeDetections\\FA_27_Sigma_Tree_255_Knots_208_cw468.mhd");