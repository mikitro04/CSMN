function [U, b2] = gauss_pivot(A, b)
    %funzione che calcola la riduzione di Gauss con pioting e prende 
    % in input la matrice A e il vettore di termini noti b.

    [m, n] = size(A);

    if m ~= n
        error("La matrice A deve essere quadrata")
    end

    if size(b, 1) ~= n || size(b, 2) ~= 1 
        error("il vettore b deve essere un vettore colonna con n righe")
    end

    if abs(det(A)) < 1e-10
        error("la matrice A è singolare")
    end

    for k = 1 : n - 1 
        [~, pos] = max(abs(A(k : n, k)));

        l = pos + k - 1;
        
        %inverto le righe l e k
        A([k l], :) = A([l k], :);
        b([k l]) = b([l k]);

        for i = k + 1 : n
            m = A(i, k) / A(k, k);
            A(i, :) = A(i, :) - m * A(k, :);
            b(i) = b(i) - m * b(k);
        end
    end
    U = A;
    b2 = b;
end