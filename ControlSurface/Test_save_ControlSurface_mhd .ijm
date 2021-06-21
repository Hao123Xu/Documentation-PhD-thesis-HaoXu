  
       // 1 Read .txt images in folders automatically
	
       dir = "/data/id19/bones01/bones3/lea/hao/20200613/ControlSurface/2A_C1DG_ROI_RO_BB/" ;
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
      dir1 = "/data/id19/bones01/bones3/lea/hao/20200613/ControlSurface/EdgeDetections/";
      file1  = dir1 + list[0] + ".mhd";
      run("MHD/MHA ...", "save=file1");

      close();

      // 2 Read .txt images in folders automatically
	
       dir = "/data/id19/bones01/bones3/lea/hao/20200613/ControlSurface/2A_C1D_ROI_RO_BB/" ;
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
      dir1 = "/data/id19/bones01/bones3/lea/hao/20200613/ControlSurface/EdgeDetections/";
      file1  = dir1 + list[0] + ".mhd";
      run("MHD/MHA ...", "save=file1");

      close();


      // 3 Read .txt images in folders automatically
	
       dir = "/data/id19/bones01/bones3/lea/hao/20200613/ControlSurface/2A_C1G_ROI_RO_BB/" ;
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
      dir1 = "/data/id19/bones01/bones3/lea/hao/20200613/ControlSurface/EdgeDetections/";
      file1  = dir1 + list[0] + ".mhd";
      run("MHD/MHA ...", "save=file1");

      close();

       // 4 Read .txt images in folders automatically
	
       dir = "/data/id19/bones01/bones3/lea/hao/20200613/ControlSurface/2A_C10_ROI_RO_BB/" ;
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
      dir1 = "/data/id19/bones01/bones3/lea/hao/20200613/ControlSurface/EdgeDetections/";
      file1  = dir1 + list[0] + ".mhd";
      run("MHD/MHA ...", "save=file1");

      close();


       // 5 Read .txt images in folders automatically
	
       dir = "/data/id19/bones01/bones3/lea/hao/20200613/ControlSurface/2A_C12D_ROI_RO_BB/" ;
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
      dir1 = "/data/id19/bones01/bones3/lea/hao/20200613/ControlSurface/EdgeDetections/";
      file1  = dir1 + list[0] + ".mhd";
      run("MHD/MHA ...", "save=file1");

      close();

       // 6 Read .txt images in folders automatically
	
       dir = "/data/id19/bones01/bones3/lea/hao/20200613/ControlSurface/2A_C12G_ROI_RO_BB/" ;
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
      dir1 = "/data/id19/bones01/bones3/lea/hao/20200613/ControlSurface/EdgeDetections/";
      file1  = dir1 + list[0] + ".mhd";
      run("MHD/MHA ...", "save=file1");

      close();

      // 7 Read .txt images in folders automatically
	
       dir = "/data/id19/bones01/bones3/lea/hao/20200613/ControlSurface/2B_C1DG_ROI_RO_BB/" ;
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
      dir1 = "/data/id19/bones01/bones3/lea/hao/20200613/ControlSurface/EdgeDetections/";
      file1  = dir1 + list[0] + ".mhd";
      run("MHD/MHA ...", "save=file1");

      close();

      // 8 Read .txt images in folders automatically
	
       dir = "/data/id19/bones01/bones3/lea/hao/20200613/ControlSurface/2B_C1G_ROI_RO_BB/" ;
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
      dir1 = "/data/id19/bones01/bones3/lea/hao/20200613/ControlSurface/EdgeDetections/";
      file1  = dir1 + list[0] + ".mhd";
      run("MHD/MHA ...", "save=file1");

      close();

      // 9 Read .txt images in folders automatically
	
       dir = "/data/id19/bones01/bones3/lea/hao/20200613/ControlSurface/2B_C12D_ROI_RO_BB/" ;
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
      dir1 = "/data/id19/bones01/bones3/lea/hao/20200613/ControlSurface/EdgeDetections/";
      file1  = dir1 + list[0] + ".mhd";
      run("MHD/MHA ...", "save=file1");

      close();