function [x, k] = corde(fun, m, x0, tol, kmax)
    %controllare se x è già la nostra soluzione
    if(abs(fun(x0)) < tol)
        x = x0;
        return
    end

    flag = 1;
    x_new = x0;
    k = 0;

    while flag
        k = k + 1;
        xk = x_new;
        fk = fun(xk);

        x_new = xk - (fk/m);

        flag = (abs(x_new - xk) > abs(xk) * tol) && (k < kmax) && (abs(fun(x_new)) > tol);
    end

    if(k >= kmax)
        warning("Raggiunto kmax");
        x = inf;
    else
        x = x_new;
    end

end