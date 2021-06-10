; Define função condição de segurança para posicionamento da lista vazia rainhas na posição x y
(defun verifica-posicao (x y rainhas)
    
  ; Verifica condição de posicionamento da rainha
  (cond 
      
    ; Verifica se cada átomo rainha da s-expression rainhas não é membro da mesma linha e coluna de forma recursiva
    ((member t (mapcar #'(lambda (xy) (or (= x (car xy)) (= y (cadr xy)))) rainhas)) nil)
    
    ; Verifica se cada átomo rainha da s-expression não é membro de alguma diagonal onde ocorre o ataque de outra rainha de forma recursiva
    ((member t (mapcar #'(lambda (xy) (= 1 (abs (/ (- x (car xy)) (- y (cadr xy)))))) rainhas)) nil)
      
    ; Se ambas as condições são satisfeitas a função retorna o átomo verdadeiro   
    (t)
      
  )
    
)

; Define função de posicionamento recursivo das rainhas com parâmetro x e y na ordem: (linha coluna) e parâmetro número máximo de rainhas max e lista vazia de rainhas 
(defun posicione-laco (x y rainhas max)
    
  ; Condição de impressão das s-expressions de posicionamento das rainhas no tabuleiro (linha coluna)  
  (cond
      
    ; Se verdadeiro Imprime tuplas (coluna linha) de posições da solução na lista vazia de rainhas
    ((= max (length rainhas)) (print (list 'Solução rainhas)) (cdr rainhas))
    
    ; Caso contrario passa para proxima (coluna linha)
    ((or (> x max) (> y max)) (cdr rainhas)) 
    
    ; Verifica se pode posicionar a rainha
    ((verifica-posicao x y rainhas)
    
      ; Define conjunto, aplica laço recursivo com contador x + 1 e empilha rainha na lista vazia rainhas retorna valor do segundo argumento na lista de associação
      (setq rec (posicione-laco (+ 1 x) 1 (append (list (list x y)) rainhas) max))
      
      ; Verifica condição de coluna
      (cond
          
        ; Condição de laço recursivo com contador y + 1 e conjunto rec verdadeiro
        ((equal rainhas rec) (posicione-laco x (+ 1 y) rainhas max))
          
        ; Caso a condição seja satisfeita a função retorna s-expression (t rec)  
        (t rec)
          
      )
     
    )
        
    ; Executa a função de forma recursiva incrementando coluna com y + 1
    (t (posicione-laco x (+ 1 y) rainhas max))
      
  )
    
)

; Define função de impressão das linhas e colunas onde as rainhas serão posicionadas da direita para esquerda colunas(4,3,2,1) x linhas(1,2,3,4)
(defun posicione (max rainhas)

    ; Executa a função posiciona-laço com posicição inicial x e y (1, 1) com parâmetro máximo de rainhas
    (posicione-laco 1 1 rainhas max))

; Imprime solução com parâmetro máximo de rainhas igual a 4 para resolver problema com 4 rainhas no tabuleiro 4 x 4 passando lista vazia para parâmetro rainhas
(print (list 'Solução (posicione 4 '()))) 
