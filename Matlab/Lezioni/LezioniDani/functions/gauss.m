function [U, d] = gauss(A, b)
    
    % gauss: funzione che calcola la riduzione di Gauss e prende in ingresso la
    % matrice A e il vettore di termini noti b.
    % [U, d] = gauss(A, b) restituisce la riduzione di Gauss, non i termini
    % noti

    % Controlli preliminari sulla dimensione della matrice
    if size(A, 1) ~= size(A, 2)
        error("La matrice deve essere quadrata")
    end

    n = size(A, 1);

    for k = 1 : n-1
        for i = k+1 : n
            
            m = A(i, k) / A(k, k);
            
            % Calcolo della nuova riga per ottenere una triangolare
            % inferiore
            A(i, :) = A(i, :) - m * A(k, :);

            b(i) = b(i) - m * b(k);
        end
    end

    % Assegno il valore corretto alle matrici da restituire
    U = A;
    d = b;
end