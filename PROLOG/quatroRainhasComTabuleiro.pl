%------------------------------------------------------------------------------------    
% Problema das 4 rainhas Prolog

%	Data: 30/05/2021

% -----------------------------------------------------------------------------------

% Importa pacote tabuleiro
:- use_rendering(chess).

% -----------------------------------------------------------------------------------

% Declara regra com número de rainhas
rainhas(N, Rainhas) :-
    
    % Condição de predicado
    length(Rainhas, N),
    
    % Desenha rainhas no tabuleiro 
	tabuleiro(Rainhas, Tabuleiro, 0, N, _, _),
    
    % Executa a função rainhas de forma recursiva
	rainhas(Tabuleiro, 0, Rainhas).

% -----------------------------------------------------------------------------------

% Declara predicado de tabuleiro no tamanho N por N
tabuleiro([], [], N, N, _, _).

% Declara regra tabuleiro
tabuleiro([_|Rainhas], [Coluna-Variaveis|Tabuleiro], Coluna0, N, [_|VR], VC) :-
    
    % Declara variável Coluna igual a Coluna0 + 1
	Coluna is Coluna0 + 1,
    
    % Condição de referência ao nome da estrutura e nº de atomos 
	functor(Variaveis, f, N),
    
    % Verifica condição de restrições para linha e coluna
	restricoes(N, Variaveis, VR, VC),
    
    % Executa tabuleiros de forma recursiva
	tabuleiro(Rainhas, Tabuleiro, Coluna, N, VR, [_|VC]).

% -----------------------------------------------------------------------------------

% Declara regra permissão de dominio da variável
restricoes(0, _, _, _) :- !.

% Declara regra de restrição de Rainha na mesma Linha
restricoes(N, Linha, [R|Rs], [C|Cs]) :-
    
    % Verifica o termo do argumento na posição da linha
	arg(N, Linha, R-C),
    
    % Decrementa coluna M para N-1
	M is N-1,
    
    % Executa restrições de forma recursiva nas colunas M
	restricoes(M, Linha, Rs, Cs).

% -----------------------------------------------------------------------------------

% Declara predicado rainhas
rainhas([], _, []).

% Declara regra de rainhas
rainhas([C|Cs], Linha0, [Coluna|Solucao]) :-
    
    % Incrementa linhas
	Linha is Linha0 + 1,
    
    % Substitui elemento Coluna-Variáveis
	select(Coluna-Variaveis, [C|Cs], Tabuleiro),
    
    % Verifica o termo do argumento na posição e na linha
	arg(Linha, Variaveis, Linha-Linha),
    
    % Executa rainhas de forma recursiva
	rainhas(Tabuleiro, Linha, Solucao).

% -----------------------------------------------------------------------------------

% Consulta Solução
% ? rainhas(4, Rainhas).

% -----------------------------------------------------------------------------------
