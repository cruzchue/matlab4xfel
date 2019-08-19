

% 

%sigFile='mydata.txt';
sigFile='test04.sig';


runName='r0572';

indexFromSparce=65302;

%%%%%%%


sigCell=readSignature( sigFile );




%%%%%

allIndFromSparce=cell2mat(sigCell(:,2));

catchIndexBinary=(allIndFromSparce==indexFromSparce);
catchIndexNumber=find(catchIndexBinary==1);


runNamesWithIndex=sigCell{catchIndexBinary,1}


[ numNames, foo ]=size( runNamesWithIndex );

indOut='';

for i=1:numNames

    currName=runNamesWithIndex{i,1}
    
    if currName == runName
        indOut=aaabbb(i);
    end
    
    
end
