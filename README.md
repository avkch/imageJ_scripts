# Collection of ImageJ scripts.

All scripts in this collection are made ad-hoc in order to perform specific tasks and speed up my image analysis. There is no guarantee that they will work in any other case, however you can modify them so they can fit your specific needs.

## Background removal
This script is removing background from microscopy images. It works by subtracting background image from all images in a selected folder. The user is asked to select source directory, destination directory and background image. The background image should be taken using the same settings as the rest of the images but without any object. It contain only information about any peripheral darkening (vignetting), spots on the objective and background that are going to be present on all the images. The script will save the cleaned images in a selected destination folder as png files with the same names as original files.

## Brain segmentation

## Brain hemisphere analysis

## Export preview image from *.scn file (Leica slide scanner)

## Export single images from *.scn file with multiple objects

## Batch flip/ rotate images
This script is flipping or rotating multiple images. The user can choose the source directory, the destination directory (if the destination directory is the same as source the files will be overwritten) and options for the action ("Rotate 90 Degrees Right", "Rotate 90 Degrees Left", "Rotate 180 Degrees", "Flip Vertically", "Flip Horizontally"). There is a checkbox to choose whether to include subfolders in the source folder or to modify only the images in the main directory.

## Split image to equal parts horizontally and vertically
This script is splitting a big image to various small images that are equal in size. The user can choose how many horizontal and how many vertical images to have. For example an image with dimensions 600 pixels height and 300 pixels width, if chosen horizontal =1, vertical=3 will be spitted to 3 images with dimensions 600 pixels height and 100 pixels width. The new images are saved as 8-bit png files with the name of the original file and the extension “_v_h” where h is the number of horizontal row and v is number of vertical column. There are 2 versions of this script in this repository “Image_split_single.ijm” for splitting single image and “Image_split_batch.ijm” for batch splitting of all images in chosen directory. 
