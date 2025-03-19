% Voltageset = {25, 22.5, 20, 17.5, 15, 12.5, 11, 11.5, 10, 10.5, 10.2, 9, 9.8, 9.5, 9.2, 8, 8.5, 7, 7.3, 7.8, 7.6, 6, 6.8, 6.5, 6.2, 5, 5.8, 5.3, 4, 4.8, 4.5, 4.3,3.8, 3.5, 3.3, 3, 3.1, 2, 2.8, 2.7, 2.6, 2.5, 2.3, 1, 1.8, 1.6, 1.5, 1.3, 1.1, 0.8, 0.6, 0.5, 0.3};
% Voltagefps = {9,     9,  9,    9,  8,    9,  9,    6,  8,    6,    6, 6,   6,   6,   6, 6,   5, 5,   5,   5,   5, 5,   5,   5,   5, 5,   5,   5, 5,   5,   5,   5,  1,   1,   1, 1,   1, 1,   1,   1,   1,   1,   1, 1,   1,   1,   1,   1,   1,   1,   1,   1,   1};
% Voltageset = {25, 22.5, 20, 17.5, 15, 12.5, 11, 11.5, 10, 10.5, 10.2, 9, 9.8, 9.5, 9.2, 8, 8.5, 7, 7.3, 7.8, 7.6, 6, 6.8, 6.5, 6.2, 5, 5.8, 5.3, 4, 4.8, 4.5, 4.3,3.8, 3.5, 3.3, 3, 3.1, 2, 2.8, 2.7, 2.6, 2.5, 2.3};
% Voltagefps = {9,     9,  9,    9,  8,    9,  9,    6,  6,    6,    6, 6,   6,   6,   6, 6,   5, 5,   5,   5,   5, 5,   5,   5,   5, 5,   5,   5, 5,   5,   5,   5,  1,   1,   1, 1,   1, 1,   1,   1,   1,   1,   1};

% Voltageset = {1.8, 1.6, 1.5, 1.3, 1.1, 0.8, 0.6, 0.5};
% Voltagefps = {  1,   1,   1,   1,   1,   1,   1,   1};
Voltageset = {25};
Voltagefps = {9};
% Voltagefps = {9,     9,  9,    9,  8,    9,  9,    6,  8,    6,    6, 6,   6,   6,   6, 6,   5, 5,   5,   5,   5, 5,   5,   5,   5, 5,   5,   5, 5,   5,   5,   5,  1,   1,   1, 1,   1, 1,   1,   1,   1,   1,   1, 1,   1,   1,   1,   1,   1,   1,   1,   1,   1};

for voltage=1:1:length(Voltageset)

    inputfile=strcat('figures/Cutimage/Cutimage-', string(Voltageset(1,voltage)), 'V-RGBmatrixModified.dat');
    outputfile = strcat('figures/Cutimage/processed/',string(Voltageset{voltage}), 'V-Tot2intermediate-resized.dat');

    dataarray=dlmread(inputfile);
    [lenT, lenX]=size(dataarray);
    dataarray=reshape(dataarray,lenT,lenX/3,3);
    
    modX_min = 100;
    modX_max = lenX/3;
    
    

%     LineY_min = 0.1*lenT;
%     LineY_max = 0.9*lenT;
    
    LineY_min = fix(10);
    LineY_max = fix(lenT);
    sfactor=0.02;
%     for jj=fix(lenX/30*9):1:lenX/3
%         if dataarray(lenT-1,jj,1)+dataarray(lenT-1,jj,2)+dataarray(lenT-1,jj,3) > 1.3
%             modX_max = jj;
%             break
%         end
%     end
    boundaryline=zeros(modX_max-modX_min+1,2);
    sline=smooth(dataarray(:,modX_min,1)+dataarray(:,modX_min,2)+dataarray(:,modX_min,3),sfactor,'loess');
    diffline=diff(sline);
    [minX,minP]=min(diffline);
% minP=699;

            
    for ii=modX_min:1:modX_max
        sfactor = 0.1;
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
%         [minX,minP]=min(diffline(minmin:maxmax,1));
%   [minX,minP]=min(diffline);
%    minfY=LineY_min;
        minP=minP+minscanY-1;
        ii-modX_min+1;
        boundaryline(ii-modX_min+1,1)=ii*0.24767;
        boundaryline(ii-modX_min+1,2)=minP/Voltagefps{voltage};
   
    end

    %dlmwrite(outputfile,[boundaryline(:,1), boundaryline(:,2)]);
    
    dataarray = imresize(dataarray, [fix(lenT/Voltagefps{voltage}) fix((lenX/3)*0.24767)]);
    imagesc([0 400], [0 fix(lenT/Voltagefps{voltage})], dataarray);
    hold on
    axis xy
    plot(boundaryline(:,1), boundaryline(:,2),'w')
    % saveas(gcf, sprintf('figures/modified_graphs/BCFO-STO_P2-300C-%0.1fV-resize2intermediate_graphs.png', Voltageset{voltage}));
    % close
    

end