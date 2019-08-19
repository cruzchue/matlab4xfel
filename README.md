# XFEL


**01_hdfManipulation**
-----------------------

* *h5xfel2matrix.m* : hdf file to 2D matrix. Useful for visualization.

* *h5xfel2png.m*  : creates a sequence of PNG images from H5 files

* *hdf2mat.m* : hdf file to matlab file.  All saved in disk (data in - data out).  Review the format b4 usage.             
            Exports 'y','yMask','axesBorders','indexFromSparce'.





**02_visualization**
-----------------------
* *panelsXFEL.m* : visualize panels before assembly





**03_maskData**
-----------------------
* *maskedHit.m* : mask data

* *runMaskedhit.m* : apply script maskedHit.m to many files

* *maskedCircularHit.m* : mask data and circular selection






**04_splitData**
-----------------------
* *splitOneFile.m* : find indexes to split data

* *exportBlocks.m* : uses splitOneFile.m, performs "splitManyFiles" and save them



**05_signatures**
-----------------------

* *createSignature.m* : takes a ZOOM mat file containing "indexFromSparce" list.  
                    Exports an ASCII file with file name and indexFromSparce.

* *createTranslate.m* : writes a two-column ASCII file, first column is file name, second is abbreviation as uint64

* *oneSigM2sigCell.m* : converts 2 column matrix (runNumber indexFromSparse) into 2 column cell ( fileName indexFromSparse ) 
                    NOTE: may not be needed it if everything moved to a single H5 file. 
                          Keep it for now.




**06_removeSymProp**
-----------------------
* *mindex2sigM* : convert mindex to 2-item matrix

* *sigM2mindex* : convert 2-item matrix to mindex

* *rmSym* : erase from symmetrization matrix

* *rmRowASCII* : erase items from a ASCII property file



