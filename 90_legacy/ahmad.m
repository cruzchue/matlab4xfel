
% remove_outliers_from_dataY_sym
% example: load(dataY_nS135375_nN100_sym.mat','yRow','yCol','yVal');
%
nS = 135375;
 
yCol=double(yCol);
yRow=double(yRow);
D = sparse(yRow,yCol,yVal);
D(:,ind_outlier)=[];
D(ind_outlier,:)=[];
 
[yRow,yCol,yVal] = find(D);
 
nS_new = nS - length(ind_outlier);
save(['./dataY/dataY_nS',int2str(nS_new),'_nN10_sym.mat'],'yRow','yCol','yVal','-v7.3');



