
Voltageset = {25.0, 22.5, 20.0, 17.5, 15.0, 12.5, 11.0, 11.5, 10.0, 10.5, 10.2, 9.0, 9.8, 9.5, 9.2, 8.0, 8.5, 7.0, 7.3, 7.8, 7.6, 6.0, 6.8, 6.5, 6.2, 5.0, 5.8, 5.3, 4.0, 4.8, 4.5, 4.3, 3.8, 3.5, 3.3, 3.0, 3.1, 2.0, 2.8, 2.7, 2.6, 2.5, 2.3};
Voltagefps = {   9,    9,    9,    9,    8,    9,    9,    6,    6,    6,    6,   6,   6,   6,   6,   6,   5,   5,   5,   5,   5,   5,   5,   5,   5,   5,   5,   5,   5,   5,   5,   5,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1};

% Voltageset = {1.8, 1.6, 1.5, 1.3, 1.1, 0.8, 0.6, 0.5};
% Voltagefps = {  1,   1,   1,   1,   1,   1,   1,   1};
%Voltageset = {4.0};
%Voltagefps = {5};
% Voltagefps = {9,     9,  9,    9,  8,    9,  9,    6,  8,    6,    6, 6,   6,   6,   6, 6,   5, 5,   5,   5,   5, 5,   5,   5,   5, 5,   5,   5, 5,   5,   5,   5,  1,   1,   1, 1,   1, 1,   1,   1,   1,   1,   1, 1,   1,   1,   1,   1,   1,   1,   1,   1,   1};

figure

for voltage=1:1:length(Voltageset)
    inputfile=sprintf('figures/modified_graphs/%0.1fV-Diff.txt',Voltageset{voltage} );
    diffline = dlmread(inputfile);
    diffline(:,2) = smooth(diffline(:,2),0.2,'loess');
    if voltage == 14
        continue
    end
    loglog(diffline(:,1),diffline(:,2))

%    plot( boundaryline(:,1), boundarydiff)
    
    hold on
end
% 
% set(gca,'XTickLabel',[],'YTickLabel',[])
% axis([0 6000 0 400.3])
% axis ij
% saveas(gcf, sprintf('figures/modified_graphs/TotalBDsemi3.png'));

