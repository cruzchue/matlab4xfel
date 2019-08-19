
% ===============================================
%  break data to run diffusion maps in cluster
% =================================================

%%%%%%%%%% INPUT - OUTPUT %%%%%%%%%%%%

% library
%addpath('/Users/cruzchu/01_Projects/01_XFEL/hits/02_Data/02_extraRun/03_circularMasked/02_cirMasked/');
addpath('/Users/cruzchu/01_Projects/01_XFEL/hits/02_Data/02_extraRun/04_blocks/');

% MAT files
listMATfiles = ["r0565.cirMasked.mat", "r0566.cirMasked.mat", "r0567.cirMasked.mat", ...
    "r0568.cirMasked.mat", "r0569.cirMasked.mat", "r0570.cirMasked.mat", "r0571.cirMasked.mat", ... 
    "r0572.cirMasked.mat", "r0573.cirMasked.mat", "r0574.cirMasked.mat", "r0575.cirMasked.mat", ...
    "r0576.cirMasked.mat", "r0577.cirMasked.mat", "r0578.cirMasked.mat", "r0579.cirMasked.mat", ...
    "r0580.cirMasked.mat", "r0581.cirMasked.mat", "r0582.cirMasked.mat", "r0583.cirMasked.mat", ...
    "r0584.cirMasked.mat", "r0585.cirMasked.mat", "r0586.cirMasked.mat", "r0587.cirMasked.mat", ...
    "r0588.cirMasked.mat", "r0589.cirMasked.mat", "r0590.cirMasked.mat", "r0591.cirMasked.mat", ...
    "r0592.cirMasked.mat", "r0593.cirMasked.mat", "r0594.cirMasked.mat"];


% number of snapshots per file
blockSize=10000;


% output name
outName='borrar';



%%%%%%%%%%%%%% MAIN %%%%%%%%%%%%%%


% initialize values to create a matrix with multiple splitting
outM=[];
jobNumber=1;
vuelto=0;



% split multiple files
[iMAT , jMAT ]=size(listMATfiles);

for i=1:jMAT 

[ outCurr , jobNumber , vuelto ]=splitOneFile(listMATfiles, i, jobNumber, blockSize, vuelto);

outM=[ outM ; outCurr ];

end



% string for formating numbers with leading zeroes
numExports=max(outM(:,2));
numDigits=numel(num2str(numExports));
leadZeros=strcat('%0',num2str(numDigits),'d');



% loop for exporting 
for iExport=1:numExports

    % select sections to join
    exportM=outM(outM(:,2)==iExport,:);

    % empty for now
    y=[];
    
    % take content from sections and join them
    for iCol=1:size(exportM,1)

        % info about each section
        fileIndex=exportM(iCol,1);
        startIndex=exportM(iCol,3);
        endIndex=exportM(iCol,4);
        fileName=listMATfiles(fileIndex);
        
        % load each section
        tmpY=load(fileName);
        y=[ y, tmpY.y(:,startIndex:endIndex) ];
        
        % clean
        clear tmpY;
        
    end
    
    %{
    %>>>>>>>>>>
    % THIS CALCULATION IS ONLY NEEDED FOR THE LAST MATRIX
    % add zeros if output matrix is smaller    
    [iY, jY]=size(y);
    
    if jY < blockSize
        numZeroRows=blockSize-jY;
        fillZeros=zeros(iY,numZeroRows);
        y=[ y, fillZeros ];
    end    
    %>>>>>>>>>>>
    %}
    
    % format name
    iExportZeros=sprintf( leadZeros, iExport);
    outNameNumber=strcat(outName, '.', iExportZeros,'.mat');
        
    % out
    save(outNameNumber,'y','-v7.3');
   
    % logfile
    [iY, jY]=size(y);
    message=strcat(outNameNumber,' size : [',int2str(iY), ',' , int2str(jY),']');
    disp(message);
    
end







