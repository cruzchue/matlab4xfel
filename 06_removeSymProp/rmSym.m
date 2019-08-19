function rmSym( rmSigMfile , sigFile , symFile , outName )
% RMSYM erase items from a symmetry file
%
% INPUT 
% ------
% rmSigMfile : signature matrix of items to erase (ASCII)
% sigFile    : signature file (ASCII) 
%              used to convert signature matrix to mindex
% symFile    : symmetry file for distance (MAT)
%
%
% OUTPUT
% -------
% outName    : two files are exported
%              * outName.sig: signature file without removed items(ASCCI)
%              * outName_sym.mat: symmetry file without removed items (MAT)
%
% DEPENDENCIES
% -------------
% sigM2mindex : convert signature matrix to mindex
%
%
% Examples :
% -----------
%
% rmSigMfile='rmtest.txt';
% sigFile='/Users/cruzchu/01_Projects/01_XFEL/10_removeSnapshots/99_common/rawAll.sig';
% symFile='/Users/cruzchu/01_Projects/01_XFEL/10_removeSnapshots/01_past/06_14samples/dataY/dataY_nS331436_nN1000_sym.mat';
% outName='test05';
%
% rmSym( rmSigMfile , sigFile , symFile,  outName )
%


%%%%%%%%%%%%%%%%% MAIN %%%%%%%%%%%%%%%%%%

% 1.- Mindexes to erase

% load sigM to erase
rmSigM=uint64(importdata(rmSigMfile)); 

% from sigM to mindex
[ numRmItems, foo ]=size(rmSigM);
rmMindex=uint64(zeros(numRmItems,1));

for i=1:numRmItems
    rmMindex(i,1)=sigM2mindex( rmSigM(i,:) , sigFile );
end

rmMindex=sort(rmMindex);


% 2.- erase indexes from signature data
sigAll=uint64(importdata(sigFile));
sigAll(rmMindex.',:)=[];
signature=sigAll;


% 3.- save signature file with indexes removed
dlmwrite([outName, '.sig' ],signature, 'precision', '%u', 'delimiter', ' ');


% 4.- load symetrization file
inM3=load(symFile);

yColSym=double(inM3.yCol);
yRowSym=double(inM3.yRow);
yValSym=double(inM3.yVal);

D = sparse( yRowSym ,yColSym , yValSym);


% 5.- erase indexes from sparse matrix
% FROM AHMAD'S SCRIPT
D( : , rmMindex.' )=[];
D( rmMindex.' , : )=[];


% 6.- save new symmetrization data
[ yRow , yCol , yVal ] = find(D);

yRow=int32(yRow);
yCol=int32(yCol);
yVal=double(yVal);

save([outName, '_sym.mat' ],'yRow','yCol','yVal','-v7.3');

end

