%Ax = b
%Risolvibile con x = A\b
%GAUSS

function [U, d] = gauss(A, b)
    %funzione che calcola la riduzione di Gauss e prende in input la
    %matrice A e il vettore di termini noti b.

    if size(A,1) ~= size(A,2)
        error("La matrice A deve essere quadrata")
    end

    n = size(A,1);

    for k = 1 : n-1
        for i = k+1 : n
            m = A(i, k)/A(k,k);
            %for j = k + 1 : n
            %    A(i, j) = A(i, j) - m * A(k, j);
            %end
            A(i, :) = A(i, :) - m * A(k, :);
            b(i) = b(i) - m * b(k);
        end
    end
    U = A;
    d = b;
    %in generale meglio evitare di creare strutture nuove, si poteva usare
    %come output A e b
end