function [x, k] = secanti(fun, x0, x1, tol, kmax)
    % Controlla se x0 è già una soluzione
    if abs(fun(x0)) < tol
        x = x0;
        k = 0;
        return
    end

    k = 0;
    x_new = x1;
    flag = true;

    while flag
        x0 = x1;
        x1 = x_new;

        f0 = fun(x0);
        f1 = fun(x1);
        m = (f1 - f0) / (x1 - x0);

        if abs(m) < tol
            error("m è vicino allo 0, cambia x0 e x1");
        end

        x_new = x1 - f1 / m;
        k = k + 1;

        % Usa x1 al posto di xk
        flag = (abs(x_new - x1) > abs(x1) * tol) && (k < kmax) && (abs(fun(x_new)) > tol);
    end

    if k >= kmax
        warning("Raggiunto kmax");
        x = inf;
    else
        x = x_new;
    end
end
