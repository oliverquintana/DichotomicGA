function aptitud = evaluarAptitud(indiv, y)
    %% Evaluar Aptitud
    % Evalua el índice de aptitud de la población de entrada con respecto a
    % una función.
    % Entrada
    % - indiv: Población de entrada a evaluar.
    % - y: Función de aptitud.
    % Salida
    % - aptitud: Lista que contiene el valor de aptitud para cada individuo
    %   de la población.
    %%
    [m,~] = size(indiv);
    aptitud = zeros(m,1);
    
    for i=1 : m     % Evaluación de aptitud individuo a individuo
        dec = bi2de(indiv(i,:));
        aptitud(i) = y(dec+1);
    end
    
end
