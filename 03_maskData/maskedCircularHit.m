function maskedCircularHit( inFile , radPixels, outFile )


% read data
% ----------

inMatrix = load(inFile);



% select circular region
% -----------------------

% cell borders
axesBorders = inMatrix.axesBorders;
numCols = axesBorders(2) -  axesBorders(1);
numRows = axesBorders(4) -  axesBorders(3);

% center and radius^2
centerI = int64(numCols/2);
centerJ = int64(numRows/2);
rad2=radPixels*radPixels;

% define circular region
circularRegion=false(numCols,numRows);

for iCount=1:numCols    
    distI2 = (centerI - iCount)^2;
    
    for jCount=1:numRows    
        distJ2 = (centerJ - jCount)^2;        
        distIJ2 = distI2 + distJ2;
        
        if distIJ2 < rad2
            circularRegion(iCount, jCount) = 1 ;
        end                        
    end    
end

circularBool=reshape(circularRegion,[numCols*numRows 1]);
circularBool=logical(circularBool);



% panel regions
% --------------

% load mask
mask = inMatrix.yMask;
maskBool=strcmp(mask, 'FALSE');



% select area of interest
% ------------------------

% intersect circular region and panels
intersectBool=maskBool+circularBool;
intersectBool=(intersectBool == 2);

% load pixels
yAll = inMatrix.y;



% export
% -------

y=yAll(intersectBool,:);
yMask=intersectBool;

% output data
save(outFile,'y','yMask','-v7.3');

end

