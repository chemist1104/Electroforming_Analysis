% Voltageset = {25, 22.5, 20, 17.5, 15, 12.5, 11, 11.5, 10, 10.5, 10.2, 9, 9.8, 9.5, 9.2, 8, 8.5, 7, 7.3, 7.8, 7.6, 6, 6.8, 6.5, 6.2, 5, 5.8, 5.3, 4, 4.8, 4.5, 4.3,3.8, 3.5, 3.3, 3, 3.1, 2, 2.8, 2.7, 2.6, 2.5, 2.3, 1, 1.8, 1.6, 1.5, 1.3, 1.1, 0.8, 0.6, 0.5, 0.3};
% Voltagefps = {9,     9,  9,    9,  8,    9,  9,    6,  8,    6,    6, 6,   6,   6,   6, 6,   5, 5,   5,   5,   5, 5,   5,   5,   5, 5,   5,   5, 5,   5,   5,   5,  1,   1,   1, 1,   1, 1,   1,   1,   1,   1,   1, 1,   1,   1,   1,   1,   1,   1,   1,   1,   1};
Voltageset = {25, 22.5, 20, 17.5, 15, 12.5, 11, 11.5, 10, 10.5, 10.2, 9, 9.8, 9.5, 9.2, 8, 8.5, 7, 7.3, 7.8, 7.6, 6, 6.8, 6.5, 6.2, 5, 5.8, 5.3, 4, 4.8, 4.5, 4.3,3.8, 3.5, 3.3, 3, 3.1, 2, 2.8, 2.7, 2.6, 2.5, 2.3};
Voltagefps = {9,     9,  9,    9,  8,    9,  9,    6,  6,    6,    6, 6,   6,   6,   6, 6,   5, 5,   5,   5,   5, 5,   5,   5,   5, 5,   5,   5, 5,   5,   5,   5,  1,   1,   1, 1,   1, 1,   1,   1,   1,   1,   1};

% Voltageset = {1.8, 1.6, 1.5, 1.3, 1.1, 0.8, 0.6, 0.5};
% Voltagefps = {  1,   1,   1,   1,   1,   1,   1,   1};
%Voltageset = {25};
%Voltagefps = {9};
% Voltagefps = {9,     9,  9,    9,  8,    9,  9,    6,  8,    6,    6, 6,   6,   6,   6, 6,   5, 5,   5,   5,   5, 5,   5,   5,   5, 5,   5,   5, 5,   5,   5,   5,  1,   1,   1, 1,   1, 1,   1,   1,   1,   1,   1, 1,   1,   1,   1,   1,   1,   1,   1,   1,   1};

for voltage=1:1:length(Voltageset)

    inputfile=strcat('BCFO30-STO_P2-300C-', string(Voltageset{voltage}), 'V-RGBmatrix.dat');
    outputfile = strcat('figures/Cutimage/OriginalCutimage',string(Voltageset{voltage}), 'V-Tot2intermediate-resized.dat');
    inputfile2 = 'figures/FittingResults.txt';
    
    fittings = csvread(inputfile2);
    [a,b] = size(fittings);
    for vv = 1:1:a
        if fittings(vv,1) == Voltageset{voltage}
            t_0 = fittings(vv,3);
        end
    end
    
    dataarray=dlmread(inputfile);
    newarray = [];
    newarray2 = [];
    [lenT, lenX]=size(dataarray);
    dataarray=reshape(dataarray,lenT,lenX/3,3);
    sseset = [];
    boundarypoints = [];
    for t=1:1:lenT
        if t<t_0*Voltagefps{voltage}
            newarray(t,:,:) = dataarray(t,:,:);
            continue
        end
    end
    for x=1:1:lenX/3
        if x>200
            if x<1721
                xtemp = x-199;
                newarray2(:,xtemp,:) = newarray(:,x,:);
            end
       end
    end
    dlmwrite(outputfile,newarray2);
end