function [Result]=XBerror(Xmin,Xmax,Temp,dataname,frame)
% Xmin=60;
% Xmax=575;
boundN=sprintf('LAO10nm-BCFO45-STO-%dC-25V-boundary.dat',Temp);
boundary=dlmread(boundN);  % boundary(:,1) position , boundary(:,2) time scale
dataarray=dlmread(dataname);
dataarray=reshape(dataarray,frame,431,3);
reference=dataarray(:,:,1)+dataarray(:,:,2)+dataarray(:,:,3);

%boundary(:,1)=400-boundary(:,1);  % go to original position (400 ~ 0)
%boundary(:,1)=(boundary(:,1)./400)*(Xmax-Xmin-2)+Xmin;
%boundary(:,2)=boundary(:,2)*6;
%boundary=fix(boundary);
[s1, s2]=size(boundary);
gaussEqn='a*exp(-((x-b)^2)/(2*(c)^2))+d';
Result=zeros(s1,5);


for ii=1:1:s1
    sline=smooth(reference(fix(boundary(ii,2)),:),0.05,'loess');
    diffline=diff(sline);
    Pmin=fix(max(boundary(ii,1)-8,Xmin));
    Pmax=fix(min(boundary(ii,1)+8,Xmax));   %  1<= Xmin,Xmax <=411
    [coeff,f1]=GaussianFitCoeff(diffline,gaussEqn,Pmin,Pmax,boundary(ii,1));
    Result(ii,1)=boundary(ii,2);  % Time
    Result(ii,2)=coeff(1);   % fitting weight factor
    Result(ii,3)=coeff(2);   % fitting Position
    Result(ii,4)=coeff(3);   % fitting FWHM
    Result(ii,5)=coeff(4);   % fitting background
    
   if ii<10
    savename=sprintf('%dC-Positionfitting-BCFO45_00%d.jpg',Temp,ii);
    end
    if (ii>=10)&&(ii<100)
    savename=sprintf('%dC-Positionfitting-BCFO45_0%d.jpg',Temp,ii);
    end
    if ii>=100
    savename=sprintf('%dC-Positionfitting-BCFO45_%d.jpg',Temp,ii);
    end
    h=figure; 
    plot(diffline); hold on;
    plot(f1); 
    xlim([Xmin Xmax]);
    saveas(h,savename);
    close(h);
    
end


foldname=sprintf('%dC-Boundary_wPositionError-BCFO45',Temp);
jpgname=sprintf('%dC-Positionfitting-BCFO45_*.jpg',Temp);
resultname=sprintf('%dC-Boundary_wPositionError-BCFO45_Result.dat',Temp);
mkdir(foldname);
movefile(jpgname,foldname);
dlmwrite(resultname,Result);
movefile(resultname,foldname);
end

function [aa,f1]=GaussianFitCoeff(diffdata,gaussEqn,Tmin,Tmax,Tcen)
 minIntensity=0;
 len=length(diffdata);
 x=1:len;
 x=x';
     for ii=Tmin:Tmax
        minIntensity=min(minIntensity,diffdata(ii,1));
     end
     for ii=Tmin:Tmax
         if(diffdata(ii,1)==minIntensity)
             Tcen=ii;
             break;
         end
     end

    startsPoints=[minIntensity (Tmin+Tmax)/2 abs(Tmax-Tmin)/10 0];
    opts = fitoptions( gaussEqn,'start',startsPoints,'Exclude',x<Tcen-30,'Exclude',x>Tcen+30,'MaxIter',50000,'Robust','LAR');
    opts.Lower=[-Inf Tcen-8 0 -Inf];
    opts.Upper=[Inf Tcen+8 (Tmax-Tmin)/6 Inf];
    f1=fit(x,diffdata(x,1),gaussEqn,opts);
    aa=coeffvalues(f1);
    
end
