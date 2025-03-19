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

    inputfile=strcat('figures/Cutimage/Cutimage',string(Voltageset{voltage}), 'V-Tot2intermediate-resized.dat');
    outputfile = strcat('figures/',string(Voltageset{voltage}), 'V-Tot2intermediate-resized.dat');

    dataarray=dlmread(inputfile);
    [lenT, lenX]=size(dataarray);
    dataarray=reshape(dataarray,lenT,lenX/3,3);
    sseset = [];
    boundarypoints = [];
    for startpointX = 200:1:1600
        for startpointT = 100:1:3000
    
            windowsize = [50*Voltagefps{voltage}, 50*Voltagefps{voltage}];
            starting = [startpointT, startpointX];
            temparray = [starting(1,1) dataarray(starting(1,1), starting(1,2))];
    
    
            for jj = 1:1:windowsize(1,1)
                temparray = [temparray; starting(1,1)+jj dataarray(starting(1,1)+jj, starting(1,2))];
            end
    
            linearfit = polyfit(temparray(:,1), temparray(:,2), 1);
            linearfitfun = polyval(linearfit, temparray(:,1));
            sse = sum((temparray(:,2) - linearfitfun).^2);
            if size(sseset) == [0 0]
                sseset = [starting(1,1)+windowsize(1,1)/2 sse];
            else
                sseset = [sseset; starting(1,1)+windowsize(1,1)/2 sse];
            end
            [maxtemp maxind] = max(sseset(:,2));
        end
        if size(boundarypoints) == [0 0]
            boundarypoints = [startpointX maxind+100];
        else
            boundarypoints = [boundarypoints; startpointX maxind+100];
        end
    end
    figure
    plot(boundarypoints(:,1), boundarypoints(:,2), 'o')

    
    

end