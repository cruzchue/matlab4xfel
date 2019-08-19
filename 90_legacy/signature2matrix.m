
function [ sigM ] = signature2matrix( sigCell , translateFile )

% number of signature cells
[ numSigCell, foo ]=size(sigCell);


% out matrix
sigM=uint64([]);


% loop over values
for i=1:numSigCell

    % one signature cell
    oneSigCell=sigCell(i,:);
    
    % convert to matrix
    oneSigM=oneSignature2matrix( oneSigCell , translateFile );
    
    % add to out matrix
    sigM=[ sigM ; oneSigM ];
        
end


end


