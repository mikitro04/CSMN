function [xs, ks] = secanti(f, x0, x1, tau, kmax)

    % secanti: metodo per trovare un'approssimazione della radice di 
    % f(x) = 0
    %   [x, k] = secanti(f, x0, x1, tau, kmax) restituisce l'approssimazione
    %   della radice e il numero di iterazioni effettuate.

    % Caso base: x0 è già una soluzione
    if abs(f(x0)) < tau
        xs = x0;
        ks = 0;
        return
    end


    % Inizio algoritmo iterativo da 1 a kmax con passo 1
    for ks = 1 : kmax

        % Controllo che i punti non siano gli stessi
        if x0 == x1
            error("Divisione per 0, modifica x0 e x1");
        end
        
        f0 = f(x0);
        f1 = f(x1);
        
        % Formula secanti
        m = (f1 - f0) / (x1 - x0);
        x_new = x1 - f1 / m;

        % Condizioni di arresto: se la soluzione non è variata
        % significativamente dall'iterazione precedente o se l'immagine
        % risulta abbastanza vicina a 0
        if abs(x_new - x1) < tau * abs(x1) || abs(f(x_new)) < tau
            xs = x_new;
            return;
        end

        % Aggiorno i punti
        x0 = x1;
        x1 = x_new;
    end

    % In caso esca dal ciclo significa che è stato raggiunto il numero
    % massimo di iterazioni senza che il punto trovato abbia raggiunto una
    % tolleranza accettabile
    xs = x_new;
    warning("Iterazioni massime raggiunte");
   
end