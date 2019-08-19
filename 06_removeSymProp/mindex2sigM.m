function [ sigM ] = mindex2sigM( mindex , sigFile )

% load signature
sigAll=uint64(importdata(sigFile));

% find mindex
sigM=sigAll(mindex,:);

end




