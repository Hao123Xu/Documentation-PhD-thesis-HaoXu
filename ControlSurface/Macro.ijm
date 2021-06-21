// Read .txt images in folders automatically

i=10; 
for (j=28; j<210; j+=20)
{
	{
       dir = "/data/id19/bones01/bones3/lea/hao/20200224/BoneVesselNoise/BoneVesselNoise_0_mhd/volint/ContriolSurface/" + i + "_Sigma_Vessel_255_Bone_" + j + "/" ;
       list = getFileList(dir);
		
        for (m=0; m<list.length; m++) {
                 file = dir + list[m];
                 run("Text Image... ", "open=&file");
                }
          run("Images to Stack", "name=Stack1 title=[] use");
      
       run("Rotate 90 Degrees Right");
       run("Flip Horizontally", "stack");
       run("8-bit");

       //Save mhd files 
      dir1 = "/data/id19/bones01/bones3/lea/hao/20200224/BoneVesselNoise/BoneVesselNoise_0_mhd/volint/ContriolSurface/EdgeDetections/";
      file1  = dir1 + list[0] + ".mhd";
      run("MHD/MHA ...", "save=file1");

      close();
     

	 }
}
// Read .txt images in folders automatically

i=20; 
for (j=28; j<210; j+=20)
{
	{
       dir = "/data/id19/bones01/bones3/lea/hao/20200224/BoneVesselNoise/BoneVesselNoise_0_mhd/volint/ContriolSurface/" + i + "_Sigma_Vessel_255_Bone_" + j + "/" ;
       list = getFileList(dir);
		
        for (m=0; m<list.length; m++) {
                 file = dir + list[m];
                 run("Text Image... ", "open=&file");
                }
          run("Images to Stack", "name=Stack1 title=[] use");
      
       run("Rotate 90 Degrees Right");
       run("Flip Horizontally", "stack");
       run("8-bit");

       //Save mhd files 
      dir1 = "/data/id19/bones01/bones3/lea/hao/20200224/BoneVesselNoise/BoneVesselNoise_0_mhd/volint/ContriolSurface/EdgeDetections/";
      file1  = dir1 + list[0] + ".mhd";
      run("MHD/MHA ...", "save=file1");

      close();
     

	 }
}
// Read .txt images in folders automatically

i=30; 
for (j=28; j<210; j+=20)
{
	{
       dir = "/data/id19/bones01/bones3/lea/hao/20200224/BoneVesselNoise/BoneVesselNoise_0_mhd/volint/ContriolSurface/" + i + "_Sigma_Vessel_255_Bone_" + j + "/" ;
       list = getFileList(dir);
		
        for (m=0; m<list.length; m++) {
                 file = dir + list[m];
                 run("Text Image... ", "open=&file");
                }
          run("Images to Stack", "name=Stack1 title=[] use");
      
       run("Rotate 90 Degrees Right");
       run("Flip Horizontally", "stack");
       run("8-bit");

       //Save mhd files 
      dir1 = "/data/id19/bones01/bones3/lea/hao/20200224/BoneVesselNoise/BoneVesselNoise_0_mhd/volint/ContriolSurface/EdgeDetections/";
      file1  = dir1 + list[0] + ".mhd";
      run("MHD/MHA ...", "save=file1");

      close();
     

	 }
}
// Read .txt images in folders automatically

i=40; 
for (j=48; j<210; j+=20)
{
	{
       dir = "/data/id19/bones01/bones3/lea/hao/20200224/BoneVesselNoise/BoneVesselNoise_0_mhd/volint/ContriolSurface/" + i + "_Sigma_Vessel_255_Bone_" + j + "/" ;
       list = getFileList(dir);
		
        for (m=0; m<list.length; m++) {
                 file = dir + list[m];
                 run("Text Image... ", "open=&file");
                }
          run("Images to Stack", "name=Stack1 title=[] use");
      
       run("Rotate 90 Degrees Right");
       run("Flip Horizontally", "stack");
       run("8-bit");

       //Save mhd files 
      dir1 = "/data/id19/bones01/bones3/lea/hao/20200224/BoneVesselNoise/BoneVesselNoise_0_mhd/volint/ContriolSurface/EdgeDetections/";
      file1  = dir1 + list[0] + ".mhd";
      run("MHD/MHA ...", "save=file1");

      close();
     

	 }
}
// Read .txt images in folders automatically

i=50; 
for (j=68; j<190; j+=20)
{
	{
       dir = "/data/id19/bones01/bones3/lea/hao/20200224/BoneVesselNoise/BoneVesselNoise_0_mhd/volint/ContriolSurface/" + i + "_Sigma_Vessel_255_Bone_" + j + "/" ;
       list = getFileList(dir);
		
        for (m=0; m<list.length; m++) {
                 file = dir + list[m];
                 run("Text Image... ", "open=&file");
                }
          run("Images to Stack", "name=Stack1 title=[] use");
      
       run("Rotate 90 Degrees Right");
       run("Flip Horizontally", "stack");
       run("8-bit");

       //Save mhd files 
      dir1 = "/data/id19/bones01/bones3/lea/hao/20200224/BoneVesselNoise/BoneVesselNoise_0_mhd/volint/ContriolSurface/EdgeDetections/";
      file1  = dir1 + list[0] + ".mhd";
      run("MHD/MHA ...", "save=file1");

      close();
     

	 }
}
// Read .txt images in folders automatically

i=60; 
for (j=88; j<170; j+=20)
{
	{
       dir = "/data/id19/bones01/bones3/lea/hao/20200224/BoneVesselNoise/BoneVesselNoise_0_mhd/volint/ContriolSurface/" + i + "_Sigma_Vessel_255_Bone_" + j + "/" ;
       list = getFileList(dir);
		
        for (m=0; m<list.length; m++) {
                 file = dir + list[m];
                 run("Text Image... ", "open=&file");
                }
          run("Images to Stack", "name=Stack1 title=[] use");
      
       run("Rotate 90 Degrees Right");
       run("Flip Horizontally", "stack");
       run("8-bit");

       //Save mhd files 
      dir1 = "/data/id19/bones01/bones3/lea/hao/20200224/BoneVesselNoise/BoneVesselNoise_0_mhd/volint/ContriolSurface/EdgeDetections/";
      file1  = dir1 + list[0] + ".mhd";
      run("MHD/MHA ...", "save=file1");

      close();
     

	 }
}
// Read .txt images in folders automatically

i=70; 
for (j=108; j<150; j+=20)
{
	{
       dir = "/data/id19/bones01/bones3/lea/hao/20200224/BoneVesselNoise/BoneVesselNoise_0_mhd/volint/ContriolSurface/" + i + "_Sigma_Vessel_255_Bone_" + j + "/" ;
       list = getFileList(dir);
		
        for (m=0; m<list.length; m++) {
                 file = dir + list[m];
                 run("Text Image... ", "open=&file");
                }
          run("Images to Stack", "name=Stack1 title=[] use");
      
       run("Rotate 90 Degrees Right");
       run("Flip Horizontally", "stack");
       run("8-bit");

       //Save mhd files 
      dir1 = "/data/id19/bones01/bones3/lea/hao/20200224/BoneVesselNoise/BoneVesselNoise_0_mhd/volint/ContriolSurface/EdgeDetections/";
      file1  = dir1 + list[0] + ".mhd";
      run("MHD/MHA ...", "save=file1");

      close();
     

	 }
}
// Read .txt images in folders automatically

i=80; 
for (j=128; j<130; j+=20)
{
	{
       dir = "/data/id19/bones01/bones3/lea/hao/20200224/BoneVesselNoise/BoneVesselNoise_0_mhd/volint/ContriolSurface/" + i + "_Sigma_Vessel_255_Bone_" + j + "/" ;
       list = getFileList(dir);
		
        for (m=0; m<list.length; m++) {
                 file = dir + list[m];
                 run("Text Image... ", "open=&file");
                }
          run("Images to Stack", "name=Stack1 title=[] use");
      
       run("Rotate 90 Degrees Right");
       run("Flip Horizontally", "stack");
       run("8-bit");

       //Save mhd files 
      dir1 = "/data/id19/bones01/bones3/lea/hao/20200224/BoneVesselNoise/BoneVesselNoise_0_mhd/volint/ContriolSurface/EdgeDetections/";
      file1  = dir1 + list[0] + ".mhd";
      run("MHD/MHA ...", "save=file1");

      close();
     

	 }
}