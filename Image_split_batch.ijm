// select the directory with the source files
dir1 = getDirectory("Choose Source Directory ");

// select the directory where the modified files will be saved
dir2 = getDirectory("Choose Results File Directory ");

/* alternative to dir2
File.makeDirectory(dir1+"single");
dir2 = dir1+"single/";
*/

// list the files in the source directory
list = getFileList(dir1);

// loop trough the files and split them
for (i=0; i<list.length; i++){
	showProgress(i+1, list.length);
	if (!endsWith(list[i], "/")) { // exclude directories 
		open(dir1+list[i]);
		// get image information
		name = File.nameWithoutExtension;
		fullname = File.name;
		dir = File.directory;
		name = File.nameWithoutExtension;
		getDimensions(width, height, channels, slices, frames);
		// creating User Interface
		Dialog.create("Options");
		Dialog.addMessage("Choose number of horizontal and vertical images to be produced.");
		Dialog.addNumber("No of horizontal images", 1);
		Dialog.addNumber("No of vertical images", 1);
		Dialog.show();
		
		// get values from user interface
		horizontal = Dialog.getNumber();
		vertical = Dialog.getNumber();

		// calculatig the size of the new images
		new_width = width/horizontal;
		new_height = height/vertical;
		
		// create and save new images
		for(h=0; h<horizontal; h++){
			for(v=0; v<vertical; v++){
				makeRectangle(new_width*h, new_height*v, new_width, new_height);
				run("Copy");
				newImage(name+"_"+v+"_"+h, "8-bit black", new_width, new_height, 1); // change 8-bit with RGB or 16-bit etc.
				run("Paste");
				saveAs("png", dir2+name+"_"+v+"_"+h); // change "png" to other file format
				close();
			}
		}	
		close();
	}
}
