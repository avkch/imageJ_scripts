// Exports the biggest preview image from *.scn file (Leica slide scanner)

dir1 = getDirectory("Choose a source Directory ");
dir2 = getDirectory("Choose a result Directory ");
list = getFileList(dir1);


for (i=0; i<list.length; i++) {
	if(!endsWith(list[i], "/")) { // exclude directories from the list
		setBatchMode(true);
		path = dir1+list[i];
		run("Bio-Formats Importer", "check_for_upgrades open=["+path+"] autoscale color_mode=Default view=Hyperstack stack_order=XYCZT series_1");
		saveAs("PNG", dir2+list[i]);
		close();
	}
}