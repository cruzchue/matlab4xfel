
function [ sigCell ] = matrix2signature( sigM , translateFile )

% number of signature cells
[ numSigM, foo ]=size(sigM);


% loop over values
for i=1:numSigM

    % one signature matrix
    oneSigM=sigM(i,:);
    
    % convert to cell
    oneSigCell=oneMatrix2signature( oneSigM , translateFile );
    
    % add to out cell
    sigCell{i,1}=oneSigCell{1,1};
    sigCell{i,2}=oneSigCell{1,2};
    
end

end

