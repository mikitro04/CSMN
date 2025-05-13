function [x, k] = bisec(fun, a, b, tol, kmax)

    flag = true;
    k = 0;

    %vari controlli

    %verificare se la funzione esiste nell'intervallo tra a e b
    %f(a) * f(b) < 0
    fa = fun(a);
    fb = fun(b);

    if fa * fb > 0
        error("Nessuna radice nell'intervallo [a, b]");
    end

    while flag
        %punto di bisezione
        c = (a + b) / 2 ;
    
        fc = fun(c);

        if (abs(fc) > tol)      %per vedere se = 0 usiamo la tolleranza visto che non è mai uguale a 0
            flag = true;
        else
            break;
        end

        k = k+1;
        if k >= kmax
            break
        end
    
        if fc * fa < 0
            b = c;
            fb = fc;
        elseif fc * fb < 0
            a =  c;
            fa = fc;
        end
    
        
    end

    if(k >= kmax)
        x = inf;
        warning("è stato raggiunto kmax");
    end

    x = c;

end