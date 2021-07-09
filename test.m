close all
clear
clc

%%
x = linspace(-1,1,2^6);
y = x.^2;
iter = 20;
cruza = 3;
prec = 1;
maxGeneraciones = 100;
aptRank = zeros(maxGeneraciones, iter);
aptMono = zeros(maxGeneraciones, iter);

for i=1: iter

    i_indiv = randi(2, 50, 6) - 1;
    [~, promAptitudRank] = rank(i_indiv, y, maxGeneraciones, cruza, prec, 0);
    [~, promAptitudMono] = monog(i_indiv, y, maxGeneraciones, cruza, prec, 0);

    aptRank(:,i) = promAptitudRank(:,1);
    aptMono(:,i) = promAptitudMono(:,1);

end

sprintf('Aptitud Rank >= 0.95: %s', string((mean(aptRank(maxGeneraciones,:) >= .95))*100))
sprintf('Aptitud Mono >= 0.95: %s', string((mean(aptMono(maxGeneraciones,:) >= .95))*100))

figure,plot(aptRank)
xlabel('Generaciones')
ylabel('Promedio de individuos aptos')
grid on
figure,plot(aptMono)
xlabel('Generaciones')
ylabel('Promedio de individuos aptos')
grid on
