function [ sigCell ] = readTranslate( translateFile )

% read signature
inSignature = importdata(translateFile);


% order data
runName=inSignature.textdata;
indexFromSparce=uint64(inSignature.data);


% add to cell
[ numRows, foo ]=size(indexFromSparce);

sigCell={};

for i=1:numRows
    
    sigCell{i,1}=char(runName(i,:));   
    sigCell{i,2}=indexFromSparce(i);
    
end

end
