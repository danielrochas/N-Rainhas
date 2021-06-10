/*

Implementação do algoritmo para solução do problema quatro rainhas no tabuleiro 4 x 4.
Data: 06/10/2021

*/

// Declara classe public quatroRainhas
public class quatroRainhas {

    // Declara variavel global N_RAINHAS
    public static int N_RAINHAS = 4;

    // Declara metodo estatico principal
    public static void main(String[] args) {

        // Declara tabuleiro
        int [] tabuleiro = {-1, -1, -1, -1};

        // Laco para coluna 0
        for (int i = 0; i < N_RAINHAS; i++) {

            // Popula posição (linha) da rainha na coluna 1 do tabuleiro
            tabuleiro[0] = i;

            // Laco para coluna 1
            for (int j = 0; j < N_RAINHAS; j++) {

                // Popula posição (linha) da rainha na coluna 2 do tabuleiro
                tabuleiro[1] = j;

                // Condição de posicionamento coluna 1
                if (permitido(tabuleiro, 1)) {

                    // Laco para coluna 2
                    for (int k = 0; k < N_RAINHAS; k++) {

                        // Popula posição (linha) da rainha na coluna 3 do tabuleiro
                        tabuleiro[2] = k;

                        // Condição de posicionamento coluna 2
                        if (permitido(tabuleiro, 2)) {

                            // Laço para outra linhas da coluna 3
                            for (int l = 0; l < N_RAINHAS; l++) {

                                // Popula posição (linha) da rainha na coluna 3 do tabuleiro
                                tabuleiro[3] = l;

                                // Condição de posicionamento coluna 3
                                if (permitido(tabuleiro, 3)) {

                                    // Executa método para mostrar a posição das rainhas no tabuleiro
                                    mostraRainha(tabuleiro);
                                }
                            }
                        }
                    }
                }
            }

        }
    }

    // Declara método privado para mostrar rainhas no tabuleiro
    private static void mostraRainha(int[] tabuleiro) {

        // Imprime divisória no console
        System.out.println("--------------------------");

        // Declara tamanho do tabuleiro
        int n = tabuleiro.length;

        // Laço para linhas dos tabuleiros da solução
        for (int row = 0; row < n; row++) {

            // Laço para valores no tabuleiro
            for (int value : tabuleiro) {

                // Verifica condição de igualdade valor e linha
                if (value == row) {

                    // Se equivalente imprime no console "R" na posição
                    System.out.print("R\t");

                } else {

                    // Se não equivalente imprime "*" na posição
                    System.out.print("*\t");

                }
            }

            // Imprime quebra de linha no console
            System.out.println();
        }
    }

    // Declara método privado para verificar se o posicionamento da rainha é permitido
    private static boolean permitido(int[] tabuleiro, int rainhaColunaAtual) {

        // Laço para colunas menores que a coluna atual
        for (int i = 0; i < rainhaColunaAtual; i++) {

            // Verifica a rainha da próxima coluna está na mesma linha das rainhas anteriores
            if (tabuleiro[i] == tabuleiro[rainhaColunaAtual])

                // Se verdadeiro retorna que a posição não é permitida
                return false;

            // Verifica se a rainha da próxima coluna está na mesma diagonal das rainhas anteriores
            if ((rainhaColunaAtual - i) == Math.abs(tabuleiro[rainhaColunaAtual] - tabuleiro[i])) {

                // Se verdadeiro retorna que a posição não é permitida
                return false;
            }
        }

        // Retorno do método privado para verificar linhas e diagonais
        return true;
    }

}