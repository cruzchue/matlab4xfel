
function hdf2mat( inHDF,outMAT )

% get data from HDF file
y=h5read(inHDF, '/y');
yMask=h5read(inHDF, '/yMask');
axesBorders=h5read(inHDF, '/axesBorders');
indexFromSparce=h5read(inHDF, '/indexFromSparce');

% export data
save(outMAT,'y','yMask','axesBorders','indexFromSparce','-v7.3')

clear y;
clear yMask;
clear axesBorders;
clear indexFromSparce;


