// select the directory with the source files
dir1 = getDirectory("Choose a source Directory ");
	
// select the directory where the modified files will be saved
dir2 = getDirectory("Choose a result Directory ");

// select the background image
bgr= File.openDialog("Open your background image");

// list the files in the source directory
list = getFileList(dir1);

// open the background image and prepare it for substraction

bgr_name = File.name;

run("Invert");


// loop trouch the files and substract the background from them
for (i=0; i<list.length; i++){
	if(!matches(list[i], bgr_name) ) {
		if(!endsWith(list[i], "/")) { // exclude directories from the list
			path = dir1+list[i];
			setBatchMode(true);
			showProgress(i, list.length);
			open(path);
			name = File.nameWithoutExtension;
			run("RGB Color");
			imageCalculator("Add create stack", list[i], bgr_name);
			selectWindow(list[i]);
			close();
			selectWindow("Result of "+list[i]);
			saveAs("png", dir2+name);
			close();
		}
	}
}


selectWindow(bgr_name);
close();