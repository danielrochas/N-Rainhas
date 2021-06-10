
%------------------------------------------------------------------------------------    
% Problema das 4 rainhas

%	Data: 30/05/2021

% -----------------------------------------------------------------------------------

% Declara regras da posição de rainhas, exemplo Linhas = [2, 4, 1, 3]
rainhas(N, Posicao) :- lista_rainhas(N, Linhas), 
	rainhas(Linhas , [], Posicao).

% Declara predicado de posicionamento das rainhas
rainhas([], Posicao , Posicao). 

% ------------------------------------------------------------------------------------

% Declara regra de posicionamento de rainhas
rainhas(NaoPosicionada , Posicionada , Posicao) :-
    
    % Seleciona nova rainha exemplo R = 4, Nova não posicionada = [3,2,1]
	select(NaoPosicionada , R, NovaNaoPosicionada ), 
    
    % Condição de falha no ataque
	posicaoSegura(Posicionada , R, 1), 
    
    % Se a posição é segura escolhe a próxima rainha
	rainhas(NovaNaoPosicionada , [R|Posicionada], Posicao).

% ------------------------------------------------------------------------------------

% Declara predicado de posição segura
posicaoSegura([], _Rainha , _Nb).

% Declara regra de posição segura de forma recursiva
posicaoSegura([Y|Ys], Rainha , Nb) :-
    
    % Comparação de igualdade com rainhas já posicionadas pra frente e pra trás
	Rainha =\= Y + Nb ,
    Rainha =\= Y - Nb ,
    
    % Declara Nb1 como aumento da distância para recursividade
    Nb1 is Nb + 1,
    
    % Executa posição segura de forma recursiva
	posicaoSegura(Ys , Rainha , Nb1).

% ------------------------------------------------------------------------------------

% Declara predicado de seleção 
select([X|Ys], X, Ys).

% Declara regra de seleção
select([Y|Ys], X, [Y|Zs]) :- select(Ys , X, Zs).

% ------------------------------------------------------------------------------------

% Declara predicado lista de rainhas
lista_rainhas(0, []).

% Declara regra para lista de rainhas
lista_rainhas(N, [N|Linhas]) :-
    
    % Condição de N maior que 0
	N > 0,
    
    % Declara incremento de N em N1 para recursividade
    N1 is N - 1,
    
    % Executa função de forma recursiva até N <= 0
    lista_rainhas(N1 , Linhas).

% ------------------------------------------------------------------------------------

% Query para rodar algoritimo
% rainhas(4, Posicao)

% ------------------------------------------------------------------------------------






