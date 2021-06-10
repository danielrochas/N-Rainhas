; Define função condição de segurança da rainha na posição x y
(defun verifica-posicao (x y rainhas)
    
  ; Verifica condição de posicionamento da rainha
  (cond 
      
    ; Verifica se rainha da vez é membro da condição de linha
    ((member t (mapcar #'(lambda (xy) (or (= x (car xy)) (= y (cadr xy)))) rainhas)) nil)
    
    ; Verifica se rainha da vez é membro da condição diagonal
    ((member t (mapcar #'(lambda (xy) (= 1 (abs (/ (- x (car xy)) (- y (cadr xy)))))) rainhas)) nil)
    (t)
  )
)

; Define posicionamento recursivo da rainha em x e y na ordem: (1 1) ~ (max max)
(defun posicione-laco (x y rainhas max)
    
  ; Condição de posicionamento seguro  
  (cond
      
    ; Se verdadeiro Imprime tuplas (coluna linha) de posições da solução
    ((= max (length rainhas)) (print (list 'Solução rainhas)) (cdr rainhas))
    
    ; Caso contrario passa para proxima (coluna linha)
    ((or (> x max) (> y max)) (cdr rainhas)) 
    
    ; Verifica se pode posicionar a rainha
    ((verifica-posicao x y rainhas)
    
      ; Define conjunto, aplica laço recursivo com contador x + 1 e empilha rainha
      (setq rec (posicione-laco (+ 1 x) 1 (append (list (list x y)) rainhas) max))
      
      ; Verifica condição de coluna
      (cond
          
        ; Condição de laço recursivo com contador y + 1 e conjunto rec verdadeiro
        ((equal rainhas rec) (posicione-laco x (+ 1 y) rainhas max)) 
        (t rec)
      )
     )
        
    ; Executa a função de forma recursiva incrementando coluna y
    (t (posicione-laco x (+ 1 y) rainhas max))
  )
)

; Define função
(defun posicione (max rainhas)

    ; Executa o laço
    (posicione-laco 1 1 rainhas max))

; Imprime solução com 4 rainhas
(print (list 'Solução (posicione 4 '()))) 