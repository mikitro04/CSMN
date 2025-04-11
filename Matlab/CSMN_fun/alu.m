function [L, U] = alu(A) 
    [m, n] = size(A);

    if m ~= n
        error("La matrice A deve essere quadrata")
    end

    if abs(det(A)) < 1e-10
        error("la matrice A è singolare")
    end

    L = zeros(n);

    for k = 1 : n-1
        for i = k+1 : n
            m = A(i, k)/A(k,k);
            %for j = k + 1 : n
            %    A(i, j) = A(i, j) - m * A(k, j);
            %end
            A(i, :) = A(i, :) - m * A(k, :);
            L(i, k) = m;
        end
    end
    U = A;
    L = L + eye(n);
end