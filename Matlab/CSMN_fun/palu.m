function [L, U, P] = palu(A)

    % palu: metodo per fattorizzare la matrice A con pivoting
    % parziale.
    %   [L, U, P] = palu(A) restituisce una matrice di permutazione,
    % una triangolare superiore e una triangolare inferiore

    [m, n] = size(A);

    % Controlli preliminari sulle dimensioni della matrice e sul
    % determinante
    if m ~= n
        error("la matrice deve essere quadrata");
    end
    if abs(det(A)) < 1e-10
        error("La matrice A è singolare");
    end

    % Inizializzazione matrici
    L = zeros(n);
    P = eye(n);

    
    for k = 1 : n-1

        % Seleziono il pivot massimo in valore assoluto nella colonna
        % k-esima
        [~, index] = max(abs(A(k:n, k)));
        % l è l'indice della riga con pivot massimo
        l = index + k - 1;

        % Scambio delle righe
        A([k l], :) = A([l k], :);
        L([k l], :) = L([l k], :);
        P([k l], :) = P([l k], :);
        
        % Calcolo la nuova riga
        for i = k+1 : n
            m = A(i, k) / A(k, k);

            A(i, :) = A(i, :) - m * A(k, :);

            L(i, k) = m;
        end
    end

    % Assegno il valore corretto alle matrici da restituire
    U = A;
    L = L + eye(n);
end