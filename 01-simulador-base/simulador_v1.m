% Parametros
nx = 20; ny = 20;  % goteros
N = nx*ny;
caudal_base = 20; % L/h por gotero sano
prob_tapa_por_dia = 0.02; % 2% diario de taparse
dias_simulacion = 30;
DU_target = 90;

% Estado inicial: todos sanos
caudal = caudal_base * ones(nx, ny);
taponado = false(nx, ny); % false = sano

% Historia
hist_DU = zeros(dias_simulacion, 1);

for dia = 1:dias_simulacion
    % 1. Taponamiento aleatorio
    nueva_tapa = rand(nx, ny) < prob_tapa_por_dia;
    taponado = taponado | nueva_tapa;
    
    % 2. Caudal: si está tapado, caudal = 0
    caudal(taponado) = 0;
    
    % 3. Calcular DU
    caudales_vector = caudal(:);
    % Excluir ceros? No, porque DU considera goteros tapados como cero.
    % Pero cuidado: si muchos ceros, DU colapsa.
    % Para evitar división por cero, tomamos solo los que tienen caudal > 0 para el promedio total?
    % La definición real de DU usa solo los que están operando? En minería, gotero tapado da DU=0 en esa zona.
    % Mejor: usar todos, pero si hay muchos ceros, el promedio de los 25% más bajos será cero.
    % Simulemos realista: un gotero tapado da caudal = 10% del nominal (fuga pequeña) o cero.
    % Ajustamos: caudal tapado = 0.1 * caudal_base (goteo residual)
    caudal(taponado) = 0.1 * caudal_base;  % más realista
    
    caudales_vector = caudal(:);
    q_sort = sort(caudales_vector);
    n_low = round(0.25 * length(q_sort));
    avg_low = mean(q_sort(1:n_low));
    avg_all = mean(q_sort);
    DU = (avg_low / avg_all) * 100;
    
    hist_DU(dia) = DU;
    
    % 4. Graficar evolución (opcional, cada 5 días)
    if mod(dia,5)==0
        figure(1);
        imagesc(caudal);
        colorbar; title(sprintf('Día %d - DU = %.1f%%', dia, DU));
        xlabel('X gotero'); ylabel('Y gotero');
        drawnow;
    end
end

% Resultado final
figure(2);
plot(1:dias_simulacion, hist_DU, 'b-', 'LineWidth', 2);
yline(DU_target, 'r--', 'DU target 90%');
xlabel('Días'); ylabel('DU (%)'); title('Evolución de homogeneidad sin limpieza');
grid on;
