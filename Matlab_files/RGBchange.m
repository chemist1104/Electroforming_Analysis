function RGBchange(inputname, resultname)
modifypic=dlmread(inputname);
[c, a] = size(modifypic);

% reference=dlmread('A3004-2_LAO10nm_25V-280C-P4_ColormodHighRGBmatrix.dat');
% reference=reshape(reference,7200,631,3);
% referenceline=zeros(7200,3);
% for ii=200:1:400
%    referenceline(:,1)=reference(:,ii,1)+referenceline(:,1);    % R
%    referenceline(:,2)=reference(:,ii,2)+referenceline(:,2);    % G
%    referenceline(:,3)=reference(:,ii,3)+referenceline(:,3);    % B
% end
%  referenceline=referenceline./201;
 
%  referencemaxmin(1,1)=max(referenceline(:,1));
%  referencemaxmin(2,1)=min(referenceline(:,1));
%  referencemaxmin(1,2)=max(referenceline(:,2));
%  referencemaxmin(2,2)=min(referenceline(:,2));
%  referencemaxmin(1,3)=max(referenceline(:,3));
%  referencemaxmin(2,3)=min(referenceline(:,3));
 
referencemaxmin(1,1)=0.7;
referencemaxmin(2,1)=0.1;
referencemaxmin(1,2)=0.65;
referencemaxmin(2,2)=0.1;
referencemaxmin(1,3)=0.25;
referencemaxmin(2,3)=0.1;
 
modifypic=reshape(modifypic,c,1800,3);
modifypicline=zeros(c,3);
%modifypic(:,:,3)=(0.25-modifypic(:,:,3))+0.25;
%  
%   for ii=1:1:631
%      modifypic(:,ii,1)=smooth(modifypic(:,ii,1),0.001);  
%      modifypic(:,ii,2)=smooth(modifypic(:,ii,2),0.001);  
%      modifypic(:,ii,3)=smooth(modifypic(:,ii,3),0.001);  
%  end
 
for ii=800:1:1000
   modifypicline(:,1)=modifypic(:,ii,1)+modifypicline(:,1);    
   modifypicline(:,2)=modifypic(:,ii,2)+modifypicline(:,2);    
   modifypicline(:,3)=modifypic(:,ii,3)+modifypicline(:,3);    
end
modifypicline=modifypicline./201;
 
% figure(2);plot(modifypicline(:,1))
% figure(4);plot(modifypicline(:,2))
% figure(6);plot(modifypicline(:,3))
% figure(2);set(gca,'ylim',[0.1 0.55]);set(gca,'FontSize',16);
% figure(4);set(gca,'ylim',[0.1 0.55]);set(gca,'FontSize',16);
% figure(6);set(gca,'ylim',[0.0 0.3]);set(gca,'FontSize',16);
%  
modifymaxmin=zeros(2,3);  % 1: max , 2: min 
 
modifymaxmin(1,1)=max(modifypicline(:,1));
modifymaxmin(2,1)=min(modifypicline(:,1));
modifymaxmin(1,2)=max(modifypicline(:,2));
modifymaxmin(2,2)=min(modifypicline(:,2));
modifymaxmin(1,3)=max(modifypicline(:,3));
modifymaxmin(2,3)=min(modifypicline(:,3));
 

 
for k=1:1:3
equation1=(referencemaxmin(2,k)*modifymaxmin(1,k)-referencemaxmin(1,k)*modifymaxmin(2,k));
equation2=referencemaxmin(1,k)-referencemaxmin(2,k);
equation3=modifymaxmin(1,k)-modifymaxmin(2,k);
modifypic(:,:,k)=(equation1+equation2*modifypic(:,:,k))/equation3;
end
%   modifypic(:,:,1)=modifypic(:,:,1)*1.05;
%   modifypic(:,:,2)=modifypic(:,:,2)*0.95;
%   modifypic(:,:,3)=modifypic(:,:,3)*1.05;
%  
%  compareline=zeros(631,3);
%  for ii=50:1:576
%     for jj=3000:6000
%         compareline(ii,3)=compareline(ii,3)+modifypic(jj,ii,3);
%     end
%     compareline(ii,3)=compareline(ii,3)./3001;
%     modifypic(:,ii,3)=modifypic(:,ii,3)*0.14/compareline(ii,3);
%  end
% 
ffile=fopen(resultname,'w');

for k=1:ceil((c))
 for n=1:1800
    fprintf(ffile,'%d\t%d\t%e\t%e\t%e\n',k,n,modifypic(k,n,1),modifypic(k,n,2),modifypic(k,n,3));
 end
end
fclose(ffile);

end

