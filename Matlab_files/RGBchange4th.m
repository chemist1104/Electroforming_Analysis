Xmin=33;
Xmax=373;

referencemaxmin=zeros(2,3);  % 1: max , 2: min
 referencelength=zeros(1,3);
 
 referencemaxmin(1,1)=0.6;
 referencemaxmin(2,1)=0.1; %constant
 referencemaxmin(1,2)=0.55;
 referencemaxmin(2,2)=0.1; %constant
 referencemaxmin(1,3)=0.15;
 referencemaxmin(2,3)=0.1; %constant
 
 referencelength(1,:)=referencemaxmin(1,:)-referencemaxmin(2,:);
 
 modifypic=dlmread('A3160-2_LAO00nm-BCFO30-STO-360C-25V-RGBmatrix.dat');
 modifypic=reshape(modifypic,5400,411,3);
 modifypicline=zeros(5400,3);
 
 for ii=200:1:250
   modifypicline(:,1)=modifypic(:,ii,1)+modifypicline(:,1);    
   modifypicline(:,2)=modifypic(:,ii,2)+modifypicline(:,2);    
   modifypicline(:,3)=modifypic(:,ii,3)+modifypicline(:,3);    
end
modifypicline=modifypicline./51;
 

 modifymaxmin=zeros(2,3);  % 1: max , 2: min 
 modifylength=zeros(1,3);
 
 modifymaxmin(1,1)=max(modifypicline(:,1));
 modifymaxmin(2,1)=min(modifypicline(:,1));
 modifymaxmin(1,2)=max(modifypicline(:,2));
 modifymaxmin(2,2)=min(modifypicline(:,2));
 modifymaxmin(1,3)=max(modifypicline(:,3));
 modifymaxmin(2,3)=min(modifypicline(:,3));
 
 modifylength(1,:)=modifymaxmin(1,:)-modifymaxmin(2,:);
 

 Colorlength=zeros(1,3);
 referenceCmaxmin=zeros(1,3);
 for k=1:1:3
  for ii=Xmin:Xmax   
      modifyCmax=max(modifypic(:,ii,k));
      modifyCmin=min(modifypic(:,ii,k));
    Colorlength(1,k)=max(modifypic(:,ii,k))-min(modifypic(:,ii,k)); 
     referenceCmaxmin(1,k)=referencemaxmin(2,k)+Colorlength(1,k)*referencelength(1,k)/modifylength(1,k);
  equation1=(referencemaxmin(2,k)*modifyCmax-referenceCmaxmin(1,k)*modifyCmin);
  equation2=referenceCmaxmin(1,k)-referencemaxmin(2,k);
  equation3=modifyCmax-modifyCmin;
  modifypic(:,ii,k)=(equation1+equation2*modifypic(:,ii,k))/equation3;
 end
 end