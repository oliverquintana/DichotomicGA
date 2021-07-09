function Y = elitismo(padres, hijos, y)
    %% Elitismo
    % A partir de la población de entrada (2 padres y 2 hijos), se evalua
    % la aptitud de esta devolviendo únicamente a los dos individuos más
    % aptos.
    % Entrada
    % - padres, hijos: Matrices de individuos a evaluar.
    % - y: Función de aptitud para realizar la evaluación.
    % Salida
    % - Y: Matriz que contiene los dos individuos más aptos seleccionados.
    %%
    familia = [padres; hijos];
    apt = evaluarAptitud(familia, y);
    indiv = ordenarAptitud(apt, familia);
    Y = indiv(1:2,:);

end
