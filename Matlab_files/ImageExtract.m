Xmin=45;
Xmax=399;
dataarray=dlmread('LAO10nm-BCFO45-STO-300C-25V-RGBchange.dat');
lenT=length(dataarray);
dataarray=reshape(dataarray,lenT,431,3);
dataarray=dataarray*1;
for ii=1:1:Xmin
   dataarray(:,ii,:)=1; 
end
for ii=Xmax:1:431
   dataarray(:,ii,:)=1; 
end
x=[1:1:431];
x=(x-Xmin)*(400/(Xmax-Xmin-2));
y=[1:1:lenT];
y=y./6;
fig1=figure(1);
set(fig1, 'OuterPosition', [3, 270, 840, 420])
set(fig1, 'OuterPosition', [3, 270, 400, 800])
set(fig1, 'OuterPosition', [3, 270, 400, 600])
%colormap('gray');
%imagesc(x,y,dataarray);
%set(gca,'clim',[0.2 0.5]);
%x=400-x;
imagesc(x,y,dataarray);
%set(gca,'clim',[0.2 0.5]);
axis xy
 
%set(fig1,'ylim',[0 350]);

set(gca,'ylim',[0 900]);
set(gca,'Linewidth',1);
set(gca,'ticklength',[0.02,0.02]);
set(gca,'xlim',[-30 430]);
set(gca,'xtick',[0 100 200 300 400]);
set(gca,'ytick',[0 150 300 450 600 750 900]);
set(gca,'FontSize',20);
set(gca,'FontSize',12);
set(gca,'FontName', 'Times New Roman');
set(gca,'FontSize',20);
xticklabels('');
yticklabels('');
%set(fig1, 'OuterPosition', [3, 270, 400, 550])
% hold on;
% boundary=dlmread('400C-rBoundary.dat');
% plot(400-boundary(:,1),boundary(:,2),'Linewidth',1);
% hold off;