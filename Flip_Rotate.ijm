// select the directory with the source files
dir1 = getDirectory("Choose Source Directory ");

// select the directory where the modified files will be saved (if same as dir1 the siurce files will be overwriten)
dir2 = getDirectory("Choose Results File Directory ");

// creating User Interface
Dialog.create("Options");
Dialog.addMessage("Choose Options.");
Dialog.addChoice("Action", newArray("Rotate 90 Degrees Right", "Rotate 90 Degrees Left", "Rotate 180 Degrees", "Flip Vertically", "Flip Horizontally")) 
Dialog.addCheckbox("Include subdirectories", false) 
Dialog.show();

// get values from user interface
action = Dialog.getChoice();
subdir = Dialog.getCheckbox();

// Define listFiles function		
function listFiles(dir1) 
	{
     	list = getFileList(dir1);
     	for (i=0; i<list.length; i++) {
        	if (endsWith(list[i], "/") && subdir == 1) 
        		listFiles(dir1+list[i]);
        	else if (!endsWith(list[i], "/")){
        		setBatchMode(true);
        		showProgress(i+1, list.length);	
           		open(dir1 + list[i]);
           		fullname = File.name;
           		if (action == "Rotate 180 Degrees"){
           			run("Rotate 90 Degrees Left");
           			run("Rotate 90 Degrees Left");
           		} else {
           		run(action);	
           		}
           		saveAs("png", dir1+fullname);
				close();
        	}
     	}
  	}

// Run listFiles function
listFiles(dir1); 
//Print Done! to log 
print("Done!");