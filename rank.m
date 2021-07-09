function [indiv, promAptitudIndiv] = rank(indiv, y, maxGen, cruza, prec, flag)
    %% Selección Rank
    % A partir de la población de individuos y su cruza, una nueva
    % población es seleccionada correspondiente a los individuos más aptos.
    % La selección es realizada ordenando toda la población de mayor a
    % menor aptitud, tomando parejas en este orden y cruzándolas. Al
    % mezclar padres con hijos se seleccionan los n individuos más aptos
    % que pasarán a la siguiente generación.
    % - indiv: Población de padres
    % - y: Función de aptitud
    % - maxGen: Número máximo de iteraciones a realizar.
    % - cruza: Población de descendientes de 'indiv'.
    % - prec: Promedio de aptitud mínimo deseado.
    % Salida
    % - indiv: Nueva población generada después de n generaciones.
    % - promAptitud: Promedio de aptitud de la población en cada generación. 
    %%
    umbral = 0.97;
    indivAptitud = evaluarAptitud(indiv, y);
    promAptitudIndiv(1,1) = mean(indivAptitud(:,1) >= umbral);
    promAptitud(1,1) = mean(evaluarAptitud(indiv, y));
    [m,~] = size(indiv);

    for i=2 : maxGen
        %% Ordenar por aptitud
        indivOrdenAptitud = ordenarAptitud(indivAptitud, indiv);
        %sum(apt(:,1))

        %% Cruza
        indivCruza = cruzarIndiv(indivOrdenAptitud, cruza);

        %% Conservar mejores individuos (Competencia genética)
        %indiv = seleccion(indivOrdenAptitud, indivCruza);
        nIndiv = [indiv; indivCruza];
        indivAptitud = evaluarAptitud(nIndiv, y);
        indivOrden = ordenarAptitud(indivAptitud, nIndiv);
        indiv = indivOrden(1:m,:);
        
        %% Evaluar aptitud
        indivAptitud = evaluarAptitud(indiv, y);
        promAptitudIndiv(i,1) = mean(indivAptitud >= umbral);
        promAptitud(i,1) = mean(indivAptitud);
        
        %%
        if flag == 1 % Detiene la ejecución si 2 generación consecutivas no mejoran en aptitud o la aptitud deseada es alcanzada.
            if promAptitudIndiv(i) > prec || promAptitudIndiv(i) == promAptitudIndiv(i-1)
                break
            end
        end
        
    end
    promAptitudIndiv = [promAptitudIndiv, promAptitud];
end
