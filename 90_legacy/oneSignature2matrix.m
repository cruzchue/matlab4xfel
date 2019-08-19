function [ oneM ] = oneSignature2matrix( oneSigCell , translateFile )

% read tranlation file
translateCell=readSignature( translateFile );


% split signature input
oneRunName=oneSigCell{1,1};
oneIndFromSparce=oneSigCell{1,2};


% output
oneM=uint64([]);


% size of translation data
[ numNames, foo ]=size( translateCell );


% loop to find runName
i=1;
cond=0;

while ( i <= numNames ) & ( cond == 0)
   
    currName=translateCell{i,1};
    
    if currName == oneRunName
        oneM(1,1)=translateCell{i,2};
        oneM(1,2)=oneIndFromSparce;
        cond=1;
    end
  
    i=i+1;
        
end

end

