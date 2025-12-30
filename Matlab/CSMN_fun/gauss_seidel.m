function [x, k] = gauss_seidel(A, b, x0, tau, k_max)

    % gauss_seidel: metodo per trovare un'approssimazione delle radici 
    % tramite iterazioni successive di un sistema di equazioni lineari
    %   [x, k] = gauss_seidel(A, b, x0, tau, k_max) restituisce le 
    % soluzioni della matrice e il numero di iterazioni effettuate.

    % tau e k_max sono le condizioni d'arresto:
        % tau = tolleranza
        % k_max = iterazioni massime
    
    % Controllo del numero di parametri in input
    if (nargin > 5)
        error("Sono stati inseriti troppi parametri in input");
    end
    
    % Controllo che la matrice non sia singolare
    if (abs(det(A)) < 1e-12)
        error("Il sistema può non ammettere soluzioni");
    end
    
    % Nel caso la funzione gauss_seidel venga chiamata con meno parametri, 
    % allora imposto manualmente i parametri mancanti
    if (nargin < 5)
        k_max = 1000;
    end
    if (nargin < 4)
        tau = 1e-14;
    end
    if (nargin < 3)
        x0 = zeros(size(A, 1), 1);
        x0(1) = 1;
    end
    
    % A = D - E - F
    
    % diag() restituisce un vettore, quindi diag() su di esso mi rende una 
    % matrice con tutti 0 tranne la diagonale, che avrà i valori del
    % vettore
    D = diag(diag(A));
    
    %E = (tril(A) - D) * -1;
    E = -tril(A, -1);
    
    F = -triu(A, 1);
    
    %Bgs = (D - E)^-1 * F;
    Bgs = (D - E) \ F;
    
    %fgs = (D - E)^-1 * b;
    fgs = (D - E) \ b;
    
    % Un MLS1 converge quando il rho della matrice di iterazione è < 1
    rho = abs(eigs(Bgs, 1, 'largestabs')); % anche con largestabs restituisce l'autovalore col suo segno originario
    
    if (rho >= 1)
        error("Il metodo non converge");
    end
    

    % Inizializzazione variabili
    x_old = x0;
    flag = true;
    k = 1;


    while (flag)

        % Condizione di stop per massimo numero di iterazioni
        if (k >= k_max)
            warning("k_max è stato raggiunto");
            break;
        end
    
        % Passo iterativo Gauss-Seidel
        x_new = Bgs * x_old + fgs;
    
        % Condizione di stop per soluzioni accettabili, cioè abbastanza
        % vicine alla soluzione reale
        if (norm(x_new - x_old) < tau * norm(x_new))
            flag = false;
        else
            % Aggiornamento variabili per l'iterazione successiva
            x_old = x_new;
            k = k + 1;
        end
    end
    
    x = x_new;
end