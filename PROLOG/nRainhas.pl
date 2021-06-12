%-------------------------------------------------------------------------------------------------    

% Program das N rainhas Script Prolog

% Data: 12/06/2021

%-------------------------------------------------------------------------------------------------

% Declara diretiva para utilizar tabuleiro de xadrez
:- use_rendering(chess).

%-------------------------------------------------------------------------------------------------

% Declara procedimento com 2 variaveis sendo o número de rainhas N e a lista das posições
rainhas(N, Rainhas) :-
    
    % Verifica condição de predicado tamanho da lista igual a variável inteiro N
    length(Rainhas, N),
    
    % Verifica condição de tabuleiro 
	tabuleiro(Rainhas, Tabuleiro, 0, N, _, _),
    
    % Verifica condição da função rainhas de forma recursiva
	rainhas(Tabuleiro, 0, Rainhas).

%-------------------------------------------------------------------------------------------------

% Declara predicado de tabuleiro no tamanho N por N
tabuleiro([], [], N, N, _, _).

% Declara procedimento de tabuleiro para impressão dos resultados de posicionamento
tabuleiro([_|Rainhas], [Coluna-Variaveis|Tabuleiro], Coluna0, N, [_|VR], VC) :-
    
    % Verifica condição de atualização da variável Coluna igual a Coluna0 + 1
	Coluna is Coluna0 + 1,
    
    % Verifica condição de referência ao nome da estrutura e nº de atomos 
	functor(Variaveis, f, N),
    
    % Verifica condição de restrições para linha e coluna
	restricoes(N, Variaveis, VR, VC),
    
    % Verifica condição de chamda do procedimento tabuleiro de forma recursiva
	tabuleiro(Rainhas, Tabuleiro, Coluna, N, VR, [_|VC]).

%-------------------------------------------------------------------------------------------------

% Declara procedimento permissão de dominio da variável
restricoes(0, _, _, _) :- !.

% Declara procedimento de restrição de Rainha na mesma Linha
restricoes(N, Linha, [R|Rs], [C|Cs]) :-
    
    % Verifica condição do termo do argumento na posição da variável linha
	arg(N, Linha, R-C),
    
    % Verifica condição de decremento da coluna N para M contador que recebe N-1
	M is N-1,
    
    % Verifica condição de chamada do procedimento restrições de forma recursiva nas colunas M
	restricoes(M, Linha, Rs, Cs).

%-------------------------------------------------------------------------------------------------

% Declara predicado rainhas
rainhas([], _, []).

% Declara procedimento de rainhas
rainhas([C|Cs], Linha0, [Coluna|Solucao]) :-
    
    % Verifica condição de incremento da  variável Linha0 atribuido ao contador Linha
	Linha is Linha0 + 1,
    
    % Verifica condição de seleção de Colunas-Variaveis na lista [C|Cs] retorna lista tabuleiro
	select(Coluna-Variaveis, [C|Cs], Tabuleiro),
    
    % Verifica condição da posição do termo Linha-Linha na Linha ds Variáveis
	arg(Linha, Variaveis, Linha-Linha),
    
    % Verifica condição de chamada do procedimento rainhas de forma recursiva
	rainhas(Tabuleiro, Linha, Solucao).

%-------------------------------------------------------------------------------------------------

% Consulta Solução
% ? rainhas(4, Rainhas).

%-------------------------------------------------------------------------------------------------
