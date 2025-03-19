Voltageset = {25.0, 22.5, 20.0, 17.5, 15.0, 12.5, 11.0, 11.5, 10.0, 10.5, 10.2, 9.0, 9.8, 9.5, 8.0, 8.5, 7.0, 7.3, 7.6, 6.0, 6.5, 5.0, 5.8, 5.3, 4.0, 4.8, 4.5, 4.3, 3.8, 3.5, 3.3, 3.0, 3.1, 2.0, 2.8, 2.7, 2.6, 2.5, 1.5, 1.0};
Voltagefps = {   9,    9,    9,    9,    8,    9,    9,    6,    6,    6,    6,   6,   6,   6,   6,   6,   5,   5,   5,   5,   5,   5,   5,   5,   5,   5,   5,   5,   5,   5,   5,   5,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1};

% Voltageset = {1.8, 1.6, 1.5, 1.3, 1.1, 0.8, 0.6, 0.5};
% Voltagefps = {  1,   1,   1,   1,   1,   1,   1,   1};
%Voltageset = {4.0};
%Voltagefps = {5};
% Voltagefps = {9,     9,  9,    9,  8,    9,  9,    6,  8,    6,    6, 6,   6,   6,   6, 6,   5, 5,   5,   5,   5, 5,   5,   5,   5, 5,   5,   5, 5,   5,   5,   5,  1,   1,   1, 1,   1, 1,   1,   1,   1,   1,   1, 1,   1,   1,   1,   1,   1,   1,   1,   1,   1};

figure

for voltage=1:1:length(Voltageset)
    inputfile=sprintf('figures/Survey_txt/A3054-3_LAO10nm-BCFO30-STO_P2-300C-%0.1fV-1st.txt',Voltageset{voltage} );
    currentline = table2array(readtable(inputfile));
    loglog((currentline(:,1)),(currentline(:,3)), 'Color',[Voltageset{voltage}/25, 0.5-0.5*Voltageset{voltage}/50, 1-Voltageset{voltage}/25])
    for jj = 1:1:length(currentline(:,3))
        if currentline(jj,3) < 0.000000001
            Voltageset{voltage}
        end
    end
%    plot( boundaryline(:,1), boundarydiff)
    
    hold on
end
% 
set(gca,'XTickLabel',[],'YTickLabel',[])
% axis([0 6000 0 400.3])
% axis ij
saveas(gcf, sprintf('figures/modified_graphs/TotalBDsemi4.png'));