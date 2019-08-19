function [ outM , jobNumber, vuelto ]=splitOneFile( listMATfiles, fileNumber, jobNumber, blockSize, vuelto)

%>>>>>>
% NOTE : if vuelto > blockSize, return error message
%>>>>>>


% load info about HDF file 
currFile=listMATfiles(fileNumber);
S = whos('-file', currFile);        
sizeY=S(1).size;
numSnapshots=sizeY(2);
  

% add previous items (vuelto)
numSnapshotsPvuelto=numSnapshots+vuelto;
   

% split lines into blocks and modulus
numBlocks=floor(numSnapshotsPvuelto/blockSize);


if numBlocks== 0
    modulusBlock=mod(numSnapshots,blockSize);% take all
else
    modulusBlock=mod(numSnapshotsPvuelto,blockSize);
end


% loop to export blocks
outM=[];

indexLeft=1;
indexRight=indexLeft+blockSize-1-vuelto;

lineCount=1;

while lineCount <= numBlocks
      
    outM(lineCount,1)=fileNumber;
    outM(lineCount,2)=jobNumber;
    outM(lineCount,3)=indexLeft;    
    outM(lineCount,4)=indexRight;
    
    jobNumber=jobNumber+1;
    indexLeft=indexRight+1;       
    indexRight=indexLeft+blockSize-1;
     
    lineCount=lineCount+1;

end


% export modulus
if modulusBlock > 0
    
    indexRight=indexLeft+modulusBlock-1;
      
    outM(lineCount,1)=fileNumber;
    outM(lineCount,2)=jobNumber;
    outM(lineCount,3)=indexLeft;    
    outM(lineCount,4)=indexRight;   
    
end


% vuelto
if numBlocks == 0
    vuelto=modulusBlock+vuelto;
else
    vuelto=modulusBlock;
end



end