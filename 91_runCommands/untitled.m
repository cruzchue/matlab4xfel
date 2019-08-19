% write signature

outC = cell( numIndFromSparce, 2);
%outC{:,2}=indexFromSparce;
for i=1:numIndFromSparce
outC{i,1}=runName;
outC{i,2}=indexFromSparce(i,1);

%%%%%




addpath('./');

sigFile='mydata.txt';
sigFile='./01_SIG/rawAll.sig';

outCC=readSignature( sigFile );

%%%%%%

%sigFile='mydata.txt';

sigFile='./01_SIG/rawAll.sig';

outName='test04.sig';


testCell=readSignature( sigFile );


writeSignature( testCell , outName );


%%%%%%%%%%


oneSigCell{1,1}='r0571';
oneSigCell{1,2}=uint64(3);
translateFile='MelV01.trans';

aa=oneSignature2matrix( oneSigCell , translateFile )




%%%%%%%%%%%%

%%%%%%%%%%


%sigFile='mydata.txt';
sigFile='./01_SIG/rawAll.sig';
%sigFile='mydata2.txt';


sigCell2=readSignature( sigFile );

translateFile='MelV01.trans';

tmpM=signature2matrix( sigCell2 , translateFile );

%%%%%% TEST WITH A SINGLE SIGCELL


%%%%%%%%


% matrix to signature

translateFile='MelV01.trans';

sigM=tmpM;


%%%%%%%%


tmpCell=matrix2signature( sigM , translateFile );



%%%%%%%%%%%



sigFile='./01_SIG/rawAll.sig';

sigCell=readSignature( sigFile );

translateFile='MelV01.trans';

sigM=signature2matrix( sigCell , translateFile );


% SIGM SIGCELL <--- finally !!!!


%%%%%% TEST WITH A SINGLE SIGCELL



