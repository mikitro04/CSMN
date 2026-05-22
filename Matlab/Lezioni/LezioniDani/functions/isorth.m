% Il file deve obbligatoriamente chiamarsi con il nome della funzione

% La firma della funzione è fatta in modo che 'res' in questo caso sia
% proprio il valore di ritorno della funzione. Dopo l'uguale si ha il nome
% e i parametri in ingresso, invece per ritornare prima un valore lo devo
% assegnare alla variabile chiamata dopo 'function' e usare 'return'.
function res = isorth(O)

    if(size(O) == [0, 0])
        res = false;
        return % Early exit
    end
    res = isequal(O', inv(O))
end