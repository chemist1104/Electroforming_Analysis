cwd=pwd;
addpath(genpath(cwd)); 

Voltageset = {25, 22.5, 20, 17.5, 15, 12.5, 11, 11.5, 10, 10.5, 10.2, 9, 9.8, 9.5, 9.2, 8, 8.5, 7, 7.3, 7.8, 7.6, 6, 6.8, 6.5, 6.2, 5, 5.8, 5.3, 4, 4.8, 4.5, 4.3,3.8, 3.5, 3.3, 3, 3.1, 2, 2.8, 2.7, 2.6, 2.5, 2.3, 1, 1.8, 1.6, 1.5, 1.3, 1.1, 0.8, 0.6, 0.5, 0.3};
%Voltageset = {25};

for voltage=1:1:length(Voltageset)
disp(strcat(string(Voltageset(1,voltage)),'V is now Running'));
inputfile=strcat('figures/Cutimage/Cutimage-', string(Voltageset(1,voltage)), 'V-RGBmatrixModified.dat');
outputfile=strcat('figures/Cutimage/Cutimage-', string(Voltageset(1,voltage)), 'V-RGBmatrixModified2.dat');

modifypic=dlmread(inputfile);
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
 
modifypic=reshape(modifypic,c,a/3,3);
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

dlmwrite(outputfile, modifypic)

end
