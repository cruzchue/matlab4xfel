function writeSignature( sigCell , outName )

% size of signature cell
[ numRows, foo ]=size(sigCell);

% output
fid = fopen(outName,'wt');

for i=1:numRows
        
    runName=sigCell{i,1};     
    indexFromSparce=int2str(sigCell{i,2});
    
    fprintf(fid,'%s   %s \n',  runName, indexFromSparce );
  
end


fclose(fid);

end

