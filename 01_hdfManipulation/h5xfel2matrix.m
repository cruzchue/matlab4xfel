 
function [ outM , xPix , yPix ] = h5xfel2matrix(listH5)
%H5XFEL2MATRIX   reads a list of H5 files and return a 2D matrix
%                it also returns the number of columns and rows in the matrix  
%
%   [ outM , xPix , yPix ]=h5xfel2matrix(listH5)
%
%   INPUT
%   ------
%   listH5: list of H5 files, each H5 is defined as string
%
%
%   OUTPUT 
%   -------
%   outM: 2D matrix with XFEL data
%   xPix: number of rows
%   yPix: number of columns
%
%
%   Examples:
%   --------- 
%
%   listH5=["r0101_hits.h5","r0103_hits.h5"];
%
%   [ outM , xPix , yPix ] = h5xfel2matrix(listH5)
%

%%%%%%%%%%%% MAIN %%%%%%%%%%%%%

% number of H5 files
[iH5,jH5]=size(listH5);


% loop over H5 files
for countH5=1:jH5
    
    % select one file
    oneH5file=listH5(countH5);
    
    % get diffraction data for one file
    oneH5matrix=h5read(oneH5file, '/hits/assembled');
    
    % data size (xPix, yPix) and number of snapshots (numFrames) 
    [xPix, yPix, numFrames]=size(oneH5matrix);
         
    % loop over snapshots
    for countXYZ=1:numFrames
    
        % get one snapshot
        xyzData=oneH5matrix(:,:,countXYZ);
        
        % first snapshot determines number of columns 
        if (countH5 == 1) & (countXYZ == 1)
            % number of columns
            numPixels=xPix*yPix;           
            % reshape
            outM=reshape(xyzData,1,numPixels);
        else           
            % add rows
            outM=[outM;reshape(xyzData,1,numPixels)];
        end        
        %>> debug
        %disp(oneH5file); 
        %disp(countXYZ);                        
    end

    clear oneH5file;
    clear oneH5matrix;
    clear numFrames;
    clear xyzData;
end

close


