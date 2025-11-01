
# Para probar cada implementacion:
```
$ alex Lexer.x
$ happy Grammar.y
$ ghci
ghci> :l ASA.hs AST.hs ASV.hs Token.hs Lexer.hs Grammar.hs Desugar.hs
```

## Lexer:
```
ghci> Lexer.lexer "(+ 1 2 3 4)"
```

```
ghci> import Lexer
ghci> lexer "(+ 1 2 3 4)"

```

## Parser:
```
ghci> import Grammar
ghci> tokens = Lexer.lexer "(+ 1 2 3 4)"
ghci> parse tokens
Add [Num 1,Num 2,Num 3,Num 4]
```

Nuestro parser funciona porque, por ejemplo, al intentar dar un numero de argumentos invalida sale error en el aprser:
```
ghci> tokens = lexer "(+ 1)"
ghci> parse tokens 
*** Exception: Parser Error
CallStack (from HasCallStack):
  error, called at Grammar.hs:1210:16 in main:Grammar
ghci> tokens = lexer "(+ 1 2)"
ghci> parse tokens 
Add [Num 1,Num 2]
ghci> 
```


```
[src/] > alex Lexer.x 
[src/] > happy Grammar.y 
[src/] > ghci
GHCi, version 9.4.5: https://www.haskell.org/ghc/  :? for help
ghci> :l Token.hs ASA.hs AST.hs ASV.hs Lexer.hs Grammar.hs Desugar.hs Interprete.hs MiniLisp.hs 
[1 of 9] Compiling ASA              ( ASA.hs, interpreted )
[2 of 9] Compiling AST              ( AST.hs, interpreted )
[3 of 9] Compiling ASV              ( ASV.hs, interpreted )
[4 of 9] Compiling Desugar          ( Desugar.hs, interpreted )
[5 of 9] Compiling Interprete       ( Interprete.hs, interpreted )
[6 of 9] Compiling Token            ( Token.hs, interpreted )
[7 of 9] Compiling Lexer            ( Lexer.hs, interpreted )
[8 of 9] Compiling Grammar          ( Grammar.hs, interpreted )
[9 of 9] Compiling MiniLisp         ( MiniLisp.hs, interpreted )
Ok, 9 modules loaded.
ghci> import Lexer
ghci> import Grammar
ghci> import Desugar
ghci> import Interprete
ghci> import MiniLisp
ghci> 

```

```
(+ 3 7)
(* (- 8 3) (/ 12 3))

(add1 9)
(sub1 (sqrt 16))
(expt 7)

(= 4 4)
(< (* 3 2) (+ 5 5))
(not (> 9 2))

(4,5)
(fst ((+ 3 7), (* 2 5)))
(snd (1, (add1 8)))

(if (= (+ 2 3) 5) #t #f)
(cond [(< 4 3) 8] [(= 5 5) 9] [else 0])

(let ((x 3) (y 7)) (+ x y))
(let ((x 2) (y (* x 5))) (+ x y))
(let ((x 5) (y 3)) (* (+ x y) (- x y)))
(let ((a 10) (b (** 3))) (if (> b a) (- b a) (+ b a)))
(let ((x 2) (y 4)) (let ((z (* x y))) (+ z (** y))))

(let* ((x 2) (y (+ x 3))) (* x y))
(let* ((a 1) (b (+ a 1)) (c (+ b 1))) (+ a b c))
(let* ((x 2) (y (* x 3)) (z (+ y 4))) (* x y z))
(let* ((a 3) (b (** a)) (c (+ b 1))) (/ c a))
(let* ((base 2) (doble (* base 2)) (cuadrado (** doble))) (+ base doble cuadrado))

(letrec (fact (lambda (n) (if (= n 0) 1 (* n (fact (- n 1)))))) (fact 5))
(letrec (fib (lambda (n) (if (< n 2) n (+ (fib (- n 1)) (fib (- n 2)))))) (fib 6))
(letrec (pow (lambda (b e) (if (= e 0) 1 (* b (pow b (- e 1)))))) (pow 3 4))

((lambda (x) (+ x 5)) 3)
(let ((inc (lambda (x) (+ x 1)))) (inc 10))





ghci> :l MiniLisp.hs 
[1 of 9] Compiling ASA              ( ASA.hs, interpreted )
[2 of 9] Compiling AST              ( AST.hs, interpreted )
[3 of 9] Compiling ASV              ( ASV.hs, interpreted )
[4 of 9] Compiling Desugar          ( Desugar.hs, interpreted )
[5 of 9] Compiling Interprete       ( Interprete.hs, interpreted )
[6 of 9] Compiling Token            ( Token.hs, interpreted )
[7 of 9] Compiling Lexer            ( Lexer.hs, interpreted )
[8 of 9] Compiling Grammar          ( Grammar.hs, interpreted )
[9 of 9] Compiling MiniLisp         ( MiniLisp.hs, interpreted )
Ok, 9 modules loaded.
ghci> main
Bienvenido a MiniLisp 
Escriba (exit) para salir.
[MiniLisp]> (+ 3 7)
10
[MiniLisp]> (* (- 8 3) (/ 12 3))
20
[MiniLisp]> (++ 9)
10
[MiniLisp]> (** 7)
49
[MiniLisp]> (= 4 4)
#t
[MiniLisp]> (< (* 3 2) (+ 5 5))
#t
[MiniLisp]> (not (> 9 2))
#f
[MiniLisp]> (if (= (+ 2 3) 5) #t #f)
#t
[MiniLisp]> (cond [(< 4 3) 8] [(= 5 5) 9] [else 0])
9
[MiniLisp]> (let ((x 3) (y 7)) (+ x y))
10
[MiniLisp]> (let ((x 2) (y (* x 5))) (+ x y))
12
[MiniLisp]> (let ((x 5) (y 3)) (* (+ x y) (- x y)))
16
[MiniLisp]> (let ((a 10) (b (** 3))) (if (> b a) (- b a) (+ b a)))
19
[MiniLisp]> (let ((x 2) (y 4)) (let ((z (* x y))) (+ z (** y))))
24
[MiniLisp]> (let* ((x 2) (y (+ x 3))) (* x y))
10
[MiniLisp]> (let* ((a 1) (b (+ a 1)) (c (+ b 1))) (+ a b c))
6
[MiniLisp]> (let* ((x 2) (y (* x 3)) (z (+ y 4))) (* x y z))
120
[MiniLisp]> (let* ((a 3) (b (** a)) (c (+ b 1))) (/ c a))
3
[MiniLisp]> (let* ((base 2) (doble (* base 2)) (cuadrado (** doble))) (+ base doble cuadrado))
22
~~~Letrec
[MiniLisp]> ((lambda (x) (+ x 5)) 3)
8
[MiniLisp]> (let ((inc (lambda (x) (+ x 1)))) (inc 10))
11
[MiniLisp]> :q
Bye :)
ghci> 
```


## LetRec:
```
[MiniLisp]> (letrec (sum (lambda (n) (if0 n 0 (+ n (sum (- n 1)))))) (sum 3))
[Error]: Var 'Z' no definida
CallStack (from HasCallStack):
  error, called at ./Interprete.hs:154:18 in main:Interprete
[MiniLisp]> 

```

```
[MiniLisp]> (letrec (sum (lambda (n) (if0 n 0 (+ n (sum (- n 1)))))) (sum 3))
[Error]: Var 'v' no definida
CallStack (from HasCallStack):
  error, called at ./Interprete.hs:154:18 in main:Interprete
[MiniLisp]> 
```
