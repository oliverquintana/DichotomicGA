function [indiv, promAptitudIndiv] = monog(indiv, y, maxGen, cruza, prec, flag)
    %% Selección Aleatoria Monogámica
    % A partir de la población de individuos y su cruza, una nueva
    % población es seleccionada correspondiente a los individuos más aptos.
    % La selección es realizada comparando ambos padres con sus
    % descendientes, donde los 2 mejores individuos pasan a la siguiente
    % generación.
    % Entrada
    % - indiv: Población de padres
    % - y: Función de aptitud
    % - maxGen: Número máximo de iteraciones a realizar.
    % - cruza: Población de descendientes de 'indiv'.
    % - prec: Promedio de aptitud mínimo deseado.
    % Salida
    % - indiv: Nueva población generada después de n generaciones.
    % - promAptitud: Promedio de aptitud de la población en cada generación. 
    %%
    [m,n] = size(indiv);
    nIndiv = zeros(m,n);
    umbral = 0.97;
    promAptitud(1,1) = mean(evaluarAptitud(indiv,y));
    promAptitudIndiv(1,1) = mean(evaluarAptitud(indiv,y) >= umbral);
    
    for i=2 : maxGen
        
        indiv = indiv(randperm(size(indiv,1)),:);
        j = 1;
        
        while ~isempty(indiv)
            
            padres = [indiv(1,:); indiv(2,:)];
            hijos = cruzarIndiv(padres, cruza);
            nIndiv(j:j+1,:) = elitismo(padres, hijos, y);
            
            indiv(1:2,:) = [];
            j = j + 2;
            
        end
        
        indiv = nIndiv;
        apt = evaluarAptitud(indiv,y);
        promAptitudIndiv(i,1) = mean(apt >= umbral);
        promAptitud(i,1) = mean(apt);
        
        if flag == 1 % Detiene la ejecución si 2 generación consecutivas no mejoran en aptitud o la aptitud deseada es alcanzada.
            if promAptitudIndiv(i,1) >= prec || promAptitudIndiv(i,1) == promAptitudIndiv(i-1,1)
                break
            end
        end
        
    end
    
    promAptitudIndiv = [promAptitudIndiv, promAptitud];
    
end
