function [ mindex ] = sigM2mindex( sigM , sigFile )

% load signature
sigAll=uint64(importdata(sigFile));

% find mindex
mindex=find( (sigAll(:,1)==sigM(1,1)) & (sigAll(:,2)==sigM(1,2)));

end
