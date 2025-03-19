% Voltageset = {25, 22.5, 20, 17.5, 15, 12.5, 11, 11.5, 10, 10.5, 10.2, 9, 9.8, 9.5, 9.2, 8, 8.5, 7, 7.3, 7.8, 7.6, 6, 6.8, 6.5, 6.2, 5, 5.8, 5.3, 4, 4.8, 4.5, 4.3,3.8, 3.5, 3.3, 3, 3.1, 2, 2.8, 2.7, 2.6, 2.5, 2.3, 1, 1.8, 1.6, 1.5, 1.3, 1.1, 0.8, 0.6, 0.5, 0.3};
% Voltagefps = {9,     9,  9,    9,  8,    9,  9,    6,  8,    6,    6, 6,   6,   6,   6, 6,   5, 5,   5,   5,   5, 5,   5,   5,   5, 5,   5,   5, 5,   5,   5,   5,  1,   1,   1, 1,   1, 1,   1,   1,   1,   1,   1, 1,   1,   1,   1,   1,   1,   1,   1,   1,   1};
% 
Voltageset = {25.0, 22.5, 20.0, 17.5, 15.0, 12.5, 11.0, 11.5, 10.0, 10.5, 10.2, 9.0, 9.8, 9.5, 9.2, 8.0, 8.5, 7.0, 7.3, 7.8, 7.6, 6.0, 6.8, 6.5, 6.2, 5.0, 5.8, 5.3, 4.0, 4.8, 4.5, 4.3, 3.8, 3.5, 3.3, 3.0, 3.1, 2.0, 2.8, 2.7, 2.6, 2.5, 2.3};
Voltagefps = {   9,    9,    9,    9,    8,    9,    9,    6,    6,    6,    6,   6,   6,   6,   6,   6,   5,   5,   5,   5,   5,   5,   5,   5,   5,   5,   5,   5,   5,   5,   5,   5,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1};

% Voltageset = {1.8, 1.6, 1.5, 1.3, 1.1, 0.8, 0.6, 0.5};
% Voltagefps = {  1,   1,   1,   1,   1,   1,   1,   1};
%  Voltageset = {25, 4};
%  Voltagefps = {5};
% Voltagefps = {9,     9,  9,    9,  8,    9,  9,    6,  8,    6,    6, 6,   6,   6,   6, 6,   5, 5,   5,   5,   5, 5,   5,   5,   5, 5,   5,   5, 5,   5,   5,   5,  1,   1,   1, 1,   1, 1,   1,   1,   1,   1,   1, 1,   1,   1,   1,   1,   1,   1,   1,   1,   1};
inputfile2=sprintf('figures/Fittingtest.txt');
coeff = csvread(inputfile2);
figure

for voltage=1:1:length(Voltageset)
    inputfile=sprintf('figures/modified_graphs/confirmed/%0.1fV-Tot2-resized2.txt',Voltageset{voltage} );
    boundaryline = dlmread(inputfile);
    semilogx(boundaryline(:,2), boundaryline(:,1), 'Color', [Voltageset{voltage}/25, 0.5-0.5*Voltageset{voltage}/50, 1-Voltageset{voltage}/25] , 'linewidth', 1.5)

    hold on
end
for voltage=1:1:length(Voltageset)
    for ii = 1:1:length(coeff)
        if coeff(ii,1) == Voltageset{voltage}
            a = coeff(ii,2);
            b = coeff(ii,3);
        end
    end

    
    x = [50:0.25:400];
    y = a*((400 - x).^2-2.*400.*(400 - x))+b;
    semilogx(y,x, 'Color', [0.4,0.4,0.4], 'linewidth', 0.5)

    hold on
    
    

end
set(gca,'XTickLabel',[],'YTickLabel',[])
axis([0 6000 0 400.3])
axis ij
saveas(gcf, sprintf('figures/modified_graphs/TotalBDtest.png'));

