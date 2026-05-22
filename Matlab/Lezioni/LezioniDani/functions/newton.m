function [x, k] = newton(fun, fund, x0, tol, kmax)
    
    k = 0;
    if (abs(fun(x0)) < tol)
        x = x0;
        return
    end

    x_new = x0;
    flag = 1;
    while flag
        k = k + 1;
        xk = x_new;
        fk = fun(xk);
        fdk = fund(xk);

        if abs(fdk) < tol
            error("La derivata si annulla, cambia x0");
        end

        x_new = xk - fk / fdk;

        
        flag = (abs(x_new - xk) > abs(xk) * tol) && (k < kmax) && abs(fun(x_new)) > tol;

    end

    if k >= kmax
        warning("Raggiunto kmax");
        x = inf;
    else
        x = x_new;
    end

end