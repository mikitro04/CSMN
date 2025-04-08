function res = isorth(O)        %firma della funzione
    if(size(O) == [0,0])
        res = false;
        return
    end
    res = isequal(O', inv(O));
end

%il return è implicito alla fine della funzione
%il comando return serve come uscita dalla funzione

%isequal restituisce true o false, mentre == tra due matrici restituisce
 %una matrici con valori booleani lì dove i valori sono 1 = uguali; 
 % 0 = %diversi
%
%