function [boundaryline]=ImageYBoundary(modX_min,modX_max,LineY_min,LineY_max) 

dataarray=dlmread('LAO10nm-BCFO45-STO-330C-25V-RGBchange.dat');
lenT=length(dataarray);
dataarray=reshape(dataarray,lenT,431,3);

boundaryline=zeros(modX_max-modX_min+1,2);
sline=smooth(dataarray(:,modX_min,1)+dataarray(:,modX_min,2)+dataarray(:,modX_min,3),0.02,'loess');
diffline=diff(sline); 
[minX,minP]=min(diffline);
minP=699;
sfactor=0.02;
for ii=modX_min:1:modX_max
 
   sline=smooth(dataarray(:,ii,1)+dataarray(:,ii,2)+dataarray(:,ii,3),sfactor,'loess');
   diffline=diff(sline);  % diff function size is 1 x 7199
   tempY=LineY_min;
%    if(ii>500)
%    for jj=LineY_min:1:LineY_max
%       if(sline(jj)<0.42)
%           tempY=jj;
%           break;
%       end
%    end
%    end
  minscanY=max(tempY,minP-5);  % survey range min
  maxfY=min(LineY_max-1,minP);  % survey range max
  %sfactor=0.009;
  if (ii>200)
      minscanY=max(tempY,minP-10);
      maxfY=min(LineY_max-5,minP);
         if (ii>350)
            minscanY=max(tempY,minP-20);
            maxfY=min(LineY_max-12,minP);
         end
   %   sfactor=0.009;
  end
%     minfY=LineY_min;    % survey range min
%     maxfY=LineY_max-1;  % survey range max
   minmin=min(minscanY,maxfY);
   maxmax=max(minscanY,maxfY);
   [minX,minP]=min(diffline(minmin:maxmax,1));
%   [minX,minP]=min(diffline);
%    minfY=LineY_min;
   minP=minP+minscanY-1;
   ii-modX_min+1;
   boundaryline(ii-modX_min+1,1)=ii;
   boundaryline(ii-modX_min+1,2)=minP;
   
end

%dlmwrite('400C-Boundaryline.dat',boundary);

end


