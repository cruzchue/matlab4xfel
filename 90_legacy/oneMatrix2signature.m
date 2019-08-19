function [ oneSigCell ] = oneMatrix2signature( oneSigM , translateFile )

% read tranlation file
translateCell=readTranslate( translateFile );


% get all runNumbers
allRunNumber=cell2mat(translateCell(:,2));


% split matrix input
oneRunNumber=oneSigM(1,1);
oneIndFromSparce=oneSigM(1,2);


% output
oneSigCell={};


% find run number
indRunNumber=find(allRunNumber==oneRunNumber);

if indRunNumber > 0
    
    oneSigCell{1,1}=translateCell{indRunNumber,1};
    oneSigCell{1,2}=oneIndFromSparce;
    
end

end
