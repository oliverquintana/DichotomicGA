close all
clear
clc

%% Generar población
genes = 6;
cromosomas = 50;
i_indiv = randi(2, cromosomas, genes) - 1;

%% Generar función de aptitud
x = linspace(-1,1,2^genes);
y = x.^2;

%% Condiciones
% Paro
prec = 0.95; % prec = 1 - Usar sólo maxGeneraciones como condición de paro
maxGeneraciones = 20;
% Método de Cruza - 1: Un corte. 2: Dos cortes, 3: Uniforme.
cruza = 3; 

%% Selección y cruza
% Rank
[indivRank, promAptitudRank] = rank(i_indiv, y, maxGeneraciones, cruza, prec, 1);
% Aleatorio Monogámico
[indivMono, promAptitudMono] = monog(i_indiv, y, maxGeneraciones, cruza, prec, 1);

%% Resultados
graficarResultado('Rank', promAptitudRank)
graficarResultado('Monogamia', promAptitudMono)
