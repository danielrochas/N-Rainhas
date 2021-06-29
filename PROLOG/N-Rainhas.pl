%------------------------------------------------------------------------------------------------------------    

% Programa das N rainhas Script Prolog

%------------------------------------------------------------------------------------------------------------

% Declara procedimento para posicionamento de rainhas, exemplo Linhas = [2, 4, 1, 3]
rainhas(N, Posicao) :-
    
    % Verifica condição de procedimento lista_rainhas
    lista_rainhas(N, Linhas),
    
    % Verifica condição de chamada do procedimento rainhas de forma recursiva
	rainhas(Linhas , [], Posicao).

% Declara predicado de posicionamento das rainhas
rainhas([], Posicao , Posicao).

%------------------------------------------------------------------------------------------------------------

% Declara procedimento de posicionamento das rainhas
rainhas(NaoPosicionada , Posicionada , Posicao) :-
    
    % Verifica condição de seleção de NaoPosicionada na lista R retorna lista NovaNaoPosicionada
	select(NaoPosicionada, R, NovaNaoPosicionada),
    
    % Verifica condição de falha no ataque
	posicaoSegura(Posicionada , R, 1),
    
    % Verifica condição de chamada recursiva do procedimento rainhas para posicionar NovaNaoPosicionada
	rainhas(NovaNaoPosicionada , [R|Posicionada], Posicao).

%------------------------------------------------------------------------------------------------------------

% Declara predicado de posição segura
posicaoSegura([], _Rainha , _Nb).

% Declara procedimento de posição segura de forma recursiva
posicaoSegura([Y|Ys], Rainha , Nb) :-
    
    % Verifica condição de comparação de igualdade com rainhas já posicionadas pra frente e pra trás
	Rainha =\= Y + Nb ,
    Rainha =\= Y - Nb ,
    
    % Verifica Condição de incremento de Nb em Nb1 para chamada recursiva do procedimento
    Nb1 is Nb + 1,
    
    % Verifica condição de chamda recursiva  do procedimento posiçãoSegura para próxima posição
	posicaoSegura(Ys , Rainha , Nb1).

%------------------------------------------------------------------------------------------------------------

% Declara predicado de seleção
select([X|Ys], X, Ys).

% Declara procedimento de seleção da variável X no restante da primeira lista Ys retornando lista Zs
select([Y|Ys], X, [Y|Zs]) :- select(Ys , X, Zs).

%------------------------------------------------------------------------------------------------------------

% Declara predicado lista de rainhas iniciado relação de lista_rainhas do inteiro 0 com lista vazia
lista_rainhas(0, []).

% Declara procedimento para verificar se a variável N é a primeira posição na lista
lista_rainhas(N, [N|Linhas]) :-
    
    % Verifica condição de N maior que 0
	N > 0,
    
    % Verifica condição para atualizar decremento de contador N1 para chamada recursiva de lista_rainhas
    N1 is N - 1,
    
    % Verifica condição de chamada do procedimento lista_rainhas de forma recursiva até N <= 0
    lista_rainhas(N1 , Linhas).

%------------------------------------------------------------------------------------------------------------

% Consulta para executar programa
% ? rainhas(4, Posicao)

%------------------------------------------------------------------------------------------------------------

