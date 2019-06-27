function maskedHit( inFile , outFile )

% read data
inMatrix = load(inFile);

% load pixels
y = inMatrix.y;

% load mask
mask = inMatrix.yMask;
maskBool=strcmp(mask, 'FALSE');

% select area of interest
yGoodPixels=y(maskBool,:);

% clear variables
clear y;
clear mask;
clear maskBool;

y = yGoodPixels;

clear yGoodPixels;


% outpu data
save(outFile,'y','-v7.3');



