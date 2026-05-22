function [L, U] = alu(A)

    % alu: metodo per fattorizzare la matrice A.
    %   [L, U] = alu(A) restituisce una matrice di permutazione,
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

    % Inizializzazione matrice
    L = zeros(n);

    for k = 1 : n-1
        for i = k+1 : n
            m = A(i, k) / A(k, k);

            % Calcolo la nuova riga
            A(i, :) = A(i, :) - m * A(k, :);

            L(i, k) = m;
        end
    end

    % Assegno il valore corretto alle matrici da restituire
    U = A;
    L = L + eye(n);
end