//1 Tree_255_Knots_28
  
j=58;
k=10;
setBatchMode(true);
for (m=1; m<4; m++) {

  dir = "C:/Users/hxu/Desktop/20200218/Original_Bila_mhd_new/"  + j + "_Bila_" + k + "_Sigma_Tree_255_Knots_28/";
  list = getFileList(dir);

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


//Save mhd files 
  dir1 = "C:/Users/hxu/Desktop/20200218/Original_Bila_mhd_new/EdgeDetections/";
  file1  = dir1 + list[0] + ".mhd";
  run("MHD/MHA ...", "save=file1");

     j+=30;
     k+=10;
     close();
     
  }
setBatchMode(false);

//2 Tree_255_Knots_48
  
j=78;
k=10;
setBatchMode(true);
for (m=1; m<5; m++) {

  dir = "C:/Users/hxu/Desktop/20200218/Original_Bila_mhd_new/"  + j + "_Bila_" + k + "_Sigma_Tree_255_Knots_48/";
  list = getFileList(dir);

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


//Save mhd files 
  dir1 = "C:/Users/hxu/Desktop/20200218/Original_Bila_mhd_new/EdgeDetections/";
  file1  = dir1 + list[0] + ".mhd";
  run("MHD/MHA ...", "save=file1");

     j+=30;
     k+=10;
     close();
     
  }
setBatchMode(false);

//3 Tree_255_Knots_68
  
j=98;
k=10;
setBatchMode(true);
for (m=1; m<6; m++) {

  dir = "C:/Users/hxu/Desktop/20200218/Original_Bila_mhd_new/"  + j + "_Bila_" + k + "_Sigma_Tree_255_Knots_68/";
  list = getFileList(dir);

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


//Save mhd files 
  dir1 = "C:/Users/hxu/Desktop/20200218/Original_Bila_mhd_new/EdgeDetections/";
  file1  = dir1 + list[0] + ".mhd";
  run("MHD/MHA ...", "save=file1");

     j+=30;
     k+=10;
     close();
     
  }
setBatchMode(false);

//4 Tree_255_Knots_88
  
j=118;
k=10;
setBatchMode(true);
for (m=1; m<7; m++) {

  dir = "C:/Users/hxu/Desktop/20200218/Original_Bila_mhd_new/"  + j + "_Bila_" + k + "_Sigma_Tree_255_Knots_88/";
  list = getFileList(dir);

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


//Save mhd files 
  dir1 = "C:/Users/hxu/Desktop/20200218/Original_Bila_mhd_new/EdgeDetections/";
  file1  = dir1 + list[0] + ".mhd";
  run("MHD/MHA ...", "save=file1");

     j+=30;
     k+=10;
     close();
     
  }
setBatchMode(false);


 
 //5 Tree_255_Knots_108
  
j=138;
k=10;
setBatchMode(true);
for (m=1; m<8; m++) {

  dir = "C:/Users/hxu/Desktop/20200218/Original_Bila_mhd_new/"  + j + "_Bila_" + k + "_Sigma_Tree_255_Knots_108/";
  list = getFileList(dir);

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


//Save mhd files 
  dir1 = "C:/Users/hxu/Desktop/20200218/Original_Bila_mhd_new/EdgeDetections/";
  file1  = dir1 + list[0] + ".mhd";
  run("MHD/MHA ...", "save=file1");

     j+=30;
     k+=10;
     close();
     
  }
setBatchMode(false);


 
 //6 Tree_255_Knots_128
  
j=157;
k=10;
setBatchMode(true);
for (m=1; m<9; m++) {

  dir = "C:/Users/hxu/Desktop/20200218/Original_Bila_mhd_new/"  + j + "_Bila_" + k + "_Sigma_Tree_255_Knots_128/";
  list = getFileList(dir);

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


//Save mhd files 
  dir1 = "C:/Users/hxu/Desktop/20200218/Original_Bila_mhd_new/EdgeDetections/";
  file1  = dir1 + list[0] + ".mhd";
  run("MHD/MHA ...", "save=file1");

     j+=30;
     k+=10;
     close();
     
  }
setBatchMode(false);


 
 //7 Tree_255_Knots_148
  
j=137;
k=10;
setBatchMode(true);
for (m=1; m<8; m++) {

  dir = "C:/Users/hxu/Desktop/20200218/Original_Bila_mhd_new/"  + j + "_Bila_" + k + "_Sigma_Tree_255_Knots_148/";
  list = getFileList(dir);

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


//Save mhd files 
  dir1 = "C:/Users/hxu/Desktop/20200218/Original_Bila_mhd_new/EdgeDetections/";
  file1  = dir1 + list[0] + ".mhd";
  run("MHD/MHA ...", "save=file1");

     j+=30;
     k+=10;
     close();
     
  }
setBatchMode(false);


 
 //8 Tree_255_Knots_168
  
j=117;
k=10;
setBatchMode(true);
for (m=1; m<7; m++) {

  dir = "C:/Users/hxu/Desktop/20200218/Original_Bila_mhd_new/"  + j + "_Bila_" + k + "_Sigma_Tree_255_Knots_168/";
  list = getFileList(dir);

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


//Save mhd files 
  dir1 = "C:/Users/hxu/Desktop/20200218/Original_Bila_mhd_new/EdgeDetections/";
  file1  = dir1 + list[0] + ".mhd";
  run("MHD/MHA ...", "save=file1");

     j+=30;
     k+=10;
     close();
     
  }
setBatchMode(false);


 
 //9 Tree_255_Knots_188
  
j=97;
k=10;
setBatchMode(true);
for (m=1; m<6; m++) {

  dir = "C:/Users/hxu/Desktop/20200218/Original_Bila_mhd_new/"  + j + "_Bila_" + k + "_Sigma_Tree_255_Knots_188/";
  list = getFileList(dir);

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


//Save mhd files 
  dir1 = "C:/Users/hxu/Desktop/20200218/Original_Bila_mhd_new/EdgeDetections/";
  file1  = dir1 + list[0] + ".mhd";
  run("MHD/MHA ...", "save=file1");

     j+=30;
     k+=10;
     close();
     
  }
setBatchMode(false);


 
 //10 Tree_255_Knots_208
  
j=77;
k=10;
setBatchMode(true);
for (m=1; m<5; m++) {

  dir = "C:/Users/hxu/Desktop/20200218/Original_Bila_mhd_new/"  + j + "_Bila_" + k + "_Sigma_Tree_255_Knots_208/";
  list = getFileList(dir);

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


//Save mhd files 
  dir1 = "C:/Users/hxu/Desktop/20200218/Original_Bila_mhd_new/EdgeDetections/";
  file1  = dir1 + list[0] + ".mhd";
  run("MHD/MHA ...", "save=file1");

     j+=30;
     k+=10;
     close();
     
  }
setBatchMode(false);


 
 
 
 
 
 
 
 