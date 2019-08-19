function rmRowASCII( rmSigMfile ,  sigFile, propertyFile, outName )
% RMROWASCII erase items from a property file
%
% INPUT 
% ------
% rmSigMfile   : signature matrix of items to erase (ASCII)
% sigFile      : signature file (ASCII) 
%                used to convert signature matrix to mindex
% propertyFile : property file, 
%                each row corresponds to one signature (ASCII)
%
%
% OUTPUT
% -------
% outName    : two files are exported
%              * outName.sig: signature file without removed items(ASCCI)
%              * outName_sym.mat: symmetry file without removed items (MAT)
%
%
% Examples :
% -----------
%
% rmSigMfile='rmtest.txt';
% sigFile='/Users/cruzchu/01_Projects/01_XFEL/10_removeSnapshots/99_common/rawAll.sig';
% propertyFile='/Users/cruzchu/01_Projects/01_XFEL/07_sumIntensities/sumValuesSQRT.txt';
% outName='test07';
%
% rmRowASCII( rmSigMfile ,  sigFile, propertyFile, outName )
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


% 2.-  load property data
propertyM=double(importdata(propertyFile));


% 3.- erase indexes from property data
propertyM(rmMindex.',:)=[];


% 4.- output
dlmwrite( [ outName, '.prop.txt' ], propertyM, 'precision', '%10.5f', 'delimiter', ' ');

end






