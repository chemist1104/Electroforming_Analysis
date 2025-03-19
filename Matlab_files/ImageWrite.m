%cwd=pwd;
%addpath(genpath(cwd));

Voltageset = {25, 22.5, 20, 17.5, 15, 12.5, 11, 11.5, 10, 10.5, 10.2, 9, 9.8, 9.5, 9.2, 8, 8.5, 7, 7.3, 7.8, 7.6, 6, 6.8, 6.5, 6.2, 5, 5.8, 5.3, 4, 4.8, 4.5, 4.3,3.8, 3.5, 3.3, 3, 3.1, 2, 2.8, 2.7, 2.6, 2.5, 2.3, 1, 1.8, 1.6, 1.5, 1.3, 1.1, 0.8, 0.6, 0.5, 0.3};
Voltagefps = {9,     9,  9,    9,  8,    9,  9,    6,  8,    6,    6, 6,   6,   6,   6, 6,   5, 5,   5,   5,   5, 5,   5,   5,   5, 5,   5,   5, 5,   5,   5,   5,  1,   1,   1, 1,   1, 1,   1,   1,   1,   1,   1, 1,   1,   1,   1,   1,   1,   1,   1,   1,   1};

%Voltageset = {3.3, 3, 3.1, 2, 2.8, 2.7, 2.6, 2.5, 2.3, 1, 1.8, 1.6, 1.5, 1.3, 1.1, 0.8, 0.6, 0.5, 0.3};
%Voltagefps = {  1, 1,   1, 1,   1,   1,   1,   1,   1, 1,   1,   1,   1,   1,   1,   1,   1,   1,   1};

% Voltageset = {15, 2.8, 3, 1, 1.8, 1.6, 1.5, 1.3, 1.1, 0.8, 0.6, 0.5, 0.3};

%Voltageset = {25, 22.5, 20, 17.5, 12.5, 11, 11.5, 10, 10.5, 10.2, 9, 9.8, 9.5, 9.2, 8, 8.5, 7, 7.3, 7.8, 7.6, 6, 6.8, 6.5, 6.2, 5, 5.8, 5.3, 4, 4.8, 4.5, 4.3,3.8, 3.5, 3.3, 3.1, 2, 2.8, 2.7, 2.6, 2.5, 2.3};
% Voltageset = {15};
% 
% for voltage=1:1:length(Voltageset)
% %     
%      inputfile=strcat('BCFO30-STO_P2-300C-', string(Voltageset{voltage}), 'V-RGBmatrixModified.dat');
%      %inputfile=strcat('BCFO30-STO_P2-300C-', string(Voltageset{voltage}), 'V-RGBmatrix.dat');
% %     
%      imgdata=dlmread(inputfile);
%      [m,n] = size(imgdata);
%      imgdatas=reshape(imgdata, m, n/3, 3);
% % 
%      imwrite(imgdatas, sprintf('figures/image_modified/BCFO-STO_P2-300C-%0.1fV.png', Voltageset{voltage}));
% %     %imagesc(imgdatas);
% %     %axis xy;
% %     %saveas(gcf, sprintf('figures/IMAGE_ORIGINAL/BCFO-STO_P2-300C-%0.1fV.png', Voltageset{voltage}));
% end

% for voltage=1:1:length(Voltageset)
% %      
% %  %    inputfile=strcat('BCFO30-STO_P2-300C-', string(Voltageset{voltage}), 'V-RGBmatrixModified.dat');
% %      %inputfile=strcat('figures/IMAGE_ORIGINAL/BCFO30-STO_P2-300C-', string(Voltageset{voltage}), 'V.png');
% %       
%       imgdata=imread(sprintf('figures/image_modified/BCFO-STO_P2-300C-%0.1fV.png', Voltageset{voltage}));
%       [m, n, l] = size(imgdata);
%       imgdata=imresize(imgdata, [fix(m/Voltagefps{voltage}) fix(n/4)]);
% %  
% %      %imwrite(imgdatas, sprintf('figures/IMAGE_ORIGINAL/BCFO-STO_P2-300C-%0.1fV.png', Voltageset{voltage}));
%       imagesc(imgdata);
%       axis xy;
%       saveas(gcf, sprintf('figures/modified_graphs/BCFO-STO_P2-300C-%0.1fV.png', Voltageset{voltage}));
% end

for voltage=1:1:length(Voltageset)
 %      
       inputfile=strcat('figures/BCFO30-STO_P2-300C-', string(Voltageset{voltage}), 'V-RGBmatrixModified.dat');
 %      %inputfile=strcat('figures/IMAGE_ORIGINAL/BCFO30-STO_P2-300C-', string(Voltageset{voltage}), 'V.png');
       % csvfile = strcat('figures/',string(Voltageset{voltage}), 'V-Tot.csv');
       imgdata = dlmread(inputfile);
       [m, n] = size(imgdata);
       imgdata = reshape(imgdata, m, n/3, 3);
       imgdata=imresize(imgdata, [fix(m/Voltagefps{voltage}) fix((n/3)*0.2476)]);
       %M = csvread(csvfile);
 %     imwrite(imgdatas, sprintf('figures/IMAGE_ORIGINAL/BCFO-STO_P2-300C-%0.1fV.png', Voltageset{voltage}));
       imagesc([-25 418], [0 fix(m/Voltagefps{voltage})],imgdata);
       axis xy;
       hold on
       %plot(M(:,1)/4, M(:,2)/Voltagefps{voltage},'w')
       saveas(gcf, sprintf('figures/modified_graphs/BCFO-STO_P2-300C-%0.1fV-resize.png', Voltageset{voltage}));
       close
end