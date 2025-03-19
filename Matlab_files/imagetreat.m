function imagetreat(inputfile,resultfile,ffilematrix,endnum,Xmin,Ymin,Xrange,Yrange,Stepnum)
% this program is for a 480(y)x720(x) dpi image or video
ffile=fopen(resultfile,'w');
if(mod(endnum+1,Stepnum)==0)
    disp('1st process is ok');
    Linesumintensity=zeros(ceil((endnum+1)/Stepnum),Xrange+1,3);
else
   disp('endnum is errr');
   exit
end     

for inum=0:1:endnum
inputfilenum=Inputfilename(inputfile,inum);
inputfilenum=sprintf('%s.tif',inputfilenum);
Original=imread(inputfilenum);  % Original 720x1280x4 array (RGB,255) 
RGBimage=zeros(1080,1920,3);
RGBimage(:,:,1)=Original(:,:,1);
RGBimage(:,:,2)=Original(:,:,2);
RGBimage(:,:,3)=Original(:,:,3);
RGBimage=RGBimage./255;


lineintensity=Intensityrange(RGBimage,Xmin,Ymin,Xrange,Yrange);  %lineintensity(1,Xrange+1,3)
Inputsumarray=Linesumintensity(ceil((inum+1)/Stepnum),:,:);      % input the initialzed zero array
outputsumarray=Sumintensity(Inputsumarray,lineintensity,inum,Stepnum);  % How many frames are summed ? 
Linesumintensity(ceil((inum+1)/Stepnum),:,:)=outputsumarray;
  
% if(inum==0)
%     NormalizeNum=outputsumarray;
% end
% 
% Linesumintensity(ceil((inum+1)/Stepnum),:)=Linesumintensity(ceil((inum+1)/Stepnum),:)./NormalizeNum;
  
%  imadjust(d,[0.1 0.8],[0 1]);

%  colormap('gray');
%  hh=imshow(HSVimage(:,:,3));
%  outputfilenum=Inputfilename(outputfile,inum);
%  saveas(hh,outputfilenum,'tiff');
%  clear hh;

end

for k=1:ceil((endnum+1)/Stepnum)
 for n=1:Xrange+1
    fprintf(ffile,'%d\t%d\t%e\t%e\t%e\n',k,n,Linesumintensity(k,n,1),Linesumintensity(k,n,2),Linesumintensity(k,n,3));
 end
end
fclose(ffile);

dlmwrite(ffilematrix,Linesumintensity);

end

function [lineintensity]=Intensityrange(Image,Xmin,Ymin,Xrange,Yrange)
    %   for hsv image we get 'v'(value) 
    %   (Xmin, Ymin) --------------------- (Xmin+Xrange,Ymin)
    %        |                                      |
    %        |                                      |
    %   (Xmin,Ymin+Yrange) ---------------- (Xmin+Xrange, Ymin+Yrange)
    
    lineintensity=zeros(1,Xrange+1,3);  % RGB information
    for RGBind=1:1:3
    for j=0:Xrange
        Ydiv=0;
        for i=0:Yrange
           % value=Regionexception(j,i);  % image defect 제거 영역 설정
            value=1;
            lineintensity(1,j+1,RGBind)=lineintensity(1,j+1,RGBind)+(value*Image(Ymin+i,Xmin+j,RGBind));
            Ydiv=Ydiv+value;
        end
       lineintensity(1,j+1,RGBind)=lineintensity(1,j+1,RGBind)/Ydiv;
    end
    end
end

% function [value]=Regionexception(xx,yy)
%   if ((592<xx)&&(xx<634)&&(214<yy)&&(yy<231))
%       value=0;
%   elseif ((770<xx)&&(xx<793)&&(234<yy)&&(yy<248))
%       value=0;
%   elseif ((851<xx)&&(xx<877)&&(216<yy)&&(yy<230))
%       value=0;      
%   elseif ((896<xx)&&(xx<910)&&(221<yy)&&(yy<240))
%       value=0;
%   else
%       value=1;
%   end
% 
% 
% end
function [Sumoutput]=Sumintensity(Suminput,intensityarray,inum,Stepnum)  % How many frames are summed ?
     
    Sumoutput=Suminput+intensityarray;  
    
    if (mod(inum+1,Stepnum)==0)
      Sumoutput = Sumoutput/Stepnum;
    end
end

function [inputfilenum]=Inputfilename(inputfile,num)
  if((num<10) && (num>=0))
     inputfilenum=sprintf('%s0000%d',inputfile,num); 
  end
  if((num>=10) && (num<100))
     inputfilenum=sprintf('%s000%d',inputfile,num); 
  end
  if((num>=100) && (num<1000))
     inputfilenum=sprintf('%s00%d',inputfile,num); 
  end
  if((num>=1000) && (num<10000))
     inputfilenum=sprintf('%s0%d',inputfile,num); 
  end
  if((num>=10000) && (num<100000))
     inputfilenum=sprintf('%s%d',inputfile,num); 
  end
end