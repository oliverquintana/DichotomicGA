function graficarResultado(titulo, aptitud)
    %% Graficar resultados.
    % Muestra la gráfica generaciones vs aptitud de la población
    % Entrada:
    % - Título
    % - Valores de aptitud de la población evaluada.
    %%
    [m,~] = size(aptitud);

    figure,
    hold on
    grid on
    p = plot(aptitud);
    [~,n] = size(aptitud);
    p(1).LineWidth = 2;
    p(2).LineWidth = 2;
    legend('Porcentaje de individuos aptos (x100)','Promedio de aptitud de individuos', 'location', 'southeast')
    title(sprintf('Selección por %s', titulo))
    xlabel('Generaciones')
    ylabel('Aptitud')
    axis([1 length(aptitud) 0 1])
    hold off
    sprintf('Aptitud última generación %s: %s', titulo, string(aptitud(m)))
    
end
