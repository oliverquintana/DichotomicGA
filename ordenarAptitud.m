function indivOrd = ordenarAptitud(aptitud, indiv)
    %% Orden por Aptitud
    % La población es ordenada de manera descendiente de acuerdo al índice
    % de aptitud de cada individuo.
    % Entrada
    % aptitud: Índice de aptitud de cada individuo en la población.
    % indiv: Población de individuos a ordenar.
    % Salida
    % indivOrd: Población ordenada.
    %%
    [m,n] = size(indiv);
    indivOrd = zeros(m,n);
    [~, index] = sort(aptitud,'descend');
    
    for i=1 : m
        indivOrd(i,:) = indiv(index(i),:);
    end


end
