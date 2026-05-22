function [U, b2] = gauss_p(A, b)

    % gauss_p: funzione che calcola la riduzione di Gauss con pivoting e 
    % prende in ingresso la matrice A e il vettore di termini noti b.
    % [U, b2] = gauss_p(A, b) restituisce la riduzione di Gauss, non i 
    % termini noti

    % Controlli preliminari sulle dimensioni di matrice, vettore e sul
    % determinante di A
    [m, n] = size(A);
    if m ~= n
        error("la matrice deve essere quadrata");
    end
    if size(b, 1) ~= n || size(b, 2) ~= 1
        error("b deve essere un vettore colonna con n righe");
    end
    if abs(det(A)) < 1e-10
        error("La matrice A è singolare");
    end


    for k = 1 : n-1

        [~, pos] = max(abs(A(k:n,k))); % Prendo le righe da k in giù nella colonna corrente
        % In pratica scarto il valore e prendo solo la posizione

        % Però ho il valore nel vettore che sto considerando, non della
        % matrice originale:
        l = pos + k - 1;

        % E poi scambio le righe:
        % Prendo la riga k E la riga l
        A([k l], :) = A([l k], :);
        b([k l]) = b([l k]);


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
    b2 = b;
end