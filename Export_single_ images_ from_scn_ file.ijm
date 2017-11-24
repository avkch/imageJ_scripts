// resolution is to set export resolution with
// number between 5 and 10
// 5 is the highest resolution, 10 the lowest.
// WARNING!! the highest resolution produces very big images and requires a lot of RAM!
resolutin = 8;

// exports individual images
dir1 = getDirectory("Choose a source Directory ");
dir2 = getDirectory("Choose a result Directory ");
list = getFileList(dir1);


run("Bio-Formats Macro Extensions");
for (i=0; i<list.length; i++) {
	if(!endsWith(list[i], "/")) { // exclude directories from the list
		setBatchMode(true);
		id = dir1+list[i];
		Ext.setId(id); // file name with full path
		Ext.getSeriesCount(seriesCount); // number of individual images in the file
		print(id);
		print(seriesCount);
		File.makeDirectory(dir2+list[i]); //creates new directory for the extracted images for every file 
		savedir = dir2+list[i]+"/";
		for (s=resolution; s<seriesCount; s=s+6) {
			numb = d2s(s, 0);
			Ext.setSeries(s-1);
			Ext.getSizeX(sizeX);
			Ext.getSizeY(sizeY);
			print("Series #" + s + ": image resolution is " + sizeX + " x " + sizeY);
			run("Bio-Formats Importer", "check_for_upgrades open=["+id+"] autoscale color_mode=Default view=Hyperstack stack_order=XYCZT series_"+numb);
			saveAs("PNG", savedir+numb);
			close();
		}
	}
}
Ext.close();
print("Done!");
