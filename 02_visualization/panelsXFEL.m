
%dataH5=h5read("/Users/cruzchu/01_Projects/01_XFEL/hits/02_Data/r0566_powder_raw.h5",'/sum');


dataH5=h5read("/Users/cruzchu/01_Projects/01_XFEL/02_Data/01_testData/r0566_powder_raw.h5",'/sum');

nameH5='r0566_powder_raw';
tuneScale=-1;


% number of H5 files
[iH5,jH5, numDetectors, numSnapshots ]=size(dataH5);


countFrame=1;

% loop over H5 files
for countDetector=1:numDetectors

    oneDetector=dataH5(:,:,countDetector,:);
    oneDetector=reshape(oneDetector,[128,512,170]);
    
    for countSnapshot=1:numSnapshots
    
        % get one snapshots
        xyzData=oneDetector(:,:,countSnapshot);
        
        figure;
        
        if tuneScale > 0    
            imagesc(xyzData,[0 tuneScale]), axis image;
        else
            imagesc(xyzData), axis image;
        end
        
        
        % image title
        line1=nameH5; % main title
        line1=strrep(line1,'_','\_'); % replace underscore
        line2=['detector panel: ',num2str(countDetector), ' out of ', num2str(numDetectors)]; %frame number
        line3=['snapshot: ',num2str(countSnapshot), ' out of ', num2str(numSnapshots)];
        line4=['total frames: ',num2str(countFrame)]; %frame number
        title({line1,line2,line3,line4})
         
        % export image
        frameWith0=sprintf('%04d',countFrame);
        figName=[nameH5,frameWith0,'.png'];
        saveas(gcf,figName)

        close
        
        countFrame=countFrame+1;
   
    end
    
    

end


