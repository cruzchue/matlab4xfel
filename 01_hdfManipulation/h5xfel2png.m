
function h5xfel2png(listH5,nameH5,centerX,centerY,shiftXY,tuneScale)
%H5XFEL2PNG   creates a sequence of PNG images
%             from H5 files obtained from XFEL experiments        
%
%   h5xfel2png(listH5,nameH5,centerX,centerY,shiftXY,tuneScale)
%
%   INPUT
%   ------
%   listH5: list of H5 files, each H5 is defined as string
%   nameH5: prefix to be added to the PNG images
%
%   the following options allow to zoom into the image and rescale colors:
%   
%   centerX: define X center 
%   centerY: define Y center
%   shiftXY: range in X and Y
%
%   tuneScale : rescale color
%
%   in order to avoid zoom and rescale colors, use tuneScale=-1, shiftXY=-1
%
%
%   OUTPUT 
%   -------
%   sequence of PNG images : nameH5.0000.png
%
%
%   Examples:
%   --------- 
%
%   listH5=["r0101_hits.h5","r0103_hits.h5"];
%   nameH5='TBEV';
%
%   h5xfel2png(listH5,nameH5,0,0,-1,-1);
%   > standart print out
%
%   h5xfel2png(listH5,nameH5,650,550,-1,2);
%   > standard size, rescale colors up to 2 
%
%   h5xfel2png(listH5,nameH5,650,550,120,-1);
%   > zooming into a 120*2 size, centerd at 650, 550
%   > no rescale colors
%
%   h5xfel2png(listH5,nameH5,650,550,120,2);
%   > zooming into a 120*2 size, centerd at 650, 550
%   > rescale colors up to 2


%%%%%%%%%%  MAIN %%%%%%%%%%%%

% zoom into the snapshot
if shiftXY > 0    
    % border of zooming box
    leftX=centerX-shiftXY;
    rightX=centerX+shiftXY;
    leftY=centerY-shiftXY;
    rightY=centerY+shiftXY;
end

% number of H5 files
[iH5,jH5]=size(listH5);


% frame counter for movies
countFrame=1;


% loop over H5 files
for countH5=1:jH5
    
    % select one frame
    oneH5file=listH5(countH5);
    
    % get the data
    oneH5matrix=h5read(oneH5file, '/hits/assembled');
    
    % data size (xPix, yPix) and number of snapshots (numFrames)
    [xPix, yPix, numFrames]=size(oneH5matrix);
 
    % loop over snapshots
    for countXYZ=1:numFrames
    
        % get one snapshots
        xyzData=oneH5matrix(:,:,countXYZ);
        
        if tuneScale > 0
            % axes
            if shiftXY > 0
                imagesc(xyzData,[0 tuneScale]), axis image, axis([leftX rightX leftY rightY]);
            else 
                imagesc(xyzData,[0 tuneScale]), axis image;
            end
        else
            % axes
            if shiftXY > 0
                imagesc(xyzData), axis image, axis([leftX rightX leftY rightY]);
            else 
                imagesc(xyzData), axis image;
            end
        end            
            
        % image title
        line1=nameH5; % main title
        line2=[,' file: ',char(oneH5file)]; % filename
        line2=strrep(line2,'_','\_'); % replace underscore
        line3=['file frame: ',num2str(countXYZ), '; total frames: ',num2str(countFrame)]; %frame number
        title({line1,line2,line3})
                        
        % export image
        frameWith0=sprintf('%04d',countFrame);
        figName=[line1, '.',frameWith0,'.png'];
        saveas(gcf,figName)
        
        countFrame=countFrame+1;  
        
    end
    
    clear oneH5file;
    clear oneH5matrix;
    clear xPix;
    clear yPix;
end

close

end

