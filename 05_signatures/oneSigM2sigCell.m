function [ oneSigCell ] = oneSigM2sigCell( oneSigM , translateFile )
% ONESIGM2SIGCELL  converts a signature matrix (oneSigM) 
%                  into a signature cell (oneSigCell)
%                  
% oneSigCell = oneSigM2sigCell( oneSigM , translateFile )
%
%
% INPUT
% ------
% oneSigM : two column matrix, first one is runNumber, second one is indexFromSparse
% translateFile : ASCII file with fileName and runNumber
%
% 
% OUTPUT 
% ------
% oneSigCell : two column cell, first one is fileName, second one is indexFromSparse
% 
% 
% Examples :
% ----------
%
% translateFile='/mnt/extDisk2/cruzchu/01_HDF5/01_extraRun/03_defective/99_common/MelV02.trans';
% oneSigM = [ 572, 40] 
%
% oneSigCell = oneSigM2sigCell( oneSigM , translateFile )
%


%%%%%%%%%%%%% MAIN %%%%%%%%%%%%%%%

% read tranlation file
translateCell=readTranslate( translateFile );


% get all runNumbers
allRunNumber=cell2mat(translateCell(:,2));


% split matrix input
oneRunNumber=oneSigM(1,1);
oneIndFromSparse=oneSigM(1,2);


% output
oneSigCell={};


% find run number
indRunNumber=find(allRunNumber==oneRunNumber);

if indRunNumber > 0
    
    oneSigCell{1,1}=translateCell{indRunNumber,1};
    oneSigCell{1,2}=oneIndFromSparse;
    
end

end
