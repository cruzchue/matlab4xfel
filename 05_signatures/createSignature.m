function createSignature( inFile , runName )

% load data
inData=load(inFile);
indexFromSparse=inData.indexFromSparce;

[ numIndFromSparse, foo ]=size(indexFromSparse);


% out name
outName=[ runName , '.sig'];

fid = fopen(outName,'wt');

for i=1:numIndFromSparse 
    fprintf(fid,'%s   %s \n',  runName, int2str(indexFromSparse(i,1)) );
end

fclose(fid);

end




