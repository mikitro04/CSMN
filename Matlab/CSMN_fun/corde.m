function [xc, kc] = corde(f, m, x0, tau, kmax)
    
    % corde: metodo per trovare un'approssimazione della radice di 
    % f(x) = 0 
    %   [xc, kc] = corde(f, m, x0, tau, kmax) restituisce l'approssimazione
    %   della radice e il numero di iterazioni effettuate.

    % Controllo che il punto iniziale sia già una radice
    if(abs(f(x0)) < tau)
        xc = x0;
        kc = 1;
        return;
    end
    
    % Controllo che m non sia tendente a 0
    if abs(m) < tau
        error("Valore di m troppo vicino a 0");
    end

    % Inizio algoritmo iterativo da k a kmax
    for kc = 1 : kmax

        % Formula corde
        xc = x0 - f(x0) / m;

        % Condizioni di arresto
        if abs(f(xc)) < tau || abs(xc - x0) < tau * abs(x0)
            return;
        end

        % Aggiorno variabile
        x0 = xc;

    end

    % In caso esca dal ciclo significa che è stato raggiunto il numero
    % massimo di iterazioni senza che il punto trovato abbia raggiunto una
    % tolleranza accettabile
    warning("Iterazioni massime raggiunte");

end