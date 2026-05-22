function [x, k] = bisec(fun, a, b, tol, kmax)
    % fa * fb < 0
    fa = fun(a);
    fb = fun(b);
    
    if fa * fb > 0
        error("Nessuna radice nell'intervallo [a, b]");
    end

    k = 0;
    flag = true;
    while(flag)
        c = (a + b) / 2; 
        fc = fun(c);
    
        if (abs(fc) > tol) % Sempre usare questo invece che lo 0
            flag = true;
        else
            break;
        end

        k = k + 1;
        if (k >= kmax)
            break;
        end

        if (fc * fa < 0)
            b = c;
            fb = fc;
        elseif (fc * fb < 0)
            a = c;
            fa = fc;
        end
    
    end

    if (k >= kmax)
        x = inf;
        warning("è stato raggiunto kmax");
    else
        x = c;
    end

end